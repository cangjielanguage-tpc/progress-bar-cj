/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

package ohos_app_cangjie_entry

internal import ohos.base.LengthProp
internal import ohos.component.Column
internal import ohos.component.Row
internal import ohos.component.Button
internal import ohos.component.Text
internal import ohos.component.CustomView
internal import ohos.component.CJEntry
internal import ohos.component.loadNativeView
internal import ohos.state_manage.SubscriberManager
internal import ohos.state_manage.ObservedProperty
internal import ohos.state_manage.LocalStorage
import ohos.state_macro_manage.Entry
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State
import ohos.state_macro_manage.r
internal import ohos.router.*
import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*

@Entry
@Component
class MyView {
    @State
    var message: String = "Hello Cangjie"
    func build() {
        Row {
            Column {
                Button("HLT_L0").width(100.percent).height(50).fontSize(18).margin(top: 10).onClick({evt =>Router.push(url:"Index_L0")})
                Button("HLT_L1").width(100.percent).height(50).fontSize(18).margin(top: 10).onClick({evt =>Router.push(url:"Index_L1")})

                Button("DeterminateCircularSample").fontSize(14).onClick {
                    => Router.push(url: "DeterminateCircularSample")
                }
                Button("MaterialProgressBarSample").fontSize(14).onClick {
                    => Router.push(url: "MaterialProgressBarSample")
                }
                Button("ModelInitPage").fontSize(14).onClick {
                    => Router.push(url: "ModelInitPage")
                }
                Button("SmoothProgressBarSample").fontSize(14).onClick {
                    => Router.push(url: "SmoothProgressBarSample")
                }
            }.width(100.percent)
        }.height(100.percent)
    }
}
