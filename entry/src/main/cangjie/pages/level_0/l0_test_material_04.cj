/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

package ohos_app_cangjie_entry.pages.level_0

import ohos.state_macro_manage.*

@Entry
@Component
class L0_test_material_04 {
    var isFinish: Bool = false
    var progress: Float64 = 30.0
    var fastOutLinearIn: Curve = Curve.FastOutLinearIn

    var frameworkModel: MaterialModel = MaterialModel()
    var frameworkModelTwo: MaterialModel = MaterialModel()
    var frameworkModelThree: MaterialModel = MaterialModel()
    var frameworkModelFour: MaterialModel = MaterialModel()
    var frameworkModelFive: MaterialModel = MaterialModel()

    var frameworkModelSix: MaterialModel = MaterialModel()

    protected override func aboutToAppear() {
        this.frameworkModel.setIsPocket(false)
        this.frameworkModel.setColors([0x33b5e5])
        this.frameworkModel.setIsReversed(false)
        this.frameworkModel.setIsMirror(false)
        this.frameworkModel.setIsGradients(false)
        this.frameworkModel.setSpeed(1.5)
        this.frameworkModel.setStrokeWidth(4.0)
        this.frameworkModel.setSeparatorLength(vp2px(3.0)().value)
        this.frameworkModel.setSectionsCount(7)
        this.frameworkModel.setCurve(Curve.FastOutSlowIn)
        this.frameworkModel.setIsStop(false)

        this.frameworkModelTwo.setIsPocket(false)
        this.frameworkModelTwo.setColors([0x33b5e5])
        this.frameworkModelTwo.setIsReversed(false)
        this.frameworkModelTwo.setIsMirror(false)
        this.frameworkModelTwo.setIsGradients(false)
        this.frameworkModelTwo.setSpeed(1.5)
        this.frameworkModelTwo.setStrokeWidth(4.0)
        this.frameworkModelTwo.setSeparatorLength(vp2px(4.0)().value)
        this.frameworkModelTwo.setSectionsCount(4)
        this.frameworkModelTwo.setCurve(Curve.FastOutLinearIn)
        this.frameworkModelTwo.setIsStop(false)

        this.frameworkModelThree.setIsPocket(false)
        this.frameworkModelThree.setIsReversed(false)
        this.frameworkModelThree.setIsMirror(false)
        this.frameworkModelThree.setIsGradients(false)
        this.frameworkModelThree.setSpeed(1.0)
        this.frameworkModelThree.setStrokeWidth(4.0)
        this.frameworkModelThree.setSeparatorLength(vp2px(12.0)().value)
        this.frameworkModelThree.setSectionsCount(4)
        this.frameworkModelThree.setCurve(Curve.Linear)
        this.frameworkModelThree.setIsStop(false)

        this.frameworkModelFour.setIsPocket(false)
        this.frameworkModelFour.setIsReversed(true)
        this.frameworkModelFour.setIsMirror(true)
        this.frameworkModelFour.setIsGradients(false)
        this.frameworkModelFour.setSpeed(1.5)
        this.frameworkModelFour.setStrokeWidth(4.0)
        this.frameworkModelFour.setSeparatorLength(vp2px(4.0)().value)
        this.frameworkModelFour.setSectionsCount(3)
        this.frameworkModelFour.setCurve(Curve.FastOutSlowIn)
        this.frameworkModelFour.setIsStop(false)

        this.frameworkModelFive.setIsPocket(false)
        this.frameworkModelFive.setIsReversed(false)
        this.frameworkModelFive.setIsMirror(false)
        this.frameworkModelFive.setIsGradients(true)
        this.frameworkModelFive.setSpeed(1.0)
        this.frameworkModelFive.setStrokeWidth(4.0)
        this.frameworkModelFive.setSeparatorLength(vp2px(0.0)().value)
        this.frameworkModelFive.setSectionsCount(5)
        this.frameworkModelFive.setCurve(Curve.FastOutSlowIn)
        this.frameworkModelFive.setIsStop(false)

        this.frameworkModelSix.setCurve(Curve.FastOutSlowIn)
        this.frameworkModelSix.setStrokeWidth(4.0)
    }

    func build() {
        Column {
            Flex(
                FlexParams(direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.Start
            )) {

                //进度条们
                Text('Normal indeterminate drawable').fontColor(0xB5B5B5).fontSize(15)
                Row() {
                    MaterialProgressBar(style: MaterialProgressStyle.SmoothHorizontal, modelBuild: this.frameworkModel)
                }.width(100.percent).margin(bottom: 5, top: 5)

                //进度条们
                Text('Normal indeterminate drawable').fontColor(0xB5B5B5).fontSize(15)
                Row() {
                    MaterialProgressBar(style: MaterialProgressStyle.SmoothHorizontal,
                        modelBuild: this.frameworkModelTwo)
                }.width(100.percent).margin(bottom: 5, top: 5)

                Text('GPlus').fontColor(0xB5B5B5).fontSize(15)
                Row() {
                    MaterialProgressBar(style: MaterialProgressStyle.SmoothHorizontal,
                        modelBuild: this.frameworkModelThree)
                }.width(100.percent).margin(bottom: 5, top: 5)

                Text('GL now').fontColor(0xB5B5B5).fontSize(15)
                Row() {
                    MaterialProgressBar(style: MaterialProgressStyle.SmoothHorizontal,
                        modelBuild: this.frameworkModelFour)
                }.width(100.percent).margin(bottom: 5, top: 5)

                Text('Gradient').fontColor(0xB5B5B5).fontSize(15)
                Row() {
                    MaterialProgressBar(style: MaterialProgressStyle.SmoothHorizontal,
                        modelBuild: this.frameworkModelFive)
                }.width(100.percent).margin(bottom: 5, top: 5)
                Text('Circular').fontColor(0xB5B5B5).fontSize(15)
                Row() {
                    MaterialProgressBar(style: MaterialProgressStyle.SmoothCircular, modelBuild: this.frameworkModelSix)
                }.width(20.percent).margin(bottom: 5, top: 5, left: 150)
            }.width(100.percent).height(100.percent).padding(15).backgroundColor(0x363636)
        }.width(100.percent).height(100.percent).backgroundColor(Color.WHITE)
    }
}
