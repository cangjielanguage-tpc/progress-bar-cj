/**
 * Created on 2024/11/29
 */
package ohos_app_cangjie_entry.pages.level_1

import ohos.state_macro_manage.*

@Entry
@Component
class L1_test_material_01 {
    var progress: Float64 = 30.0
    var indeterminate: Bool = false
    var frameworkModel: MaterialModel = MaterialModel()
    var frameworkModelTwo: MaterialModel = MaterialModel()
    var frameworkModelThree: MaterialModel = MaterialModel()
    var frameworkModelFour: MaterialModel = MaterialModel()
    var frameworkModelFive: MaterialModel = MaterialModel()
    var frameworkModelSix: MaterialModel = MaterialModel()
    var frameworkModelSeven: MaterialModel = MaterialModel()
    var frameworkModelEight: MaterialModel = MaterialModel()
    var frameworkModelNine: MaterialModel = MaterialModel()
    var frameworkModelTen: MaterialModel = MaterialModel()
    var frameworkModelEleven: MaterialModel = MaterialModel()
    var frameworkModelTwelve: MaterialModel = MaterialModel()
    var frameworkModelThirteen: MaterialModel = MaterialModel()
    var frameworkModelFourteen: MaterialModel = MaterialModel()
    var frameworkModelFifteen: MaterialModel = MaterialModel()
    var frameworkModelSixteen: MaterialModel = MaterialModel()
    var frameworkModelSeventeen: MaterialModel = MaterialModel()
    var frameworkModelEighteen: MaterialModel = MaterialModel()

    protected override func aboutToAppear() {
        this.frameworkModel.setColor(0xff0000)
        this.frameworkModel.setSecondColor(0x00ff00)
        this.frameworkModel.setSecondProgress(60.0)
        this.frameworkModel.setBgColor(0x0000ff)

        this.frameworkModelTwo.setColor(0xf44336)
        this.frameworkModelTwo.setSecondColor(0xf7aca7)
        this.frameworkModelTwo.setSecondProgress(60.0)
        this.frameworkModelTwo.setBgColor(0xf8cac7)

        this.frameworkModelThree.setColor(0xf44336)
        this.frameworkModelThree.setSecondColor(0xf7aca7)
        this.frameworkModelThree.setSecondProgress(60.0)
        this.frameworkModelThree.setBgColor(0xf8cac7)

        this.frameworkModelFour.setIndeterminateAngle(true)
        this.frameworkModelFour.setBgColor(0xb3ddd9)

        this.frameworkModelFive.setIndeterminateAngle(true)
        this.frameworkModelFive.setProgress(3.0)
        this.frameworkModelFive.setBgColor(0xb3ddd9)

        this.frameworkModelSix.setIndeterminateAngle(true)
        this.frameworkModelSix.setColor(0x009688)
        this.frameworkModelSix.setBgColor(0xb3ddd9)

        this.frameworkModelSeven.setIndeterminateAngle(true)
        this.frameworkModelSeven.setColor(0xf44336)
        this.frameworkModelSeven.setBgColor(0xf8cac7)

        this.frameworkModelEight.setIndeterminateAngle(false)
        this.frameworkModelEight.setIndeterminate(true)
        this.frameworkModelEight.setRadius(40.0)
        this.frameworkModelEight.setStrokeWidth(8.0)

        this.frameworkModelNine.setIndeterminateAngle(false)
        this.frameworkModelNine.setIndeterminate(true)
        this.frameworkModelNine.setRadius(20.0)
        this.frameworkModelNine.setStrokeWidth(8.0)

        this.frameworkModelTen.setIndeterminateAngle(false)
        this.frameworkModelTen.setIndeterminate(true)
        this.frameworkModelTen.setRadius(6.0)
        this.frameworkModelTen.setStrokeWidth(2.0)

        this.frameworkModelEleven.setIndeterminateAngle(true)
        this.frameworkModelEleven.setIndeterminate(true)
        this.frameworkModelEleven.setRadius(40.0)
        this.frameworkModelEleven.setStrokeWidth(8.0)

        this.frameworkModelTwelve.setIndeterminateAngle(true)
        this.frameworkModelTwelve.setIndeterminate(true)
        this.frameworkModelTwelve.setRadius(20.0)
        this.frameworkModelTwelve.setStrokeWidth(8.0)

        this.frameworkModelThirteen.setIndeterminateAngle(true)
        this.frameworkModelThirteen.setIndeterminate(true)
        this.frameworkModelThirteen.setRadius(6.0)
        this.frameworkModelThirteen.setStrokeWidth(2.0)

        this.frameworkModelSeventeen.setColor(0x009688)
        this.frameworkModelSeventeen.setSecondColor(0xa39fc6)
        this.frameworkModelSeventeen.setSecondProgress(60.0)

        this.frameworkModelEighteen.setIndeterminateAngle(true)
        this.frameworkModelEighteen.setColor(0x009688)
    }

    func build() {
        Column {
            Flex(FlexParams(direction: FlexDirection.Column)) {

                Text("color").fontSize(18).margin(2)
                Flex(FlexParams(direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween)) {
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModel)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModelTwo)
                    }
                    Flex(
                        FlexParams(direction: FlexDirection.Row, alignItems: ItemAlign.End,
                        justifyContent: FlexAlign.End)) {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModelThree)
                    }.padding(right: 5, bottom: 0)
                }.height(100)
            }.width(100.percent).height(100.percent).padding(10)
        }.width(100.percent).height(100.percent).backgroundColor(Color.WHITE)
    }
}
