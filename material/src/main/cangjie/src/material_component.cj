/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package material

import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*

@Component
public class MaterialComponent {
    @Provide
    var progress: Float64 = 0.0
    @State
    var angle: Float64 = 0.0

    var modelBuild: MaterialModel = MaterialModel()
    @State
    var mOffset: Float64 = 0.0
    private var timer: ?Timer = Option<Timer>.None
    private var isAddProgress: Bool = true

    protected override func aboutToAppear() {
        if (this.modelBuild.indeterminate || this.modelBuild.indeterminateAngle) {
            this.timer = Timer.repeat(
                Duration.Zero,
                Duration.millisecond * 30,
                {
                    => launch {
                        if (this.modelBuild.style == MaterialProgressStyle.MaterialCircular) {
                            this.updateCircular()
                        } else {
                            this.updateHorizontal()
                        }
                    }
                }
            )
        } else {
            this.progress = this.modelBuild.progress
            this.angle = this.modelBuild.angle
        }
    }

    private func updateHorizontal(): Unit {
        if (this.mOffset < 1000.0) {
            this.mOffset = this.mOffset + 20.0
            if (this.modelBuild.progress == 0.0) {
                this.modelBuild.progress = 30.0 + 4.0
                this.progress = this.modelBuild.progress
            } else {
                this.modelBuild.progress = this.modelBuild.progress + 4.0
                this.progress = this.modelBuild.progress
            }
        } else {
            this.mOffset = 0.0
            this.modelBuild.progress = 0.0
            this.progress = this.modelBuild.progress
        }
    }

    private func updateCircular() {
        if (this.modelBuild.indeterminateAngle) {
            this.modelBuild.angle = Float64((Int64(this.modelBuild.angle) + 5) % 360)
            this.angle = this.modelBuild.angle
            this.progress = this.modelBuild.progress
            if (this.modelBuild.indeterminate) {
                if (this.isAddProgress) {
                    this.modelBuild.progress = min(100.0, this.modelBuild.progress + 2.0)
                    this.progress = this.modelBuild.progress
                } else {
                    this.modelBuild.progress = max(0.0, this.modelBuild.progress - 20.0)
                    this.progress = this.modelBuild.progress
                }
                if (this.modelBuild.progress == 100.0 || this.modelBuild.progress == 0.0) {
                    this.isAddProgress = !this.isAddProgress
                }
            }
        } else {
            if (this.modelBuild.indeterminate) {
                this.modelBuild.progress = Float64((Int64(this.modelBuild.progress) + 2) % 100)
                this.progress = this.modelBuild.progress
            }
        }
    }
    protected override func aboutToDisappear() {
        if (let Some(tTimer) <- this.timer) {
            tTimer.cancel()
        }
        this.timer = Option<Timer>.None
    }
    func build() {
        if (this.modelBuild.indeterminateAngle) {
            if (this.modelBuild.style == MaterialProgressStyle.MaterialCircular) {
                Stack() {
                    CircularComponent(
                        progressSecond: this.modelBuild.progressSecond,
                        color: this.modelBuild.color,
                        secondColor: this.modelBuild.secondColor,
                        bgColor: this.modelBuild.bgColor,
                        radius: this.modelBuild.radius,
                        strokeWidth: this.modelBuild.strokeWidth,
                        angle: this.angle
                    )
                }.width(this.modelBuild.radius * 2.0 + 4.0).height(this.modelBuild.radius * 2.0 + 4.0)
            } else if (this.modelBuild.style == MaterialProgressStyle.MaterialHorizontal) {
                Stack() {
                    HorizontalComponent(
                        mOffset: this.mOffset,
                        progressSecond: this.modelBuild.progressSecond,
                        color: this.modelBuild.color,
                        secondColor: this.modelBuild.secondColor,
                        bgColor: this.modelBuild.bgColor,
                        strokeWidth: this.modelBuild.strokeWidth
                    )
                }
            }
        } else {
            Stack() {
                if (this.modelBuild.style == MaterialProgressStyle.MaterialCircular) {
                    CircularComponent(
                        progressSecond: this.modelBuild.progressSecond,
                        color: this.modelBuild.color,
                        secondColor: this.modelBuild.secondColor,
                        bgColor: this.modelBuild.bgColor,
                        radius: this.modelBuild.radius,
                        strokeWidth: this.modelBuild.strokeWidth,
                        angle: 0.0
                    )
                } else if (this.modelBuild.style == MaterialProgressStyle.MaterialHorizontal) {
                    HorizontalComponent(
                        progressSecond: this.modelBuild.progressSecond,
                        color: this.modelBuild.color,
                        secondColor: this.modelBuild.secondColor,
                        bgColor: this.modelBuild.bgColor,
                        strokeWidth: this.modelBuild.strokeWidth,
                        mOffset: 0.0
                    )
                }
            }
        }
    }
}
