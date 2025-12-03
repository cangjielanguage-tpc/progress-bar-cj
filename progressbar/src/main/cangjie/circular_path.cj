/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package progressBar

public class CircularPath <: ProgressBar {
    private var startPoint: Array<Float64> = [0.0, 0.0]
    private var endPoint: Array<Float64> = [0.0, 0.0]
    private var angle: Float64 = 0.0 //角度
    private var offsetAngle: Float64 = 0.0 //角度
    private var radius: Float64 = 100.0 //半径
    private var strokeWidth: Float64 = 5.0 //线宽
    private var pathCmd: String = ""
    var progress: Float64 = 0.0
    var color: UInt32 = 0
    var colorSecond: Int64 = -1
    var maxProgress: Float64 = 100.0
    private var isReset: Bool = true

    func setAngle(angle: Float64): CircularPath {
        this.offsetAngle = angle
        return this;
    }

    func getAngle(): Float64 {
        return this.offsetAngle
    }

    func setColor(color: UInt32): CircularPath {
        this.color = color
        return this
    }
    func setColorSecond(colorSecond: Int64): CircularPath {
        this.colorSecond = colorSecond
        return this
    }

    func getColor(): UInt32 {
        return this.color
    }

    public override func setProgress(progress: Float64): ProgressBar {
        this.progress = max(0.0, min(this.maxProgress, progress))
        this.update()
        return this
    }

    public override func getProgress(): Float64 {
        return this.progress
    }

    public override func setMaxProgress(max: Float64): ProgressBar {
        this.maxProgress = max
        return this
    }

    public override func getMaxProgress(): Float64 {
        return this.maxProgress
    }

    public func setRadius(radius: Float64): CircularPath {
        this.radius = (radius)
        return this
    }

    public func setStrokeWidth(strokeWidth: Float64): CircularPath {
        this.strokeWidth = (strokeWidth)
        return this
    }

    public func getStrokeWidth(): Float64 {
        return this.strokeWidth
    }

    public func getPathCmd(): String {
        return this.pathCmd
    }

    public func reset(): Unit {
        this.isReset = true
    }

    private func point2Str(point: Array<Float64>): String {
        if (point.size < 2) {
            return ""
        }
        return point[0].toString() + " " + point[1].toString()
    }

    private func update(): Unit {
        if (this.isReset) {
            this.isReset = false
        }
        this.startPoint = this.calculation(this.offsetAngle)
        this.angle = 360.0 * this.progress / this.maxProgress
        var angle: Float64 = this.angle
        if (this.angle == 360.0) {
            angle = 359.0
        }
        let endP = this.calculation(angle + this.offsetAngle)
        var close: String = ""
        if (this.progress == this.maxProgress) {
            close = "Z"
        }
        // 大/小角度弧标志  0为小角度
        var angleFlag: Int64 = 0
        if (this.angle >= 180.0) {
            angleFlag = 1
        }
        this.pathCmd = "M${this.point2Str(this.startPoint)} A${this.radius} ${this.radius} 0 ${angleFlag} 1 ${this.point2Str(endP)} ${close}"
        this.endPoint = endP
    }

    private func calculation(angle: Float64): Array<Float64> {
        // 计算弧度
        let radian = angle * Float64.getPI() / 180.0
        let circleRadius = this.radius + (this.strokeWidth / 2.0)
        var endX = circleRadius + (this.radius * sin(radian)) + this.strokeWidth
        let endY = circleRadius - (this.radius * cos(radian)) + this.strokeWidth
        // 控制起点终点无限接近时正常画圆
        if ((circleRadius - 1.0) < endX && endX < circleRadius && (circleRadius - endX) < 0.01) {
            endX = circleRadius - 0.01
        }
        return [endX, endY]
    }
}
