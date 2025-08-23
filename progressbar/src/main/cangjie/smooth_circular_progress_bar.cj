/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package progressBar

import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.concurrency.*

@Component
public class SmoothCircularProgressBar {
    var modelBuild: MaterialModel = MaterialModel()
    var progressInit: Float64 = 0.0 //默认从0进度值开始
    @Provide
    var progress: Float64 = 0.0
    @State
    var barColor: UInt32 = 0x3e802f //进度条默认为绿颜色
    var barColors: Array<UInt32> = [0x3e802f, 0xf4b400, 0x427fed, 0xb23424] //绿黄蓝红
    var barColorsIndex: Int64 = 0 //颜色组下标

    var spinSpeed: Float64 = 1.0 //默认速度
    @State
    var angle: Float64 = 10.0 //默认角度
    var progressStart: Bool = true //进度条运动的开始或结束，true表示开始，false表示结束
    var progressVisible: Visibility = Visibility.Visible //显隐控制

    @State
    @Watch[curveChange]
    var curve: Curve = Curve.Linear
    var curveTime: Float64 = 0.0
    var timer: ?Timer = Option<Timer>.None

    func curveChange() {
    }
    private func updateCurve(): Unit {
        this.curveTime += 0.01 * this.spinSpeed
        if (this.curveTime > 1.0) {
            this.curveTime = 0.0
            Timer.once(100 * Duration.millisecond) {
                => launch {this.barColor = this.getRandomColor()}
            }

            this.progress = 0.0
        }
        try {
            let tmp = min(1.0, this.curveTime)
            this.progress = 1.2 * tmp * 100.0
        } catch (err: Exception) {
            Hilog.warn(0x0000, "smooth circule", "---->curves.interpolate err ${err.message}")
        }
    }

    protected override func aboutToAppear() {
        this.timer = Timer.repeat(
            Duration.Zero,
            Duration.millisecond * 10,
            {
                => launch {
                    if (this.progressStart == false) {
                        this.progressVisible = Visibility.Hidden
                    } else {
                        this.progressVisible = Visibility.Visible
                    }
                    this.updateCurve()
                    this.angle = Float64(Int64(this.angle + this.spinSpeed * 2.0) % 360)
                }
            }
        )

        this.progress = this.modelBuild.progressInit
        this.spinSpeed = this.modelBuild.speed
        this.angle = this.modelBuild.angle
        if (this.modelBuild.colors.size != 0) {
            this.barColors = this.modelBuild.colors
        }
    }

    protected override func aboutToDisappear() {
        if (let Some(tTimer) <- this.timer) {
            tTimer.cancel()
        }
    }

    private func getRandomColor(): UInt32 {
        this.barColorsIndex++
        let index = this.barColorsIndex % this.barColors.size
        if (this.barColorsIndex >= this.barColors.size) {
            this.barColorsIndex = 0
        }
        return this.barColors[index]
    }

    func build() {
        Stack() {
            CircularComponent(
                color: this.barColor,
                strokeWidth: this.modelBuild.strokeWidth,
                radius: this.modelBuild.radius,
                angle: this.angle,
                progressSecond: 0.0
            )
        }.width(60).height(60).visibility(this.progressVisible)
    }
}
