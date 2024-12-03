/**
 * Created on 2024/11/29
 */
package ohos_app_cangjie_entry.pages.level_1

import ohos.state_macro_manage.*

@Entry
@Component
class L1_test_material_03 {
    var isFinish: Bool = false
    var progress: Float64 = 30.0
    var fastOutLinearIn: Curve = Curve.FastOutLinearIn

    var frameworkModel1: MaterialModel = MaterialModel()
    var frameworkModel2: MaterialModel = MaterialModel()
    var frameworkModel3: MaterialModel = MaterialModel()
    var frameworkModel4: MaterialModel = MaterialModel()
    var frameworkModel5: MaterialModel = MaterialModel()
    var frameworkModel6: MaterialModel = MaterialModel()

    protected override func aboutToAppear() {
        this.frameworkModel1.setCurve(Curve.FastOutSlowIn)
        this.frameworkModel1.setStrokeWidth(4.0)

        this.frameworkModel2.setCurve(Curve.FastOutSlowIn)
        this.frameworkModel2.setStrokeWidth(7.0)
        this.frameworkModel2.setProgress(70.0)

        this.frameworkModel3.setCurve(Curve.FastOutSlowIn)
        this.frameworkModel3.setStrokeWidth(2.0)
        this.frameworkModel3.setProgress(20.0)

                this.frameworkModel4.setCurve(Curve.FastOutSlowIn)
        this.frameworkModel4.setStrokeWidth(10.0)
        this.frameworkModel4.setProgress(0.0)
    }

    func build() {
        Column {
            Flex(
                FlexParams(direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.Start
            )) {
                Text('Circular').fontColor(0xB5B5B5).fontSize(15)
                Row() {
                    MaterialProgressBar(style: MaterialProgressStyle.SmoothCircular, modelBuild: this.frameworkModel1)
                }.width(20.percent).margin(bottom: 5, top: 5, left: 150)

                Text('progress 70.0').fontColor(0xB5B5B5).fontSize(15)
                Row() {
                    MaterialProgressBar(style: MaterialProgressStyle.SmoothCircular, modelBuild: this.frameworkModel2)
                }.width(20.percent).margin(bottom: 5, top: 5, left: 150)

                Text('progress 20.0').fontColor(0xB5B5B5).fontSize(15)
                Row() {
                    MaterialProgressBar(style: MaterialProgressStyle.SmoothCircular, modelBuild: this.frameworkModel3)
                }.width(20.percent).margin(bottom: 5, top: 5, left: 150)
                Text('progress 0.0').fontColor(0xB5B5B5).fontSize(15)
                Row() {
                    MaterialProgressBar(style: MaterialProgressStyle.SmoothCircular, modelBuild: this.frameworkModel4)
                }.width(20.percent).margin(bottom: 5, top: 5, left: 150)

            }.width(100.percent).height(100.percent).padding(15).backgroundColor(0x363636)
        }.width(100.percent).height(100.percent).backgroundColor(Color.WHITE)
    }
}
