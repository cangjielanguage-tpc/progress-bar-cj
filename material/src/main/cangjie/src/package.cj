/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

package material

internal import ohos.base.*
internal import ohos.component.*
internal import ohos.state_manage.*
import ohos.state_macro_manage.*
internal import ohos.ability.Ability
internal import ohos.ability.Want
internal import ohos.ability.LaunchParam
internal import ohos.window.WindowStage
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
internal import ohos.hilog.*
internal import ohos.concurrency.*

extend<T> Option<T> {
    operator func ()(): T {
        this.getOrThrow()
    }
}

func pxToVp(pxFloat64: Float64): Float64 {
    return px2vp(pxFloat64.px)().value
}
