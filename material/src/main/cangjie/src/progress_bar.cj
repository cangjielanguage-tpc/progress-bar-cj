/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package material

public interface ProgressBar {
    func setProgress(progress: Float64): ProgressBar

    func getProgress(): Float64

    func setMaxProgress(maxProgress: Float64): ProgressBar

    func getMaxProgress(): Float64
}
