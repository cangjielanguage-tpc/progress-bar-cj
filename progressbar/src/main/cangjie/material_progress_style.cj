/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package progressBar

public enum MaterialProgressStyle {
    | MaterialCircular
    | MaterialHorizontal
    | SmoothCircular
    | SmoothHorizontal

    public operator func ==(b: MaterialProgressStyle): Bool {
        match ((this, b)) {
            case (MaterialCircular, MaterialCircular) => true
            case (MaterialHorizontal, MaterialHorizontal) => true
            case (SmoothCircular, SmoothCircular) => true
            case (SmoothHorizontal, SmoothHorizontal) => true
            case _ => false
        }
    }

    public operator func !=(b: MaterialProgressStyle): Bool {
        return !(this == b)
    }
}
