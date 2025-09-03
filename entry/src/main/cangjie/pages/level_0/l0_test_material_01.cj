/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package ohos_app_cangjie_entry.pages.level_0

import ohos.state_macro_manage.*

@Entry
@Component
class L0_test_material_01 {
    @Provide
    var progress: Float64 = 0.0
    @State
    var progressSecond: Float64 = 10.0
    @State
    var angle: Float64 = 0.0
    @State
    var times: Int64 = 0

    protected override func aboutToAppear() {
        let timer = Timer.repeat(
            Duration.Zero,
            Duration.millisecond * 30,
            {
                => launch {
                    this.times++
                    this.progress = this.progress + 1.0
                    this.angle += 4.0
                    if (this.angle > 360.0) {
                        this.angle = 360.0
                    }

                    if (this.progress < 30.0) {
                        this.progressSecond += 1.3
                    } else {
                        this.progressSecond += 1.0
                    }
                    if (this.progress > 100.0) {
                        this.progress = 100.0
                    }
                    if (this.times > 150) {
                        this.times = 0
                        this.progress = 0.0
                        this.progressSecond = 0.0
                        this.angle = 0.0
                    }
                }
            }
        )
    }

    func build() {
        Column {
            Flex(FlexParams(direction: FlexDirection.Column)) {
                            Text("back").id("back").height(80)
                                .onClick ({ evt =>
                                    Router.back()
                                })
                Text("Normal Style").fontSize(18).margin(top: 5, bottom: 5)
                Flex(
                    FlexParams(direction: FlexDirection.Row, alignItems: ItemAlign.Center,
                    justifyContent: FlexAlign.SpaceAround)) {
                    CircularComponent(
                        color: 0x009688,
                        strokeWidth: 4.0,
                        radius: 20.0,
                        progressSecond: 0.0,
                        angle: 0.0
                    )
                    CircularComponent(
                        color: 0x009688,
                        secondColor: 0x9fc6c2,
                        strokeWidth: 4.0,
                        progressSecond: this.progressSecond,
                        radius: 20.0,
                        angle: 0.0
                    )
                    CircularComponent(
                        color: 0x009688,
                        secondColor: 0x9fc6c2,
                        strokeWidth: 4.0,
                        progressSecond: this.progressSecond,
                        radius: 20.0,
                        bgColor: 0xd7d7d7,
                        angle: 0.0
                    )
                }.height(48).width(100.percent).padding(top: 10)
                Text("Normal Style (Tinted)").fontSize(18).margin(top: 5, bottom: 5)
                Flex(
                    FlexParams(direction: FlexDirection.Row, alignItems: ItemAlign.Center,
                    justifyContent: FlexAlign.SpaceAround)) {
                    CircularComponent(
                        color: 0xf44336,
                        strokeWidth: 4.0,
                        radius: 20.0,
                        progressSecond: 0.0,
                        angle: 0.0
                    )
                    CircularComponent(
                        color: 0xf44336,
                        secondColor: 0x42f44336,
                        strokeWidth: 4.0,
                        progressSecond: this.progressSecond,
                        radius: 20.0,
                        angle: 0.0
                    )
                    CircularComponent(
                        color: 0xf44336,
                        secondColor: 0x42f44336,
                        strokeWidth: 4.0,
                        progressSecond: this.progressSecond,
                        radius: 20.0,
                        bgColor: 0x42F44336,
                        angle: 0.0
                    )
                }.height(48).width(100.percent).padding(top: 10)
                Text("Dynamic Style").fontSize(18).margin(top: 5, bottom: 5)
                Flex(
                    FlexParams(direction: FlexDirection.Row, alignItems: ItemAlign.Center,
                    justifyContent: FlexAlign.SpaceAround)) {
                    CircularComponent(
                        color: 0x009688,
                        strokeWidth: 4.0,
                        radius: 20.0,
                        angle: this.angle,
                        progressSecond: 0.0,
                    )
                    CircularComponent(
                        color: 0x009688,
                        secondColor: 0x9fc6c2,
                        strokeWidth: 4.0,
                        progressSecond: this.progressSecond,
                        radius: 20.0,
                        angle: this.angle,
                    )
                    CircularComponent(
                        color: 0x009688,
                        secondColor: 0x9fc6c2,
                        strokeWidth: 4.0,
                        progressSecond: this.progressSecond,
                        radius: 20.0,
                        bgColor: 0xd7d7d7,
                        angle: this.angle,
                    )
                }.height(48).width(100.percent).padding(top: 10)
                Text("Dynamic Style (Tinted)").fontSize(18).margin(top: 5, bottom: 5)
                Flex(
                    FlexParams(direction: FlexDirection.Row, alignItems: ItemAlign.Center,
                    justifyContent: FlexAlign.SpaceAround)) {
                    CircularComponent(
                        color: 0xf44336,
                        strokeWidth: 4.0,
                        radius: 20.0,
                        angle: this.angle,
                        progressSecond: 0.0,
                    )
                    CircularComponent(
                        color: 0xf44336,
                        secondColor: 0x42f44336,
                        strokeWidth: 4.0,
                        progressSecond: this.progressSecond,
                        radius: 20.0,
                        angle: this.angle,
                    )
                    CircularComponent(
                        color: 0xf44336,
                        secondColor: 0x42f44336,
                        strokeWidth: 4.0,
                        progressSecond: this.progressSecond,
                        radius: 20.0,
                        bgColor: 0x42F44336,
                        angle: this.angle,
                    )
                }.height(48).width(100.percent).padding(top: 10)
            }.width(100.percent).height(100.percent).padding(10)
        }.width(100.percent).height(100.percent).backgroundColor(Color.WHITE)
    }
}
