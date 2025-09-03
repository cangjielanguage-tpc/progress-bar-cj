/**
 * Created on 2024/11/29
 */
package ohos_app_cangjie_entry.pages.level_1

import ohos.state_macro_manage.*

@Entry
@Component
class L1_test_material_02 {
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
    var frameworkModel11: MaterialModel = MaterialModel()
    var frameworkModel12: MaterialModel = MaterialModel()

    protected override func aboutToAppear() {
        this.frameworkModel.setProgress(30.0)
        this.frameworkModel.setColor(0xff0000)
        this.frameworkModel.setSecondColor(0x00ff00)
        this.frameworkModel.setBgColor(0x0000ff)

        this.frameworkModelTwo.setColor(0xf44336)
        this.frameworkModelTwo.setSecondColor(0xf7aca7)
        this.frameworkModelTwo.setProgress(20.0)
        this.frameworkModelTwo.setSecondProgress(10.0)
        this.frameworkModelTwo.setBgColor(0xf8cac7)

        this.frameworkModelThree.setColor(0xf44336)
        this.frameworkModelThree.setSecondColor(0xf7aca7)
        this.frameworkModelThree.setProgress(0.0)
        this.frameworkModelThree.setSecondProgress(0.0)
        this.frameworkModelThree.setBgColor(0xf8cac7)

        this.frameworkModelFour.setIndeterminateAngle(true)
        this.frameworkModelFour.setBgColor(0xb3ddd9)

        this.frameworkModelFive.setIndeterminateAngle(true)
        this.frameworkModelFive.setIndeterminate(true)
        this.frameworkModelFive.setBgColor(0xb3ddd9)

        this.frameworkModel11.setIndeterminateAngle(true)
        this.frameworkModel11.setProgress(20.0)
        this.frameworkModel11.setBgColor(0xb3ddd9)

        this.frameworkModel12.setIndeterminateAngle(true)
        this.frameworkModel12.setProgress(2.0)
        this.frameworkModel12.setBgColor(0xb3ddd9)

        this.frameworkModelSix.setIndeterminateAngle(true)
        this.frameworkModelSix.setColor(0xf44336)
        this.frameworkModelSix.setSecondColor(0xf7aca7)
        this.frameworkModelSix.setProgress(5.0)
        this.frameworkModelSix.setSecondProgress(10.0)
        this.frameworkModelSix.setBgColor(0xf8cac7)

        this.frameworkModelSeven.setIndeterminateAngle(true)
        this.frameworkModelSeven.setColor(0xf44336)
        this.frameworkModelSeven.setSecondColor(0xf7aca7)
        this.frameworkModelSeven.setProgress(0.0)
        this.frameworkModelSeven.setSecondProgress(0.0)
        this.frameworkModelSeven.setBgColor(0xf8cac7)

        this.frameworkModelNine.setIndeterminateAngle(true)
        this.frameworkModelNine.setColor(0xf44336)
        this.frameworkModelNine.setBgColor(0xf8cac7)

        this.frameworkModelTen.setIndeterminateAngle(true)
        this.frameworkModelTen.setColor(0xf44336)
        this.frameworkModelTen.setBgColor(0xf8cac7)
    }

