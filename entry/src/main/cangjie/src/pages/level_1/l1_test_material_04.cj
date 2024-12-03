/**
 * Created on 2024/11/29
 */
package ohos_app_cangjie_entry.pages.level_1

import ohos.state_macro_manage.*

@Entry
@Component
class L1_test_material_04 {
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
    var frameworkModel13: MaterialModel = MaterialModel()
    var frameworkModel14: MaterialModel = MaterialModel()
    var frameworkModel15: MaterialModel = MaterialModel()
    var frameworkModel16: MaterialModel = MaterialModel()
    var frameworkModel17: MaterialModel = MaterialModel()
    var frameworkModel18: MaterialModel = MaterialModel()
    var frameworkModel19: MaterialModel = MaterialModel()
    var frameworkModel20: MaterialModel = MaterialModel()
    var frameworkModel21: MaterialModel = MaterialModel()
    var frameworkModel22: MaterialModel = MaterialModel()
    var frameworkModel23: MaterialModel = MaterialModel()
    var frameworkModel24: MaterialModel = MaterialModel()
    var frameworkModel25: MaterialModel = MaterialModel()
    var frameworkModel26: MaterialModel = MaterialModel()
    var frameworkModel27: MaterialModel = MaterialModel()
    var frameworkModel28: MaterialModel = MaterialModel()

