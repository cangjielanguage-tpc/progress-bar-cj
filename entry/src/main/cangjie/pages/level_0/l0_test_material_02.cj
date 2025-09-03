/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package ohos_app_cangjie_entry.pages.level_0

import ohos.state_macro_manage.*

@Entry
@Component
class L0_test_material_02 {
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
        this.frameworkModel.setStyle(MaterialProgressStyle.MaterialHorizontal)
        this.frameworkModel.setProgress(30.0)
        this.frameworkModel.setSecondProgress(60.0)
        this.frameworkModel.setColor(0x009688)
        this.frameworkModel.setSecondColor(0x9fc6c2)
        this.frameworkModel.setBgColor(0xd7d7d7)

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

                            Text("back").id("back").height(80)
                                .onClick ({ evt =>
                                    Router.back()
                                })
                Text("Determinate Horizontal ProgressBar").fontSize(18).margin(2)
                Text("Framework Implementation").fontSize(14).fontColor(0x666666).margin(2)

                Flex(FlexParams(direction: FlexDirection.Column)) {
                    MaterialProgressBar(style: MaterialProgressStyle.MaterialHorizontal, modelBuild: this.frameworkModel
                    )
                }.height(20).width(100.percent).margin(2)

                Text("Library Implementation").fontSize(14).fontColor(0x666666).margin(2)

                Flex(FlexParams(direction: FlexDirection.Column)) {
                    MaterialProgressBar(style: MaterialProgressStyle.MaterialHorizontal,
                        modelBuild: this.frameworkModelTwo)
                }.height(20).width(100.percent).margin(2)

                Text("Library Implementation (Tinted)").fontSize(14).fontColor(0x666666).margin(2)

                Flex(FlexParams(direction: FlexDirection.Column)) {
                    MaterialProgressBar(style: MaterialProgressStyle.MaterialHorizontal,
                        modelBuild: this.frameworkModelThree)
                }.height(20).width(100.percent).margin(2)

                Text("Indeterminate Horizontal ProgressBar").fontSize(18).margin(2)
                Text("Framework Implementation").fontSize(14).fontColor(0x666666).margin(2)

                Flex(FlexParams(direction: FlexDirection.Column)) {
                    if (this.indeterminate) {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialHorizontal,
                            modelBuild: this.frameworkModelFour)
                    } else {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialHorizontal,
                            modelBuild: this.frameworkModelFive)
                    }
                }.height(20).width(100.percent).margin(2)
                Text("Library Implementation").fontSize(14).fontColor(0x666666).margin(2)
                Flex(FlexParams(direction: FlexDirection.Column)) {
                    MaterialProgressBar(style: MaterialProgressStyle.MaterialHorizontal,
                        modelBuild: this.frameworkModelSix)
                }.height(20).width(100.percent).margin(2)
                Text("Library Implementation (Tinted)").fontSize(14).fontColor(0x666666).margin(2)
                Flex(FlexParams(direction: FlexDirection.Column)) {
                    MaterialProgressBar(style: MaterialProgressStyle.MaterialHorizontal,
                        modelBuild: this.frameworkModelSeven)
                }.height(20).width(100.percent).margin(2)

                Text("Determinate Circular ProgressBar").fontSize(18).margin(2)
                Text("Framework Implementation").fontSize(14).fontColor(0x666666).margin(2)
                Text("(Not Available)").fontSize(14).fontColor(0x666666).margin(2)
                Text("Library Implementation").fontSize(14).fontColor(0x666666).margin(2)
                Flex(FlexParams(direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween)) {
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModelEight)
                    }

                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModelNine)
                    }
                    //                    .position(x: 40.percent, y: 50.percent)

                    Flex(
                        FlexParams(direction: FlexDirection.Row, alignItems: ItemAlign.End,
                        justifyContent: FlexAlign.End)) {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModelTen)
                    }.padding(right: 5, bottom: 0)
                }.height(100)

                Text("Indeterminate Circular ProgressBar").fontSize(18).margin(2)
                Text("Framework Implementation").fontSize(14).fontColor(0x666666).margin(2)
                Flex(FlexParams(direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween)) {
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModelEleven)
                    }

                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModelTwelve)
                    }
                    Flex(
                        FlexParams(direction: FlexDirection.Row, alignItems: ItemAlign.End,
                        justifyContent: FlexAlign.End)) {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModelThirteen)
                    }.padding(right: 15, bottom: 0)
                }.height(100)
                Text("ProgressBar on Toolbar").fontSize(18).margin(2)

                Flex(FlexParams(direction: FlexDirection.Column)) {
                    Text("Horizontal").width(100.percent).height(25).fontSize(20).fontWeight(W800).align(
                        Alignment.TopStart).fontColor(0xffffff).margin(bottom: 5)
                    MaterialProgressBar(style: MaterialProgressStyle.MaterialHorizontal,
                        modelBuild: this.frameworkModelSeventeen)
                }.width(100.percent).height(40).margin(2).backgroundColor(0x000000)

                Flex(FlexParams(direction: FlexDirection.Column)) {
                    Text("Indeterminate Horizontal").width(100.percent).height(25).fontSize(20).fontWeight(W800).align(
                        Alignment.TopStart).fontColor(0xffffff).margin(bottom: 5)
                    MaterialProgressBar(style: MaterialProgressStyle.MaterialHorizontal,
                        modelBuild: this.frameworkModelEighteen)
                }.width(100.percent).height(40).margin(2).backgroundColor(0x000000)
            }.width(100.percent).height(100.percent).padding(10)
        }.width(100.percent).height(100.percent).backgroundColor(Color.WHITE)
    }
}
