/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package material

public class HorizontalPath <: ProgressBar {
    private var startPoint: Array<Float64> = [0.0, 0.0]
    private var endPoint: Array<Float64> = [0.0, 0.0]
    private var pathCmd: String = ""
    var progress: Float64 = 0.0
    var barColor: UInt32 = 0
    var maxProgress: Float64 = 100.0
    var totalWidth: Float64 = 1000.0

    private func update(): Unit {
        let end = this.totalWidth * this.progress / this.maxProgress
        this.endPoint[0] = end
        this.pathCmd = "M${this.point2Str(this.startPoint)} L${this.point2Str(this.endPoint)}"
    }

    private func point2Str(point: Array<Float64>): String {
        if (point.size < 2) {
            return ""
        }

        let x: Float64 = vp2px(Length(point[0]))().value
        let y: Float64 = vp2px(Length(point[1]))().value

        return x.toString() + " " + y.toString()
    }

    func setOffset(offset: Float64): Unit {
        if (this.startPoint[0] != offset) {
            this.startPoint[0] = max(0.0, offset)
            this.update()
        }
    }

    public override func setProgress(progress: Float64): ProgressBar {
        if (progress != this.progress) {
            this.progress = max(0.0, min(this.maxProgress, progress))
            this.update()
        }
        return this
    }

    func setTotalWidth(totalWidth: Float64): HorizontalPath {
        this.totalWidth = totalWidth
        return this
    }

    public override func getProgress(): Float64 {
        return this.progress
    }

    func setBarColor(barColor: UInt32): HorizontalPath {
        this.barColor = barColor
        return this
    }

    func getBarColor(): UInt32 {
        return this.barColor
    }

    public override func setMaxProgress(max: Float64): ProgressBar {
        this.maxProgress = max
        return this
    }

    public override func getMaxProgress(): Float64 {
        return this.maxProgress
    }

    public func getPathCmd(): String {
        return this.pathCmd
    }
}
