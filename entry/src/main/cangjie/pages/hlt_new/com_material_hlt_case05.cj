/**
 * Created on 2025/3/18
 */
package ohos_app_cangjie_entry.pages.hlt_new

import ohos.state_macro_manage.*



@Entry
@Component
class Case05 {
    let scroller = Scroller()
    private var model: ComMaterialModel = ComMaterialModel()
    private var model2: ComMaterialModel = ComMaterialModel()
    private var model3: ComMaterialModel = ComMaterialModel()
    private var model4: ComMaterialModel = ComMaterialModel()
    private var model5: ComMaterialModel = ComMaterialModel()
    private var model6: ComMaterialModel = ComMaterialModel()
    private var model7: ComMaterialModel = ComMaterialModel()
    private var model8: ComMaterialModel = ComMaterialModel()
    private var model9: ComMaterialModel = ComMaterialModel()

    protected override func aboutToAppear() {
        this.model9.setProgress(0.5)
        this.model9.setLinearProgress(true)
        this.model9.init_data()

        this.model.setProgress(0.75)
        this.model.init_data()

        this.model2.setCircleRadius(0.0)
        this.model2.init_data()

        this.model3.setBarColor(0x00ff00)
        this.model3.init_data()

        this.model4.setRimColor(0x00ff00)
        this.model4.setRimWidth(10.0)
        this.model4.init_data()

        this.model5.setRimWidth(0.0)
        this.model5.init_data()

        this.model6.setBarWidth(0.0)
        this.model6.init_data()

        this.model7.setSpinning(false)
        this.model7.init_data()
        this.model8.setSpinSpeed(0.0)
        this.model8.init_data()
    }

    protected override func aboutToDisappear() {
        this.model.closeTimer()
    }

    func build() {
        Scroll(this.scroller) {
            Column {
                Flex(
                    FlexParams(direction: FlexDirection.Column, alignItems: ItemAlign.Start,
                        justifyContent: FlexAlign.Start)) {
                    Text('正常').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        ComWheel(model: this.model9)
                    }.width(100.percent).margin(bottom: 5, top: 5)
                    Text('setProgress(0.75)').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        ComWheel(model: this.model)
                    }.width(100.percent).margin(bottom: 5, top: 5)
                    Text('setCircleRadius(0.0)').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        ComWheel(model: this.model2)
                    }.width(100.percent).margin(bottom: 5, top: 5)
                    Text('setBarColor(0x00ff00)').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        ComWheel(model: this.model3)
                    }.width(100.percent).margin(bottom: 5, top: 5)
                    Text('setRimColor(0x00ff00)').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        ComWheel(model: this.model4)
                    }.width(100.percent).margin(bottom: 5, top: 5)
                    Text('setRimWidth(0.0)').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        ComWheel(model: this.model5)
                    }.width(100.percent).margin(bottom: 5, top: 5)
                    Text('setBarWidth(0.0)').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        ComWheel(model: this.model6)
                    }.width(100.percent).margin(bottom: 5, top: 5)
                    Text('setSpinning(false)').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        ComWheel(model: this.model7)
                    }.width(100.percent).margin(bottom: 5, top: 5)
                    Text('setSpinSpeed(0.0)').fontColor(0xB5B5B5).fontSize(15)
                    Row() {
                        ComWheel(model: this.model8)
                    }.width(100.percent).margin(bottom: 5, top: 5)
                }.width(100.percent).height(100.percent).padding(15).backgroundColor(0x363636)
            }.width(100.percent).height(100.percent).backgroundColor(Color.WHITE)
        }
    }
}
