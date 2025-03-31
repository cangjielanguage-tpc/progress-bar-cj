/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package progressbar

import ohos.state_macro_manage.*
import ohos.concurrency.*

@Component
public class ComWheel {
    @State
    var model: ComMaterialModel = ComMaterialModel()

    protected override func aboutToDisappear() {
        this.model.closeTimer()
    }

    func build() {
        Column {
            Grid() {
                GridItem() {
                    Stack() {
                        Path() //外圆的轨道
                            .strokeWidth(this.model.barWidth).fillOpacity(0).stroke(this.model.barColor).commands(
                            this.model.svgPath).width(50).height(50).zIndex(2)
                        Path() //外圆的轨道
                            .strokeWidth(this.model.rimWidth).fillOpacity(0).stroke(this.model.rimColor).commands(
                            this.model.rimSvgPath).width(50).height(50).zIndex(0)
                    }
                }.width(100).align(Alignment.Center)

                GridItem() {
                    Text(this.model.getProgress()).fontSize(15).fontColor(0x7A7A7A).width(100).textAlign(
                        TextAlign.Center)
                }
            }.rowsTemplate("2fr 1fr").width(150).height(100)
        }.width(100.percent).backgroundColor(Color.WHITE)
    }
}

@Observed
public class ComMaterialModel {
    //画笔宽度
    var barWidth: Float64 = 5.0
    //轮圈宽度
    var rimWidth: Float64 = 5.0
    //画笔颜色
    var barColor: UInt32 = 0x5588FF
    // 大/小角度弧标志  0为小角度
    var angleFlag: UInt8 = 0
    // 圆弧最小角度
    var minAngle: Float64 = 16.0
    // 圆弧最大角度
    var maxAngle: Float64 = 270.0
    //半径
    var circleRadius: Float64 = 30.0
    //真实半径
    var radius: Float64 = 0.0
    // 在 minAngle 基础上，额外需要绘制的角度
    var barExtraLength: Float64 = 0.0
    // 需要绘制到的角度
    var targetAngle: Float64 = 0.0
    // 圆弧递增或递减的标记  true表示递增
    var barGrowingFromFront: Bool = true
    // 逆时针顺时针标志 1表示顺时针
    var directionFlag: Int64 = 1
    // svg路径
    @Publish
    var svgPath: String = "";
    // 绘制终点的X轴坐标
    var endX: Float64 = 0.0
    //绘制终点的Y轴坐标
    var endY: Float64 = 0.0
    //起始位置
    var startX: Float64 = 0.0
    var startY: Float64 = 0.0
    // 目标进度值
    var mTargetProgress: Float64 = 1.0
    // 进度值
    @Publish
    var mProgress: String = "0"
    // 起始角度
    var progress: Float64 = 0.0
    //轮圈颜色
    var rimColor: UInt32 = 0xFFFFFF
    // 近似闭合的坐标
    var closureY: Float64 = 0.0
    // 每1ms的旋转角度，例：230 每1s旋转 230 度    (270-16)/0.46 = 230
    var spinSpeed: Float64 = 230.0
    //轮圈的svg路径
    @Publish
    var rimSvgPath: String = ""
    // 是否是动态进度轮
    var isSpinning: Bool = false
    // 是否是线性进度轮
    var linearProgress: Bool = false
    //圆弧处在最大或者最小角度时，保持当时状态的时间，简而言之，当圆弧为的角度为 barLength
    //圆弧处在最大或者最小角度时，保持当时状态的时间，简而言之，当圆弧为的角度为 barLength
    // 或者 barMaxLength 时，都会在 pauseGrowingTime 这个时间后才会继续变化，最大向最小变化，最小向最大变化，可以理解为 delayTime
    var pauseGrowingTime: Int64 = 200
    // 圆弧 递增/递减 已经经历时间
    var timeStartGrowing: Int64 = 0
    //圆弧 从最小到最大/从最大到最小 的总时间
    var barSpinCycleTime: Int64 = 460
    // 圆弧在 最大/最小 角度保持的时间
    var pausedTimeWithoutGrowing: Int64 = 0
    //上一次绘制的时间
    var lastTimeAnimated: DateTime = DateTime.now()
    // 定时器
    var timer: ?Timer = Option<Timer>.None

