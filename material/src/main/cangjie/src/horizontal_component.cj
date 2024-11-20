/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package material

import ohos.state_macro_manage.*
import ohos.concurrency.*

@Component
public class HorizontalComponent {
    private var progressBar: HorizontalPath = HorizontalPath()
    private var bgBar: HorizontalPath = HorizontalPath()
    private var secondBar: HorizontalPath = HorizontalPath()
    private var mHeight: Float64 = 0.0
    var strokeWidth: Float64 = 6.0
    private var progressMax: Float64 = 100.0
    var bgColor: UInt32 = 0
    var color: UInt32 = 0x007DFF
    var secondColor: UInt32 = 0
    @Link
    var progressSecond: Float64 = 0.0
    @Link
    var mOffset: Float64 = 0.0
    @State
    var bgPathCmd: String = ""
    @State
    var progressPathCmd: String = ""
    @State
    var secondProgressPathCmd: String = ""
    @Consume
    @Watch[onChanged]
    var progress: Float64 = 0.0

    func onChanged() {
        launch {
            this.progressBar.setOffset(this.mOffset)
            this.progressBar.setProgress(this.progress)
            this.progressPathCmd = this.progressBar.getPathCmd()
        }
    }

    protected override func aboutToAppear() {
        this.mHeight = this.strokeWidth
        var hPath = HorizontalPath()
        hPath.setMaxProgress(this.progressMax)
        hPath.setBarColor(this.color)
        hPath.setProgress(this.progress)
        hPath.setTotalWidth(1000.0)

        this.progressBar = hPath
        this.progressPathCmd = this.progressBar.getPathCmd()

        if (this.bgColor != 0) {
            var bgPath: HorizontalPath = HorizontalPath()
            bgPath.setMaxProgress(this.progressMax)
            bgPath.setBarColor(this.color)
            bgPath.setProgress(this.progressMax)
            bgPath.setTotalWidth(1000.0)

            this.bgBar = bgPath
            this.bgPathCmd = this.bgBar.getPathCmd()
        }

        if (this.secondColor != 0) {
            var secondPath: HorizontalPath = HorizontalPath()
            secondPath.setMaxProgress(this.progressMax)
            secondPath.setBarColor(this.color)
            secondPath.setProgress(this.progressSecond)
            secondPath.setTotalWidth(1000.0)

            this.secondBar = secondPath
            this.secondProgressPathCmd = this.secondBar.getPathCmd()
        }
    }

    func build() {
        Column {
            Shape() {
                if (this.bgColor != 0) {
                    Path().commands(this.bgPathCmd).stroke(this.bgColor).strokeWidth(this.strokeWidth)
                }
                if (this.secondColor != 0) {
                    Path().commands(this.secondProgressPathCmd).stroke(this.secondColor).strokeWidth(this.strokeWidth)
                }
                Path().commands(this.progressPathCmd).stroke(this.color).strokeWidth(this.strokeWidth)
            }.width(100.percent).height(this.mHeight)
        }
    }
}
