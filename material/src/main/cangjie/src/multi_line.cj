/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package material

import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.concurrency.*

@Component
public class MultiLine {
    var colors: Array<UInt32> = [0x3E802F, 0xF4B400, 0x427FED, 0xB23424]
    var speed: Float64 = 0.0
    var strokeWidth: Float64 = 0.0
    var separatorLength: Float64 = 0.0
    @State
    @Watch[sectionsCountChange]
    var sectionsCount: Int64 = 0
    @State
    @Watch[sectionsCountChange]
    var isStop: Bool = false

    var reversed: Bool = false
    @State
    var pathCmd: ArrayList<MLine> = ArrayList<MLine>()
    var pathCmdStr: ArrayList<String> = ArrayList<String>()
    var mWidth: Float64 = lpx2px(170.lpx)().value
    var mHeight: Float64 = 10.0
    var colorIndex: Int64 = 0
    @State
    @Watch[curveChange]
    var curve: Curve = Curve.Linear

    var currentIndex: Int64 = 0
    var currentOffset: Float64 = 0.0
    var offsetMax: Float64 = 1.0
    var offsetStep: Float64 = 0.01
    var isPocket: Bool = false
    var isGradients: Bool = false
    @State
    var pathStrList: ObservedArrayList<MLinePath> = ObservedArrayList<MLinePath>()

    var timer: ?Timer = Option<Timer>.None

    func sectionsCountChange() {
        this.pathCmd = ArrayList<MLine>()
        this.initPath()
    }
    private func curveChange() {
    }
    protected override func aboutToAppear() {
        this.mHeight = this.strokeWidth
        this.pathCmd = ArrayList<MLine>()
        this.initPath();
        this.timer = Timer.repeat(
            Duration.Zero,
            Duration.millisecond * 30,
            {
                => launch {
                    this.updateLine()
                    this.getPathStr()
                }
            }
        )
    }
    protected override func aboutToDisappear() {
        if (let Some(tTimer) <- this.timer) {
            tTimer.cancel()
        }
    }

    private func initPath(): Unit {
        let size = this.sectionsCount
        let lineSize = round(this.mWidth / Float64(size))
        for (k in 0..=size) {
            let start = Float64(k) * lineSize
            let line = MLine(this.separatorLength / 2.0).set(start, lineSize).setColor(this.getRandomColor())
            this.pathCmd.append(line)
        }
    }

    private func updateLine(): Unit {
        let offset = this.offsetStep * this.speed
        this.offsetMax = 1.0 / Float64(this.sectionsCount)
        this.currentOffset += offset
        if (abs(this.currentOffset) >= this.offsetMax) {
            this.currentIndex++
            this.currentIndex = this.currentIndex % this.sectionsCount
            this.currentOffset = 0.0
            var setStart: Float64 = 0.0
            if (this.reversed) {
                setStart = this.mWidth
            }
            let line = MLine(this.separatorLength).set(setStart, 1.0).setColor(this.getRandomColor())
            line.isEmpty = this.isStop

            this.pathCmd.insert(0, line) // 头部添加元素
            this.pathCmd.remove(this.pathCmd.size - 1) // 删除末尾元素
        }

        let size = this.pathCmd.size
        let stepSections: Float64 = 1.0 / Float64(this.sectionsCount)

        for (k in 0..size) {
            let line = this.pathCmd[k]
            if (line.isEmpty) {
                continue
            }
            try {
                let xOffset: Float64 = stepSections * Float64(k) + this.currentOffset; //当前
                let prev = max(0.0, xOffset - Float64(stepSections)) //前一个

                let ratioSectionWidth = 0.1 // xiesi
                let sectionWidth = round(this.mWidth * ratioSectionWidth) //实际宽度

                var x: Float64 = 0.0
                if (k == 0) {
                    x = x - this.separatorLength
                } else {
                    x = round(this.mWidth * min(xOffset, 1.0))
                    x -= sectionWidth
                }
                if (this.reversed) {
                    x = this.mWidth - sectionWidth - x - this.separatorLength
                }

                line.set(x, sectionWidth);
            } catch (err: Exception) {
            }
        }
    }

    private func getRandomColor(): UInt32 {
        let size = colors.size
        if (this.isPocket) {
            this.colorIndex++
            this.colorIndex = this.colorIndex % (size * size)
            let pocketIndex: Float64 = floor(Float64(this.colorIndex) / Float64(size)) //向下舍入到最接近的整数
            return colors[Int64(pocketIndex)]
        } else {
            this.colorIndex++
            this.colorIndex = this.colorIndex % size
            return colors[this.colorIndex]
        }
    }
    private func isShowPocket(): Bool {
        if (this.isPocket) {
            for (line in this.pathCmd) {
                if (line.isEmpty) {
                    return true
                }
            }
        }
        return false
    }