    public func init_data() {
        this.radius = this.circleRadius - this.barWidth
        this.startX = this.circleRadius
        this.startY = this.barWidth
        // 近似一个完整的回环(轮圈)
        let closureRadian = 359.99 * Float64.PI / 180.0
        // 近似闭合的坐标
        let closureX = this.circleRadius + (this.radius * sin(closureRadian))
        this.closureY = this.circleRadius - (this.radius * cos(closureRadian))
        var rimPathBuilder = StringBuilder()
        rimPathBuilder.append("M")
        rimPathBuilder.append(this.startX)
        rimPathBuilder.append(" ")
        rimPathBuilder.append(this.startY)
        rimPathBuilder.append(" A ")
        rimPathBuilder.append(this.radius)
        rimPathBuilder.append(" ")
        rimPathBuilder.append(this.radius)
        rimPathBuilder.append(", 0, 1, ")
        rimPathBuilder.append(this.directionFlag)
        rimPathBuilder.append(", ")
        rimPathBuilder.append(closureX)
        rimPathBuilder.append(" ")
        rimPathBuilder.append(this.closureY)
        rimPathBuilder.append("Z")
        this.rimSvgPath = rimPathBuilder.toString()
        // 计算弧度
        if (this.isSpinning) {
            let radian = this.minAngle * Float64.PI / 180.0
            this.endX = this.circleRadius + (this.radius * sin(radian))
            this.endY = this.circleRadius - (this.radius * cos(radian))
            var pathBuilder = StringBuilder()
            pathBuilder.append("M")
            pathBuilder.append(this.startX)
            pathBuilder.append(" ")
            pathBuilder.append(this.startY)
            pathBuilder.append(" A ")
            pathBuilder.append(this.radius)
            pathBuilder.append(" ")
            pathBuilder.append(this.radius)
            pathBuilder.append(", 0, ")
            pathBuilder.append(this.angleFlag)
            pathBuilder.append(", ")
            pathBuilder.append(this.directionFlag)
            pathBuilder.append(", ")
            pathBuilder.append(endX)
            pathBuilder.append(" ")
            pathBuilder.append(this.endY)
            this.svgPath = pathBuilder.toString()
        } else {
            if (this.mTargetProgress == 1.0) {
                this.maxAngle = 359.99
            } else {
                this.maxAngle = this.mTargetProgress * 360.0
            }
        }
        this.lastTimeAnimated = DateTime.now()
        this.closeTimer()
        timer = Timer.repeat(Duration.Zero, Duration.millisecond * 20, {
            => launch {
                this.onDraw()
            }
        })
    }

    private func onDraw(): Unit {
        // 动态绘制
        if (this.isSpinning) {
            if ((this.barExtraLength + this.minAngle) < 180.0) {
                this.angleFlag = 0
            } else {
                this.angleFlag = 1
            }
            // 增量时间
            let deltaTime = (DateTime.now() - this.lastTimeAnimated).toMilliseconds()
            let deltaNormalized = Float64(deltaTime) * this.spinSpeed / 1000.0
            this.progress += deltaNormalized
            if (this.progress > 360.0) {
                this.progress -= 360.0
            }
            let radian = this.progress * Float64.PI / 180.0
            this.startX = this.circleRadius + (this.radius * sin(radian))
            this.startY = this.circleRadius - (this.radius * cos(radian))
            // 计算需要额外绘制的角度
            this.updateBarLength(deltaTime)
            this.lastTimeAnimated = DateTime.now()
            // 计算坐标
            this.calculation()
            this.targetAngle = this.progress + this.barExtraLength + this.minAngle
            if (this.targetAngle > 360.0) {
                this.targetAngle = this.targetAngle - 360.0
            }
            this.svgPath = builderAppend(StringBuilder()).toString()
            this.mProgress = "Progress:"
        } else {
            // 静态
            if (this.progress < 180.0) {
                this.angleFlag = 0
            } else {
                this.angleFlag = 1
            }
            if (this.progress != this.maxAngle) {
                let deltaTime = Float64((DateTime.now() - this.lastTimeAnimated).toMilliseconds()) / 1000.0
                if (deltaTime < 0.0) {
                }
                let deltaNormalized = deltaTime * this.spinSpeed
                this.progress = min(this.progress + deltaNormalized, this.maxAngle)
                this.lastTimeAnimated = DateTime.now()
            } else {
                this.lastTimeAnimated = DateTime.now()
            }
            this.targetAngle = this.progress
            if (!this.linearProgress) {
                let factor = 2
                //起始角
                let startAngle = (1.0 - pow(1.0 - this.progress / 360.0, 2 * factor)) * 360.0
                let start = startAngle * Float64.PI / 180.0
                this.startX = this.circleRadius + (this.radius * sin(start))
                this.startY = this.circleRadius - (this.radius * cos(start))
                // 偏移的角度
                let Offset = (1.0 - pow(1.0 - this.progress / 360.0, 1)) * 360.0
                this.targetAngle = startAngle + Offset
                if (Offset < 180.0) {
                    this.angleFlag = 0
                } else {
                    this.angleFlag = 1
                }
            }
            if (this.targetAngle > 360.0) {
                this.targetAngle = this.targetAngle - 360.0
            }
            // 计算坐标
            this.calculation()
            this.svgPath = builderAppend(StringBuilder()).toString()

            this.mProgress = (this.progress / 360.0).format(".2")
        }
    }
    private func calculation(): Unit {
        // 计算弧度
        let radian = this.targetAngle * Float64.PI / 180.0
        this.endX = this.circleRadius + (this.radius * sin(radian))
        this.endY = this.circleRadius - (this.radius * cos(radian))
        // 控制起点终点无限接近时正常画圆
        if ((this.circleRadius - 1.0) < this.endX && this.endX < this.circleRadius && (this.circleRadius - this.endX) <
            0.01) {
            this.endX = this.circleRadius - 0.01
        }
    }

