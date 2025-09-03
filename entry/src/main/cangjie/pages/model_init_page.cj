/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package ohos_app_cangjie_entry.pages

import ohos.state_macro_manage.*

@Entry
@Component
class ModelInitPage {
    private var model: ComMaterialModel = ComMaterialModel()

    protected override func aboutToAppear() {
        this.model.setProgress(0.75)

        this.model.init_data()
    }

    protected override func aboutToDisappear() {
        this.model.closeTimer()
    }

    func build() {
        Column() {
            Row() {
                Text("back").id("back").height(80)
                .onClick ({ evt =>
                    Router.back()
                })
                ComWheel(model: this.model)
            }
        }
    }
}