    private func getPathStr(): Unit {
        this.pathCmdStr = ArrayList<String>()
        for (k in 0..this.pathCmd.size) {
            let line = this.pathCmd[k]
            this.pathCmdStr.append(line.getCmdPath())
        }
        this.pathStrList.clear()
        for (i in 0..this.pathCmd.size) {
            var mLinePath: MLinePath = MLinePath(
                color: this.pathCmd[i].color,
                nextColor: this.pathCmd[(i + 1) % this.pathCmd.size].color,
                x: this.pathCmd[i].start + this.pathCmd[i].space,
                width: max(0.0, this.pathCmd[i].getLength() - this.pathCmd[i].getSpace())
            )

            this.pathStrList.append(mLinePath)
        }
    }

    private func getPocketPath(): ArrayList<PocketPath> {
        var mpocketPathList: ArrayList<PocketPath> = ArrayList<PocketPath>()
        for (i in 0..this.colors.size) {
            let size = this.sectionsCount
            let lineSize = round(this.mWidth / Float64(size))
            let start = Float64(i) * lineSize
            let line: MLine = MLine(this.separatorLength / 2.0)
            line.set(start, lineSize)

            var mpocketPath: PocketPath = PocketPath(this.colors[i], line.getStart() + line.getSpace(),
                max(1.0, line.getLength() - line.getSpace()), line.getCmdPath())

            mpocketPathList.append(mpocketPath)
        }
        return mpocketPathList
    }

    func build() {
        Stack(Alignment.TopStart) {
            if (this.isShowPocket()) {
                ForEach(
                    getPocketPath(),
                    itemGeneratorFunc: {
                        item: PocketPath, index: Int64 => Rect().width(pxToVp(item.width)).height(this.strokeWidth).
                            offset(x: pxToVp(item.x), y: 0.0).fill(item.color)
                    },
                    keyGeneratorFunc: {
                        item: PocketPath, idx: Int64 => item.x.toString()
                    }
                )
            }
            ForEach(
                this.pathStrList,
                itemGeneratorFunc: {
                    item: MLinePath, index: Int64 => if (this.isGradients) {
                        Row().width(pxToVp(item.width)).height(this.strokeWidth).offset(x: pxToVp(item.x), y: 0.0).
                            linearGradient(
                            angle: 90.0,
                            colors: [(Color(item.color), 0.3), (Color(item.nextColor), 0.6)],
                        )
                    } else {
                        Rect().width(pxToVp(item.width)).height(this.strokeWidth).offset(x: pxToVp(item.x), y: 0.0).fill(
                            item.color)
                    }
                },
                keyGeneratorFunc: {
                    item: MLinePath, idx: Int64 => item.x.toString()
                }
            )
        }.width(pxToVp(this.mWidth)).height(this.mHeight)
    }
}

public class PocketPath {
    var color: UInt32 = 0
    var x: Float64 = 0.0
    var width: Float64 = 0.0
    var str: String = ""
    public init() {}
    public init(color: UInt32, x: Float64, width: Float64, str: String) {
        this.color = color
        this.x = x
        this.width = width
        this.str = str
    }
}

@Observed
public class MLinePath {
    @Publish
    var color: UInt32 = 0
    @Publish
    var nextColor: UInt32 = 0
    @Publish
    var x: Float64 = 0.0
    @Publish
    var width: Float64 = 0.0
}

public class MLine {
    var start: Float64 = 0.0
    var end: Float64 = 0.0
    var color: UInt32 = 0xFFFFFF
    var length: Float64 = 0.0
    var space: Float64 = 0.0
    var isEmpty: Bool = false

    public MLine(space: Float64) {
        this.space = floor(space)
    }

    public func set(start: Float64, length: Float64): MLine {
        this.start = start
        this.length = length
        this.end = start + length
        return this
    }

    public func setColor(color: UInt32): MLine {
        this.color = color
        return this
    }

    public func offset(offset: Float64): MLine {
        this.start += offset
        this.end = this.start + this.length
        return this
    }

    public func getCmdPath(): String {
        if (this.isEmpty) {
            return "";
        } else {
            return "M${this.start + this.space} 0 l${max(1.0, this.length - this.space)} 0"
        }
    }

    public func toString(): String {
        return "{ (${this.start} , ${this.end}) ${this.color}}"
    }

    public func setLength(length: Float64) {
        this.length = length
    }

    public func getLength(): Float64 {
        return this.length
    }

    public func setSpace(space: Float64) {
        this.space = space
    }

    public func getSpace(): Float64 {
        return this.space
    }

    public func setStart(start: Float64) {
        this.start = start
    }

    public func getStart(): Float64 {
        return this.start
    }
}