    protected override func aboutToAppear() {
        this.frameworkModel.setColor(0xff0000) // red
        this.frameworkModel.setSecondColor(0x00ff00) // green
        this.frameworkModel.setBgColor(0x0000ff) // blue
        this.frameworkModel.setProgress(50.0)
        this.frameworkModel.setSecondProgress(60.0)

        this.frameworkModelTwo.setColor(0x000000) // black
        this.frameworkModelTwo.setSecondColor(0x000000) // black
        this.frameworkModelTwo.setBgColor(0x000000) // black
        this.frameworkModelTwo.setProgress(50.0)
        this.frameworkModelTwo.setSecondProgress(60.0)

        this.frameworkModelThree.setColor(0x000000) // black
        this.frameworkModelThree.setSecondColor(0xffffff) // white
        this.frameworkModelThree.setBgColor(0xffffff) // white
        this.frameworkModelThree.setProgress(50.0)
        this.frameworkModelThree.setSecondProgress(60.0)

        this.frameworkModelFour.setColor(0x000000)
        this.frameworkModelFour.setSecondColor(0xffffff)
        this.frameworkModelFour.setBgColor(0xff0000)
        this.frameworkModelFour.setProgress(50.0)
        this.frameworkModelFour.setSecondProgress(60.0)

        this.frameworkModelFive.setColor(0xffffff)
        this.frameworkModelFive.setSecondColor(0xffffff)
        this.frameworkModelFive.setBgColor(0xffffff)
        this.frameworkModelFive.setProgress(50.0)
        this.frameworkModelFive.setSecondProgress(60.0)

        this.frameworkModelSix.setColor(0xffffff)
        this.frameworkModelSix.setSecondColor(0xff0000)
        this.frameworkModelSix.setBgColor(0xffffff)
        this.frameworkModelSix.setProgress(50.0)
        this.frameworkModelSix.setSecondProgress(60.0)

        this.frameworkModelSeven.setColor(0xff0000)
        this.frameworkModelSeven.setSecondColor(-1)
        this.frameworkModelSeven.setBgColor(-2)
        this.frameworkModelSeven.setProgress(50.0)
        this.frameworkModelSeven.setSecondProgress(60.0)

        this.frameworkModelEight.setColor(0xff0000)
        //        this.frameworkModelEight.setSecondColor(-1)
        //        this.frameworkModelEight.setBgColor(-2)
        this.frameworkModelEight.setProgress(50.0)
        this.frameworkModelEight.setSecondProgress(60.0)

        this.frameworkModelNine.setColor(0xff0000) // red
        this.frameworkModelNine.setSecondColor(0x00ff00) // green
        this.frameworkModelNine.setBgColor(0x0000ff) // blue
        this.frameworkModelNine.setProgress(50.0)
        this.frameworkModelNine.setSecondProgress(60.0)

        this.frameworkModelTen.setColor(0xff0000) // red
        this.frameworkModelTen.setSecondColor(0x00ff00) // green
        this.frameworkModelTen.setBgColor(0x0000ff) // blue
        this.frameworkModelTen.setProgress(50.0)
        this.frameworkModelTen.setSecondProgress(60.0)
        this.frameworkModelTen.setRadius(0.0)

        this.frameworkModelEleven.setColor(0xff0000) // red
        this.frameworkModelEleven.setSecondColor(0x00ff00) // green
        this.frameworkModelEleven.setBgColor(0x0000ff) // blue
        this.frameworkModelEleven.setProgress(50.0)
        this.frameworkModelEleven.setSecondProgress(60.0)
        this.frameworkModelEleven.setRadius(30.0)

        this.frameworkModelTwelve.setColor(0xff0000) // red
        this.frameworkModelTwelve.setSecondColor(0x00ff00) // green
        this.frameworkModelTwelve.setBgColor(0x0000ff) // blue
        this.frameworkModelTwelve.setProgress(50.0)
        this.frameworkModelTwelve.setSecondProgress(60.0)
        this.frameworkModelTwelve.setRadius(-10.0)

        this.frameworkModel13.setColor(0xff0000) // red
        this.frameworkModel13.setSecondColor(0x00ff00) // green
        this.frameworkModel13.setBgColor(0x0000ff) // blue
        this.frameworkModel13.setProgress(50.0)
        this.frameworkModel13.setSecondProgress(60.0)
        this.frameworkModel13.setRadius(100.0)

        this.frameworkModel14.setColor(0xff0000) // red
        this.frameworkModel14.setSecondColor(0x00ff00) // green
        this.frameworkModel14.setBgColor(0x0000ff) // blue
        this.frameworkModel14.setProgress(50.0)
        this.frameworkModel14.setSecondProgress(60.0)
        this.frameworkModel14.setStrokeWidth(5.0)

        this.frameworkModel15.setColor(0xff0000) // red
        this.frameworkModel15.setSecondColor(0x00ff00) // green
        this.frameworkModel15.setBgColor(0x0000ff) // blue
        this.frameworkModel15.setProgress(50.0)
        this.frameworkModel15.setSecondProgress(60.0)
        this.frameworkModel15.setStrokeWidth(0.0)

        this.frameworkModel16.setColor(0xff0000) // red
        this.frameworkModel16.setSecondColor(0x00ff00) // green
        this.frameworkModel16.setBgColor(0x0000ff) // blue
        this.frameworkModel16.setProgress(50.0)
        this.frameworkModel16.setSecondProgress(60.0)
        this.frameworkModel16.setStrokeWidth(-10.0)

        this.frameworkModel17.setColor(0xff0000) // red
        this.frameworkModel17.setSecondColor(0x00ff00) // green
        this.frameworkModel17.setBgColor(0x0000ff) // blue
        this.frameworkModel17.setProgress(50.0)
        this.frameworkModel17.setSecondProgress(60.0)
        this.frameworkModel17.setStrokeWidth(20.0)

        this.frameworkModel18.setColor(0xff0000) // red
        this.frameworkModel18.setSecondColor(0x00ff00) // green
        this.frameworkModel18.setBgColor(0x0000ff) // blue
        this.frameworkModel18.setProgress(50.0)
        this.frameworkModel18.setSecondProgress(60.0)
        this.frameworkModel18.setStrokeWidth(-80.0)

        this.frameworkModel19.setColor(0xff0000) // red
        this.frameworkModel19.setSecondColor(0x00ff00) // green
        this.frameworkModel19.setBgColor(0x0000ff) // blue
        this.frameworkModel19.setProgress(50.0)
        this.frameworkModel19.setSecondProgress(60.0)
        this.frameworkModel19.setShowProgressBackground(true)

        this.frameworkModel20.setColor(0xff0000) // red
        this.frameworkModel20.setSecondColor(0x00ff00) // green
        this.frameworkModel20.setBgColor(0x0000ff) // blue
        this.frameworkModel20.setProgress(50.0)
        this.frameworkModel20.setSecondProgress(60.0)
        this.frameworkModel20.setShowProgressBackground(false)

        this.frameworkModel21.setColor(0xff0000) // red
        this.frameworkModel21.setSecondColor(0x00ff00) // green
        this.frameworkModel21.setBgColor(0x0000ff) // blue
        this.frameworkModel21.setProgress(50.0)
        this.frameworkModel21.setSecondProgress(60.0)
        this.frameworkModel21.setIndeterminateAngle(true)

        this.frameworkModel22.setColor(0xff0000) // red
        this.frameworkModel22.setSecondColor(0x00ff00) // green
        this.frameworkModel22.setBgColor(0x0000ff) // blue
        this.frameworkModel22.setProgress(50.0)
        this.frameworkModel22.setSecondProgress(60.0)
        this.frameworkModel22.setIndeterminateAngle(false)

        this.frameworkModel23.setColor(0xff0000) // red
        this.frameworkModel23.setProgress(50.0)
        this.frameworkModel23.setSecondProgress(60.0)
        this.frameworkModel23.setIndeterminate(true)
        this.frameworkModel23.setIndeterminateAngle(true)

        this.frameworkModel24.setColor(0xff0000) // red
        this.frameworkModel24.setProgress(50.0)
        this.frameworkModel24.setSecondProgress(60.0)
        this.frameworkModel24.setIndeterminate(false)
        this.frameworkModel24.setIndeterminateAngle(true)

        this.frameworkModel25.setColor(0xff0000) // red
        this.frameworkModel25.setProgress(50.0)
        this.frameworkModel25.setSecondProgress(60.0)
        this.frameworkModel25.setIndeterminateAngle(true)
        this.frameworkModel25.setIndeterminate(true)
        this.frameworkModel25.setAngle(5.0)

        this.frameworkModel26.setColor(0xff0000) // red
        this.frameworkModel26.setProgress(50.0)
        this.frameworkModel26.setSecondProgress(60.0)
        this.frameworkModel26.setIndeterminateAngle(true)
        this.frameworkModel26.setIndeterminate(true)
        this.frameworkModel26.setAngle(600.0)
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
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModelThree)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModelFour)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModelFive)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModelSix)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModelSeven)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModelEight)
                    }
                }.height(100)

                Flex(FlexParams(direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween)) {
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModelNine)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModelTen)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModelEleven)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModelTwelve)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModel13)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModel14)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModel15)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModel16)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModel17)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModel18)
                    }
                }.height(100)

                Flex(FlexParams(direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween)) {
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModel19)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModel20)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModel21)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModel22)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModel23)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModel24)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModel25)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModel26)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModel27)
                    }
                    Flex() {
                        MaterialProgressBar(style: MaterialProgressStyle.MaterialCircular,
                            modelBuild: this.frameworkModel28)
                    }
                }.height(100)
            }.width(100.percent).height(100.percent).padding(10)
        }.width(100.percent).height(100.percent).backgroundColor(Color.WHITE)
    }
}