    func build() {
        Column {
            Flex(FlexParams(direction: FlexDirection.Column)) {

                            Text("back").id("back").height(80)
                                .onClick ({ evt =>
                                    Router.back()
                                })
                Text("设置 Progress 30").fontSize(14).fontColor(0x666666).margin(2)

                Flex(FlexParams(direction: FlexDirection.Column)) {
                    MaterialProgressBar(style: MaterialProgressStyle.MaterialHorizontal, modelBuild: this.frameworkModel
                    )
                }.height(20).width(100.percent).margin(2)

                Text("设置 Progress 20").fontSize(14).fontColor(0x666666).margin(2)

                Flex(FlexParams(direction: FlexDirection.Column)) {
                    MaterialProgressBar(style: MaterialProgressStyle.MaterialHorizontal,
                        modelBuild: this.frameworkModelTwo)
                }.height(20).width(100.percent).margin(2)

                Text("progress: 0.0 secondProgress: 0.0").fontSize(14).fontColor(0x666666).margin(2)

                Flex(FlexParams(direction: FlexDirection.Column)) {
                    MaterialProgressBar(style: MaterialProgressStyle.MaterialHorizontal,
                        modelBuild: this.frameworkModelThree)
                }.height(20).width(100.percent).margin(2)

                Text("setIndeterminateAngle: true").fontSize(14).fontColor(0x666666).margin(2)
                Flex(FlexParams(direction: FlexDirection.Column)) {
                    MaterialProgressBar(style: MaterialProgressStyle.MaterialHorizontal,
                        modelBuild: this.frameworkModelFour)
                }.height(20).width(100.percent).margin(2)

                Text("setIndeterminateAngle: true setIndeterminate: true(setIndeterminate 对柱状进度条无影响)").fontSize(
                    14).fontColor(0x666666).margin(2)

                Flex(FlexParams(direction: FlexDirection.Column)) {
                    MaterialProgressBar(style: MaterialProgressStyle.MaterialHorizontal,
                        modelBuild: this.frameworkModelFive)
                }.height(20).width(100.percent).margin(2)

                Text("setIndeterminateAngle: true progress: 20.0").fontSize(
                    14).fontColor(0x666666).margin(2)

                Flex(FlexParams(direction: FlexDirection.Column)) {
                    MaterialProgressBar(style: MaterialProgressStyle.MaterialHorizontal,
                        modelBuild: this.frameworkModel11)
                }.height(20).width(100.percent).margin(2)

                Text("setIndeterminateAngle: true progress: 2.0").fontSize(
                    14).fontColor(0x666666).margin(2)

                Flex(FlexParams(direction: FlexDirection.Column)) {
                    MaterialProgressBar(style: MaterialProgressStyle.MaterialHorizontal,
                        modelBuild: this.frameworkModel12)
                }.height(20).width(100.percent).margin(2)

                Text("setIndeterminateAngle: true progress: 5.0 secondProgress: 10.0").fontSize(14).fontColor(0x666666).margin(2)
                Flex(FlexParams(direction: FlexDirection.Column)) {
                    MaterialProgressBar(style: MaterialProgressStyle.MaterialHorizontal,
                        modelBuild: this.frameworkModelSix)
                }.height(20).width(100.percent).margin(2)
                Text("setIndeterminateAngle: true progress: 0.0 secondProgress: 0.0").fontSize(14).fontColor(0x666666).margin(2)
                Flex(FlexParams(direction: FlexDirection.Column)) {
                    MaterialProgressBar(style: MaterialProgressStyle.MaterialHorizontal,
                        modelBuild: this.frameworkModelSeven)
                }.height(20).width(100.percent).margin(2)

                Text("默认 MaterialProgressBar").fontSize(14).fontColor(0x666666).margin(2)
                Flex(FlexParams(direction: FlexDirection.Column)) {
                    MaterialProgressBar(style: MaterialProgressStyle.MaterialHorizontal,
                        modelBuild: this.frameworkModelEight)
                }.height(20).width(100.percent).margin(2)

                Text("默认 MaterialComponent").fontSize(14).fontColor(0x666666).margin(2)
                Flex(FlexParams(direction: FlexDirection.Column)) {
                    MaterialComponent(modelBuild: this.frameworkModelTen)
                }.height(20).width(100.percent).margin(2)

                Text("offset: 2.0").fontSize(14).fontColor(0x666666).margin(2)
                Flex(FlexParams(direction: FlexDirection.Column)) {
                    MaterialComponent(modelBuild: this.frameworkModelNine, mOffset: 2.0)
                }.height(20).width(100.percent).margin(2)

                Text("offset: 200.0").fontSize(14).fontColor(0x666666).margin(2)
                Flex(FlexParams(direction: FlexDirection.Column)) {
                    MaterialComponent(modelBuild: this.frameworkModelTen, mOffset: 200.0)
                }.height(20).width(100.percent).margin(2)
            }.width(100.percent).height(100.percent).padding(10)
        }.width(100.percent).height(100.percent).backgroundColor(Color.WHITE)
    }
}
