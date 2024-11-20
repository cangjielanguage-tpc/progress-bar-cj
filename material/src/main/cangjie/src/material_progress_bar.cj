/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package material

import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*

@Component
public class MaterialProgressBar {
    private var style: MaterialProgressStyle = MaterialProgressStyle.MaterialCircular
    private var modelBuild: MaterialModel = MaterialModel()

    protected override func aboutToAppear() {
        this.modelBuild.style = this.style
    }
    func build() {
        if (this.style == MaterialProgressStyle.MaterialCircular) {
            MaterialComponent(modelBuild: this.modelBuild)
        } else if (this.style == MaterialProgressStyle.MaterialHorizontal) {
            MaterialComponent(modelBuild: this.modelBuild)
        } else if (this.style == MaterialProgressStyle.SmoothCircular) {
            SmoothCircularProgressBar(modelBuild: this.modelBuild)
        } else if (this.style == MaterialProgressStyle.SmoothHorizontal) {
            SmoothHorizontalProgressBar(modelBuild: this.modelBuild)
        } else {
            Text("undefined").fontSize(30)
        }
    }
}

@Observed
public class MaterialModel {
    var isReversed: Bool = false
    var isMirror: Bool = false
    var isGradients: Bool = false
    var isStop: Bool = false
    var progress: Float64 = 30.0
    var angle: Float64 = 10.0
    var style: MaterialProgressStyle = MaterialProgressStyle.MaterialHorizontal
    var indeterminateAngle: Bool = false
    var indeterminate: Bool = false
    var radius: Float64 = 50.0
    var color: UInt32 = 0x007DFF //0x029789
    var secondColor: UInt32 = 0
    var progressSecond: Float64 = 0.0
    var bgColor: UInt32 = 0
    var strokeWidth: Float64 = 8.0
    var isPocket: Bool = false
    var colors: Array<UInt32> = [0x3E802F, 0xF4B400, 0x427FED, 0xB23424]
    var speed: Float64 = 0.0
    var separatorLength: Float64 = 0.0
    var sectionsCount: Int64 = 0
    var curve: Curve = Curve.Linear

    public func setSecondColor(secondColor: UInt32): Unit {
        this.secondColor = secondColor
    }

    public func getSecondColor(): UInt32 {
        return this.secondColor
    }

    public func setBgColor(bgColor: UInt32): Unit {
        this.bgColor = bgColor
    }

    public func getBgColor(): UInt32 {
        return this.bgColor
    }

    public func setShowProgressBackground(isShow: Bool): Unit {
        if (isShow) {
            this.bgColor = 0xd0d0d0
        } else {
            this.bgColor = 0
        }
    }

    public func getShowProgressBackground(): Bool {
        return this.bgColor == 0
    }

    public func setColor(color: UInt32): Unit {
        this.color = color
    }

    public func getColor(): UInt32 {
        return this.color
    }
    public func setColors(colors: Array<UInt32>): Unit {
        this.colors = colors
    }

    public func getColors(): Array<UInt32> {
        return this.colors
    }
    public func setIndeterminate(indeterminate: Bool): Unit {
        this.indeterminate = indeterminate
    }

    public func getIndeterminate(): Bool {
        return this.indeterminate
    }

    public func setIndeterminateAngle(indeterminateAngle: Bool): Unit {
        this.indeterminateAngle = indeterminateAngle
    }

    public func getIndeterminateAngle(): Bool {
        return this.indeterminateAngle
    }

    public func setStyle(style: MaterialProgressStyle): Unit {
        this.style = style
    }

    public func getStyle(): MaterialProgressStyle {
        return this.style
    }

    public func setProgress(progress: Float64): Unit {
        this.progress = progress
    }

    public func getProgress(): Float64 {
        return this.progress
    }

    public func setAngle(angle: Float64): Unit {
        this.angle = angle
    }

    public func getAngle(): Float64 {
        return this.angle
    }

    public func setRadius(radius: Float64): Unit {
        this.radius = radius
    }

    public func getRadius(): Float64 {
        return this.radius
    }

    public func setSecondProgress(progressSecond: Float64): Unit {
        this.progressSecond = progressSecond
    }

    public func getSecondProgress(): Float64 {
        return this.progressSecond
    }

    public func setStrokeWidth(strokeWidth: Float64): Unit {
        this.strokeWidth = strokeWidth
    }

    public func getStrokeWidth(): Float64 {
        return this.strokeWidth
    }

    public func setCurve(curve: Curve): Unit {
        this.curve = curve
    }

    public func getCurve(): Curve {
        return this.curve
    }

    public func setIsPocket(isPocket: Bool): Unit {
        this.isPocket = isPocket
    }

    public func setIsPocket(): Bool {
        return this.isPocket
    }

    public func setIsReversed(isReversed: Bool): Unit {
        this.isReversed = isReversed
    }

    public func getIsReversed(): Bool {
        return this.isReversed
    }

    public func setIsMirror(isMirror: Bool): Unit {
        this.isMirror = isMirror
    }

    public func getIsMirror(): Bool {
        return this.isMirror
    }

    public func setIsGradients(isGradients: Bool): Unit {
        this.isGradients = isGradients
    }

    public func getIsGradients(): Bool {
        return this.isGradients
    }

    public func setSpeed(speed: Float64): Unit {
        this.speed = speed
    }

    public func GetSpeed(): Float64 {
        return this.speed
    }

    public func setSeparatorLength(separatorLength: Float64): Unit {
        this.separatorLength = separatorLength
    }

    public func GetSeparatorLength(): Float64 {
        return this.separatorLength
    }

    public func setSectionsCount(sectionsCount: Int64): Unit {
        this.sectionsCount = sectionsCount
    }

    public func GetSectionsCount(): Int64 {
        return this.sectionsCount
    }

    public func setIsStop(isStop: Bool): Unit {
        this.isStop = isStop
    }

    public func getIsStop(): Bool {
        return this.isStop
    }
}
