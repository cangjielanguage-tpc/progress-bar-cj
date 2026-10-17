/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package ohos_app_cangjie_entry.pages.level_0

import ohos.state_macro_manage.*

@Entry
@Component
class L0_test_material_03 {
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
                ComWheel(model: this.model)
            }
        }
    }
}