    private func updateBarLength(deltaTimeInMilliSeconds: Int64): Unit {
        // 到达最大小最小角的保持时间
        if (this.pausedTimeWithoutGrowing >= this.pauseGrowingTime) {
            this.timeStartGrowing += deltaTimeInMilliSeconds
            // 计算递增递减
            if (this.timeStartGrowing > this.barSpinCycleTime) {
                this.timeStartGrowing -= this.barSpinCycleTime
                this.pausedTimeWithoutGrowing = 0
                // 递增递减切换
                this.barGrowingFromFront = !this.barGrowingFromFront
            }
            let distance = cos(Float64(this.timeStartGrowing / this.barSpinCycleTime + 1) * Float64.PI) / 2.0 + 0.5
            // 目标角度
            let destLength = (this.maxAngle - this.minAngle)
            if (this.barGrowingFromFront) {
                // 递增
                this.barExtraLength = distance * destLength
            } else {
                //递减
                let newLength = destLength * (1.0 - distance)
                this.progress += (this.barExtraLength - newLength)
                this.barExtraLength = newLength
            }
        } else {
            this.pausedTimeWithoutGrowing += deltaTimeInMilliSeconds
        }
    }

    public func setCircleRadius(circleRadius: Float64): Unit {
        this.circleRadius = circleRadius
    }

    func getCircleRadius(): Float64 {
        return this.circleRadius
    }

    public func setBarColor(barColor: UInt32): Unit {
        this.barColor = barColor
    }

     func getBarColor(): UInt32 {
        return this.barColor
    }

    public func setRimColor(rimColor: UInt32): Unit {
        this.rimColor = rimColor
    }

     func getRimColor(): UInt32 {
        return this.rimColor
    }

    public func setRimWidth(rimWidth: Float64): Unit {
        this.rimWidth = rimWidth
    }

    func getRimWidth(): Float64 {
        return this.rimWidth
    }

    public func setBarWidth(barWidth: Float64): Unit {
        this.barWidth = barWidth
    }

    func getBarWidth(): Float64 {
        return this.barWidth
    }

    public func setProgress(mTargetProgress: Float64): Unit {
        var tempTargetProgress = mTargetProgress
        if (this.isSpinning) {
            this.progress = 0.0
            this.isSpinning = false
        }
        if (tempTargetProgress > 1.0) {
            tempTargetProgress = 1.0
        } else if (tempTargetProgress < 0.0) {
            tempTargetProgress = 0.0
        }
        this.mTargetProgress = tempTargetProgress
    }
    // 获取当前的进度值
    func getProgress(): String {
        return this.mProgress
    }

    public func setSpinning(isSpinning: Bool): Unit {
        this.isSpinning = isSpinning
    }

    public func setLinearProgress(linearProgress: Bool): Unit {
        this.linearProgress = linearProgress
    }

    public func setSpinSpeed(spinSpeed: Float64): Unit {
        this.spinSpeed = spinSpeed
    }

    func getSpinSpeed(): Float64 {
        return this.spinSpeed
    }

    // Reset the count (in increment mode)
    public func resetCount(): Unit {
        this.progress = 0.0
        this.mTargetProgress = 0.0
    }

    public func stopSpinning(): Unit {
        this.isSpinning = false
        this.progress = 0.0
        this.mTargetProgress = 0.0
    }

    public func spin(): Unit {
        this.lastTimeAnimated = DateTime.now()
        this.isSpinning = true
    }

    // 将进度设置为特定值，栏将立即设置为该值 @param progress 0 和 1 之间的进度
    public func setInstantProgress(progress: Float64): Unit {
        var tempProgress = progress
        if (this.isSpinning) {
            this.progress = 0.0
            this.isSpinning = false
        }
        if (tempProgress > 1.0) {
            tempProgress -= 1.0
        } else if (tempProgress < 0.0) {
            tempProgress = 0.0
        }
        if (progress == this.mTargetProgress) {
            return
        }
        this.mTargetProgress = min(progress * 360.0, 360.0)
        this.progress = this.mTargetProgress
        this.lastTimeAnimated = DateTime.now()
    }

    public func spinning(): Bool {
        return this.isSpinning
    }

    public func closeTimer() {
        if (let Some(tTimer) <- this.timer) {
            tTimer.cancel()
        }
    }

    private func builderAppend(tempPathBuilder: StringBuilder): StringBuilder {
        var pathBuilder = tempPathBuilder
        pathBuilder.append("M")
        pathBuilder.append(this.startX)
        pathBuilder.append(" ")
        pathBuilder.append(this.startY)
        pathBuilder.append(" A ")
        pathBuilder.append(this.radius)
        pathBuilder.append(" ")
        pathBuilder.append(this.radius)
        pathBuilder.append(", 0, ")
        pathBuilder.append(this.angleFlag)
        pathBuilder.append(", ")
        pathBuilder.append(this.directionFlag)
        pathBuilder.append(", ")
        pathBuilder.append(endX)
        pathBuilder.append(" ")
        pathBuilder.append(this.endY)
        return pathBuilder
    }
}
