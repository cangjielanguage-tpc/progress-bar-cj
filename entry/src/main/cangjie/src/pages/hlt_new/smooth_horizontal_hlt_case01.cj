/**
 * Created on 2025/3/18
 */
package ohos_app_cangjie_entry.pages.hlt_new

import ohos.state_macro_manage.*

@Entry
@Component
class Case01 {
    let scroller = Scroller()

    var isFinish: Bool = false
    var progress: Float64 = 30.0
    var fastOutLinearIn: Curve = Curve.FastOutLinearIn

    var frameworkModel: MaterialModel = MaterialModel()
    var frameworkModelTwo: MaterialModel = MaterialModel()
    var frameworkModelFour: MaterialModel = MaterialModel()
    var frameworkModelFive: MaterialModel = MaterialModel()

    var frameworkModelSix: MaterialModel = MaterialModel()
    var frameworkModel7: MaterialModel = MaterialModel()
    var frameworkModel8: MaterialModel = MaterialModel()
    var frameworkModel9: MaterialModel = MaterialModel()
    var frameworkModel10: MaterialModel = MaterialModel()
    var frameworkModel11: MaterialModel = MaterialModel()
    var frameworkModel12: MaterialModel = MaterialModel()
    var frameworkModel13: MaterialModel = MaterialModel()
    var frameworkModel14: MaterialModel = MaterialModel()
    var frameworkModel15: MaterialModel = MaterialModel()
    var frameworkModel16: MaterialModel = MaterialModel()

    protected override func aboutToAppear() {
        this.frameworkModelTwo.setIsPocket(true)

        frameworkModelFour.setColors([0x33b5e5])
        frameworkModelFive.setColors([])
        frameworkModelSix.setColors([0x33b5e5, 0x444444])

        this.frameworkModel7.setIsReversed(true)

        this.frameworkModel8.setIsMirror(true)

        this.frameworkModel9.setIsGradients(true)

        this.frameworkModel10.setSpeed(0.0)
        this.frameworkModel11.setSpeed(3.0)

        this.frameworkModel12.setStrokeWidth(0.0)

        this.frameworkModel13.setSeparatorLength(vp2px(3.0.vp)().value)

        this.frameworkModel14.setSectionsCount(7)

        this.frameworkModel15.setCurve(Curve.FastOutSlowIn)

        this.frameworkModel16.setIsStop(true)
    }

    func build() {
        Scroll(this.scroller) {
            Column {
                Flex(
                    FlexParams(direction: FlexDirection.Column, alignItems: ItemAlign.Start,
                        justifyContent: FlexAlign.Start)) {

                    //进度条们
                    Text('默认').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        MaterialProgressBar(style: MaterialProgressStyle.SmoothHorizontal,
                            modelBuild: this.frameworkModel)
                    }.width(100.percent).margin(bottom: 5, top: 5)

                    //进度条们
                    Text('setIsPocket').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        MaterialProgressBar(style: MaterialProgressStyle.SmoothHorizontal,
                            modelBuild: this.frameworkModelTwo)
                    }.width(100.percent).margin(bottom: 5, top: 5)

                    Text('setColors([0x33b5e5]').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        MaterialProgressBar(style: MaterialProgressStyle.SmoothHorizontal,
                            modelBuild: this.frameworkModelFour)
                    }.width(100.percent).margin(bottom: 5, top: 5)

                    Text('setColors([])').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        MaterialProgressBar(style: MaterialProgressStyle.SmoothHorizontal,
                            modelBuild: this.frameworkModelFive)
                    }.width(100.percent).margin(bottom: 5, top: 5)
                    Text('setColors([0x33b5e5, 0x444444])').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        MaterialProgressBar(style: MaterialProgressStyle.SmoothHorizontal,
                            modelBuild: this.frameworkModelSix)
                    }.width(100.percent).margin(bottom: 5, top: 5)
                    Text('setIsReversed(true)').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        MaterialProgressBar(style: MaterialProgressStyle.SmoothHorizontal,
                            modelBuild: this.frameworkModel7)
                    }.width(100.percent).margin(bottom: 5, top: 5)
                    Text('setIsMirror(true)').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        MaterialProgressBar(style: MaterialProgressStyle.SmoothHorizontal,
                            modelBuild: this.frameworkModel8)
                    }.width(100.percent).margin(bottom: 5, top: 5)

                    Text('setIsGradients(true)').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        MaterialProgressBar(style: MaterialProgressStyle.SmoothHorizontal,
                            modelBuild: this.frameworkModel9)
                    }.width(100.percent).margin(bottom: 5, top: 5)
                    Text('setSpeed(0.0)').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        MaterialProgressBar(style: MaterialProgressStyle.SmoothHorizontal,
                            modelBuild: this.frameworkModel10)
                    }.width(100.percent).margin(bottom: 5, top: 5)
                    Text('setSpeed(3.0)').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        MaterialProgressBar(style: MaterialProgressStyle.SmoothHorizontal,
                            modelBuild: this.frameworkModel11)
                    }.width(100.percent).margin(bottom: 5, top: 5)
                    Text('setStrokeWidth(0.0)').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        MaterialProgressBar(style: MaterialProgressStyle.SmoothHorizontal,
                            modelBuild: this.frameworkModel12)
                    }.width(100.percent).margin(bottom: 5, top: 5)
                    Text('setSeparatorLength(vp2px(Length(3.0))().value)').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        MaterialProgressBar(style: MaterialProgressStyle.SmoothHorizontal,
                            modelBuild: this.frameworkModel13)
                    }.width(100.percent).margin(bottom: 5, top: 5)
                    Text('setSectionsCount(7)').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        MaterialProgressBar(style: MaterialProgressStyle.SmoothHorizontal,
                            modelBuild: this.frameworkModel14)
                    }.width(100.percent).margin(bottom: 5, top: 5)
                    Text('setCurve(Curve.FastOutSlowIn)').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        MaterialProgressBar(style: MaterialProgressStyle.SmoothHorizontal,
                            modelBuild: this.frameworkModel15)
                    }.width(100.percent).margin(bottom: 5, top: 5)
                    Text('setIsStop(true)').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        MaterialProgressBar(style: MaterialProgressStyle.SmoothHorizontal,
                            modelBuild: this.frameworkModel16)
                    }.width(100.percent).margin(bottom: 5, top: 5)
                }.width(100.percent).height(100.percent).padding(15).backgroundColor(0x363636)
            }.width(100.percent).height(100.percent).backgroundColor(Color.WHITE)
        }
    }
}
