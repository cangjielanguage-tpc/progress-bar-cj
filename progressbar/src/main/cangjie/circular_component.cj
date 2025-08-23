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
public class CircularComponent {
    var circularBar: CircularPath = CircularPath()
    @State
    var progressPathCmd: String = ""
    @State
    var bgPathCmd: String = ""
    var bgColor: Int64 = -1
    @Link
    var color: UInt32 = 0x007DFF
    var mWidth: Float64 = 0.0
    private var mHeight: Float64 = 0.0
    private var progressMax: Float64 = 100.0
    var radius: Float64 = 45.0
    var strokeWidth: Float64 = 0.0
    var secondColor: Int64 = -1
    @State
    var progressSecondPathCmd: String = ""
    private var secondCircularBar: CircularPath = CircularPath()
    @Link
    var angle: Float64 = 0.0
    @Link
    var progressSecond: Float64 = 0.0
    @Consume
    @Watch[onChanged]
    var progress: Float64 = 1.0

    func onChanged() {
        launch {
            this.circularBar.setProgress(this.progress)
            this.circularBar.setAngle(this.angle)
            this.progressPathCmd = this.circularBar.getPathCmd()
            if (this.secondColor >= 0) {
                this.secondCircularBar.setProgress(this.progressSecond)
                this.secondCircularBar.setAngle(this.angle)
                this.progressSecondPathCmd = this.secondCircularBar.getPathCmd()
            }
        }
    }

    protected override func aboutToAppear() {
        this.mWidth = this.radius + this.strokeWidth
        this.mHeight = this.radius + this.strokeWidth
        var barPath: CircularPath = CircularPath()
        barPath.setStrokeWidth(this.strokeWidth)
        barPath.setRadius(this.radius)
        barPath.setMaxProgress(this.progressMax)
        barPath.setProgress(this.progress)
        barPath.setColor(this.color)
        barPath.setAngle(this.angle)

        this.circularBar = barPath
        this.progressPathCmd = this.circularBar.getPathCmd()
        if (this.secondColor >= 0) {
            var secondPath: CircularPath = CircularPath()
            secondPath.setStrokeWidth(this.strokeWidth)
            secondPath.setRadius(this.radius)
            secondPath.setMaxProgress(this.progressMax)
            secondPath.setProgress(this.progressSecond)
            secondPath.setColorSecond(this.secondColor)
            secondPath.setAngle(this.angle)

            this.secondCircularBar = secondPath
            this.progressSecondPathCmd = this.secondCircularBar.getPathCmd()
        }

        if (this.bgColor >= 0) {
            var bgPath: CircularPath = CircularPath()
            bgPath.setStrokeWidth(this.strokeWidth)
            bgPath.setRadius(this.radius)
            bgPath.setProgress(100.0)

            this.bgPathCmd = bgPath.getPathCmd()
        }
    }

    func build() {
        Column {
            Stack(Alignment.TopStart) {
                if (this.bgColor >= 0) {
                    Path().commands(this.bgPathCmd).stroke(UInt32(this.bgColor)).strokeWidth(this.strokeWidth).fillOpacity(0).
                        strokeLineCap(LineCapStyle.Round)
                }
                if (this.secondColor >= 0) {
                    Path().commands(this.progressSecondPathCmd).stroke(UInt32(this.secondColor)).strokeWidth(this.strokeWidth).
                        fillOpacity(0).strokeLineCap(LineCapStyle.Round)
                }
                Path().commands(this.progressPathCmd).stroke(this.color).strokeWidth(this.strokeWidth).fillOpacity(0).
                    strokeLineCap(LineCapStyle.Round)
            }.width(this.mWidth).height(this.mHeight)
        }
    }
}
