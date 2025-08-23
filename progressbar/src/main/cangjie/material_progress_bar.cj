/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package progressBar

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
    var secondColor: Int64 = -1
    var progressSecond: Float64 = 0.0
    var bgColor: Int64 = -1
    var strokeWidth: Float64 = 8.0
    var isPocket: Bool = false
    var colors: Array<UInt32> = [0x3E802F, 0xF4B400, 0x427FED, 0xB23424]
    var speed: Float64 = 1.5
    var separatorLength: Float64 = 0.0
    var sectionsCount: Int64 = 4
    var curve: Curve = Curve.Linear
    var progressInit: Float64 = 0.0

    var horizontalLength: Float64 = 1000.0

    public func setHorizontalLength(horizontalLength: Float64): Unit {
        this.horizontalLength = horizontalLength
    }

    func getHorizontalLength(): Float64 {
        return this.horizontalLength
    }

    public func setProgressInit(progressInit: Float64): Unit {
        this.progressInit = progressInit
    }

    func getProgressInit(): Float64 {
        return this.progressInit
    }
    public func setSecondColor(secondColor: Int64): Unit {
        this.secondColor = secondColor
    }

    func getSecondColor(): Int64 {
        return this.secondColor
    }

    public func setBgColor(bgColor: Int64): Unit {
        this.bgColor = bgColor
    }

    func getBgColor(): Int64 {
        return this.bgColor
    }

    public func setShowProgressBackground(isShow: Bool): Unit {
        if (isShow) {
            this.bgColor = 0xd0d0d0
        } else {
            this.bgColor = -1
        }
    }

    func getShowProgressBackground(): Bool {
        return this.bgColor == -1
    }

    public func setColor(color: UInt32): Unit {
        this.color = color
    }

    func getColor(): UInt32 {
        return this.color
    }
    public func setColors(colors: Array<UInt32>): Unit {
        this.colors = colors
    }

    func getColors(): Array<UInt32> {
        return this.colors
    }
    public func setIndeterminate(indeterminate: Bool): Unit {
        this.indeterminate = indeterminate
    }

    func getIndeterminate(): Bool {
        return this.indeterminate
    }

    public func setIndeterminateAngle(indeterminateAngle: Bool): Unit {
        this.indeterminateAngle = indeterminateAngle
    }

    func getIndeterminateAngle(): Bool {
        return this.indeterminateAngle
    }

    public func setStyle(style: MaterialProgressStyle): Unit {
        this.style = style
    }

    func getStyle(): MaterialProgressStyle {
        return this.style
    }

    public func setProgress(progress: Float64): Unit {
        this.progress = progress
    }

    func getProgress(): Float64 {
        return this.progress
    }

    public func setAngle(angle: Float64): Unit {
        this.angle = angle
    }

    func getAngle(): Float64 {
        return this.angle
    }

    public func setRadius(radius: Float64): Unit {
        this.radius = radius
    }

    func getRadius(): Float64 {
        return this.radius
    }

    public func setSecondProgress(progressSecond: Float64): Unit {
        this.progressSecond = progressSecond
    }

    func getSecondProgress(): Float64 {
        return this.progressSecond
    }

    public func setStrokeWidth(strokeWidth: Float64): Unit {
        this.strokeWidth = strokeWidth
    }

    func getStrokeWidth(): Float64 {
        return this.strokeWidth
    }

    public func setCurve(curve: Curve): Unit {
        this.curve = curve
    }

    func getCurve(): Curve {
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

    func getIsReversed(): Bool {
        return this.isReversed
    }

    public func setIsMirror(isMirror: Bool): Unit {
        this.isMirror = isMirror
    }

    func getIsMirror(): Bool {
        return this.isMirror
    }

    public func setIsGradients(isGradients: Bool): Unit {
        this.isGradients = isGradients
    }

    func getIsGradients(): Bool {
        return this.isGradients
    }

    public func setSpeed(speed: Float64): Unit {
        this.speed = speed
    }

    func getSpeed(): Float64 {
        return this.speed
    }

    public func setSeparatorLength(separatorLength: Float64): Unit {
        this.separatorLength = separatorLength
    }

    func getSeparatorLength(): Float64 {
        return this.separatorLength
    }

    public func setSectionsCount(sectionsCount: Int64): Unit {
        this.sectionsCount = sectionsCount
    }

    func getSectionsCount(): Int64 {
        return this.sectionsCount
    }

    public func setIsStop(isStop: Bool): Unit {
        this.isStop = isStop
    }

    func getIsStop(): Bool {
        return this.isStop
    }
}
