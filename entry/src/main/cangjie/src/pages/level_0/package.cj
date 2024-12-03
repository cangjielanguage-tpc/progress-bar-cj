/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

package ohos_app_cangjie_entry.pages.level_0

internal import ohos.base.*
internal import ohos.component.*
internal import ohos.state_manage.*
internal import ohos.router.*
internal import ohos.ability.*
internal import ohos.window.*
internal import cj_res_entry.app
internal import material.*
internal import ohos.resource_manager.*
internal import ohos.ability.AbilityStage
internal import ohos.ability.LaunchReason
internal import ohos.prompt_action.*
internal import std.sync.*
internal import std.collection.*
internal import std.time.Duration
internal import std.random.*
internal import std.convert.*
internal import std.math.*
internal import std.sync.*
internal import std.time.*
internal import ohos.hilog.*
internal import ohos.prompt_action.*
internal import std.format.*
internal import ohos.concurrency.*
internal import ohos_app_cangjie_entry.*

extend<T> Option<T> {
    operator func ()(): T {
        this.getOrThrow()
    }
}
