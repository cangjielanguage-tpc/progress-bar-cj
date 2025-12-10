/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package progressBar

import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*

@Component
public class SmoothHorizontalProgressBar {
    var modelBuild: MaterialModel = MaterialModel()
    var speed: Float64 = 0.0
    var strokeWidth: Float64 = 0.0
    var separatorLength: Float64 = 0.0
    var sectionsCount: Int64 = 0
    var isReversed: Bool = false
    var isMirror: Bool = false
    var isGradients: Bool = false
    var colors: Array<UInt32> = [0x3e802f, 0xb23424, 0x427fed, 0xf4b400]
    var mWidth: Float64 = lpx2px(720.lpx)().value
    var mHeight: Float64 = 10.0
    var isStop: Bool = false
    var curve: Curve = Curve.Linear
    var isPocket: Bool = false

    protected override func aboutToAppear() {
        this.mHeight = this.modelBuild.strokeWidth
        if (this.modelBuild.colors.size != 0) {
        	this.colors = this.modelBuild.colors
        }

    }

    @Builder
    func buildLine() {
        MultiLine(
            mWidth: this.mWidth,
            strokeWidth: this.modelBuild.strokeWidth,
            separatorLength: this.modelBuild.separatorLength,
            sectionsCount: this.modelBuild.sectionsCount,
            speed: this.modelBuild.speed,
            reversed: this.modelBuild.isReversed,
            isStop: this.modelBuild.isStop,
            curve: this.modelBuild.curve,
            colors: this.colors,
            isPocket: this.modelBuild.isPocket,
            isGradients: this.modelBuild.isGradients,
        )
    }
    @Builder
    func buildMultiLine() {
        MultiLine(
            isStop: this.modelBuild.isStop,
            mWidth: this.mWidth / 2.0,
            strokeWidth: this.modelBuild.strokeWidth,
            separatorLength: this.modelBuild.separatorLength,
            sectionsCount: this.modelBuild.sectionsCount,
            speed: this.modelBuild.speed,
            reversed: this.modelBuild.isReversed,
            curve: this.modelBuild.curve,
            colors: this.colors,
            isPocket: this.modelBuild.isPocket,
            isGradients: this.modelBuild.isGradients,
        )
        MultiLine(
            isStop: this.modelBuild.isStop,
            mWidth: this.mWidth / 2.0,
            strokeWidth: this.modelBuild.strokeWidth,
            separatorLength: this.modelBuild.separatorLength,
            sectionsCount: this.modelBuild.sectionsCount,
            speed: this.modelBuild.speed,
            reversed: !this.modelBuild.isReversed,
            curve: this.modelBuild.curve,
            colors: this.colors,
            isPocket: this.modelBuild.isPocket,
            isGradients: this.modelBuild.isGradients,
        )
    }
    func build() {
        Row() {
            if (this.modelBuild.isMirror) {
                MultiLine(
                    isStop: this.modelBuild.isStop,
                    mWidth: this.mWidth / 2.0,
                    strokeWidth: this.modelBuild.strokeWidth,
                    separatorLength: this.modelBuild.separatorLength,
                    sectionsCount: this.modelBuild.sectionsCount,
                    speed: this.modelBuild.speed,
                    reversed: this.modelBuild.isReversed,
                    curve: this.modelBuild.curve,
                    colors: this.colors,
                    isPocket: this.modelBuild.isPocket,
                    isGradients: this.modelBuild.isGradients,
                )
                MultiLine(
                    isStop: this.modelBuild.isStop,
                    mWidth: this.mWidth / 2.0,
                    strokeWidth: this.modelBuild.strokeWidth,
                    separatorLength: this.modelBuild.separatorLength,
                    sectionsCount: this.modelBuild.sectionsCount,
                    speed: this.modelBuild.speed,
                    reversed: !this.modelBuild.isReversed,
                    curve: this.modelBuild.curve,
                    colors: this.colors,
                    isPocket: this.modelBuild.isPocket,
                    isGradients: this.modelBuild.isGradients,
                )
            } else {
                MultiLine(
                    mWidth: this.mWidth,
                    strokeWidth: this.modelBuild.strokeWidth,
                    separatorLength: this.modelBuild.separatorLength,
                    sectionsCount: this.modelBuild.sectionsCount,
                    speed: this.modelBuild.speed,
                    reversed: this.modelBuild.isReversed,
                    isStop: this.modelBuild.isStop,
                    curve: this.modelBuild.curve,
                    colors: this.colors,
                    isPocket: this.modelBuild.isPocket,
                    isGradients: this.modelBuild.isGradients,
                )
            }
        }
    }
}
