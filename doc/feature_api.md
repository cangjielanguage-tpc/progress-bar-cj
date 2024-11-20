# materialProgressBar4cj 特性文档

## 介绍

materialProgressBar4cj 是一个自定义ProgressBar效果，包含进度轮和水平柱两种效果。它是一个用仓颉语言编写的适用于鸿蒙系统的三方库。

## 1 进度条基础信息类

### 1.1 通用信息类

```cangjie
public class MaterialModel {
    
    /*
     * 设置颜色
     * 
     * 参数 color - 进度条颜色
     * 返回值 Unit
     */
    public func setColor(color: UInt32): Unit
    
    /*
     * 设置颜色数组
     * 
     * 参数 colors - 进度条颜色数组
     * 返回值 Unit
     */
    public func setColors(colors: Array<UInt32>): Unit
    
    /*
     * 设置第二进度条颜色
     * 
     * 参数 secondColor - 第二进度条颜色
     * 返回值 Unit
     */
    public func setSecondColor(secondColor: UInt32): Unit
    
    /*
     * 设置背景颜色
     * 
     * 参数 bgColor - 背景颜色
     * 返回值 Unit
     */
    public func setBgColor(bgColor: UInt32): Unit
    
    /*
     * 设置是否显示背景颜色
     * 
     * 参数 isShow - 是否显示背景颜色
     * 返回值 Unit
     */
    public func setShowProgressBackground(isShow: Bool): Unit
    
    /*
     * 设置是否显示模糊效果
     * 
     * 参数 indeterminate - 是否显示模糊效果
     * 返回值 Unit
     */
    public func setIndeterminate(indeterminate: Bool): Unit
   
    /*
     * 设置是否显示不确定角度效果
     * 
     * 参数 indeterminateAngle - 是否显示不确定角度效果
     * 返回值 Unit
     */
    public func setIndeterminateAngle(indeterminateAngle: Bool): Unit
    
    /*
     * 设置进度条风格
     * 
     * 参数 style - 进度条风格
     * 返回值 Unit
     */
    public func setStyle(style: MaterialProgressStyle): Unit
    
    /*
     * 设置进度值
     * 
     * 参数 progress - 进度值
     * 返回值 Unit
     */
    public func setProgress(progress: Float64): Unit
    
    /*
     * 设置角度
     * 
     * 参数 angle - 角度
     * 返回值 Unit
     */
    public func setAngle(angle: Float64): Unit
    
    /*
     * 设置半径
     * 
     * 参数 radius - 半径
     * 返回值 Unit
     */
    public func setRadius(radius: Float64): Unit
    
    /*
     * 设置第二进度值
     * 
     * 参数 progressSecond - 第二进度值
     * 返回值 Unit
     */
    public func setSecondProgress(progressSecond: Float64): Unit
    
    /*
     * 设置宽度
     * 
     * 参数 strokeWidth - 宽度
     * 返回值 Unit
     */
    public func setStrokeWidth(strokeWidth: Float64): Unit
        
    /*
     * 设置曲线样式
     * 
     * 参数 curve - 曲线样式
     * 返回值 Unit
     */
    public func setCurve(curve: Curve): Unit
    
    /*
     * 设置
     * 
     * 参数 isPocket - 
     * 返回值 Unit
     */
    public func setIsPocket(isPocket: Bool): Unit
    
    /*
     * 设置是否反转
     * 
     * 参数 isReversed - 是否反转
     * 返回值 Unit
     */
    public func setIsReversed(isReversed: Bool): Unit
    
    /*
     * 设置是否镜像效果
     * 
     * 参数 isMirror - 是否镜像效果
     * 返回值 Unit
     */
    public func setIsMirror(isMirror: Bool): Unit
    
    /*
     * 设置是否渐变效果
     * 
     * 参数 isGradients - 是否渐变效果
     * 返回值 Unit
     */
    public func setIsGradients(isGradients: Bool): Unit

    /*
     * 设置速度
     * 
     * 参数 speed - 速度
     * 返回值 Unit
     */
    public func setSpeed(speed: Float64): Unit
    
    /*
     * 设置分割长度
     * 
     * 参数 separatorLength - 分割长度
     * 返回值 Unit
     */
    public func setSeparatorLength(separatorLength: Float64): Unit
    
    /*
     * 设置分割次数
     * 
     * 参数 sectionsCount - 分割次数
     * 返回值 Unit
     */
    public func setSectionsCount(sectionsCount: Int64): Unit
    
    /*
     * 设置是否停止
     * 
     * 参数 isStop - 是否停止
     * 返回值 Unit
     */
    public func setIsStop(isStop: Bool): Unit
    
}
```

### 1.2 进度轮信息类

```cangjie
public class ComMaterialModel {

    /*
     * 设置半径
     * 
     * 参数 circleRadius - 半径
     * 返回值 Unit 
     */
    public func setCircleRadius (circleRadius: Float64): Unit
    
    /*
     * 设置颜色
     * 
     * 参数 barColor - 颜色
     * 返回值 Unit 
     */
    public func setBarColor(barColor: UInt32): Unit 

    
    /*
     * 设置轮圈颜色
     * 
     * 参数 rimColor - 轮圈颜色
     * 返回值 Unit 
     */
    public func setRimColor(rimColor: UInt32): Unit
    
    /*
     * 设置轮圈宽度
     * 
     * 参数 rimWidth - 轮圈宽度
     * 返回值 Unit 
     */
    public func setRimWidth(rimWidth: Float64): Unit
    
    /*
     * 设置宽度
     * 
     * 参数 barWidth - 宽度
     * 返回值 Unit 
     */
    public func setBarWidth(barWidth: Float64): Unit
    
    /*
     * 设置是否旋转
     * 
     * 参数 isSpinning - 是否旋转
     * 返回值 Unit 
     */
    public func setSpinning(isSpinning: Bool): Unit
    
    /*
     * 设置旋转速度
     * 
     * 参数 spinSpeed - 旋转速度
     * 返回值 Unit 
     */
    public func setSpinSpeed(spinSpeed: Float64): Unit
}
```

## 2 组件类

### 2.1 进度轮组件类

```cangjie
public class ComWheel {

    /*
     * 进度条实体类
     */
    var model: ComMaterialModel = ComMaterialModel()
}
```

```cangjie
public class CircularComponent {
    /*
     * 进度轮背景颜色
     */
    var bgColor: UInt32 = 0
    
    /*
     * 进度轮颜色
     */
    var color: UInt32 = 0x007DFF
    
    /*
     * 第二进度轮颜色
     */
    var secondColor: UInt32 = 0
    
    /*
     * 进度轮宽度
     */
    var strokeWidth: Float64 = 0.0
    
    /*
     * 进度轮进度值最大值
     */
    var progressMax: Float64 = 100.0
    
    /*
     * 进度轮进度值
     */
    var progress: Float64 = 1.0
    /*
     * 第二进度轮进度值
     */
    var progressSecond: Float64 = 0.0
    
    /*
     * 角度
     */
    var angle: Float64 = 0.0
    
}
```

### 2.2 水平柱组件类

```cangjie
public class HorizontalComponent {
    /*
     * 进度轮背景颜色
     */
    var bgColor: UInt32 = 0
    
    /*
     * 进度轮颜色
     */
    var color: UInt32 = 0x007DFF
    
    /*
     * 第二进度轮颜色
     */
    var secondColor: UInt32 = 0
    
    /*
     * 水平柱宽度
     */
    var strokeWidth: Float64 = 0.0
    
    /*
     * 进度轮进度值最大值
     */
    var progressMax: Float64 = 100.0
    
    /*
     * 进度轮进度值
     */
    var progress: Float64 = 1.0
    
    /*
     * 第二进度轮进度值
     */
    var progressSecond: Float64 = 0.0
    
    /*
     * 偏移量
     */
    var mOffset: Float64 = 0.0
}
```

## 3 通用类

```cangjie
public class MaterialProgressBar {
    /*
     * 进度条效果和风格 --- MaterialCircular MaterialHorizontal SmoothCircular SmoothHorizontal
     */
    private var style: MaterialProgressStyle = MaterialProgressStyle.MaterialCircular
    
    /*
     * 进度条实体类
     */
    private var modelBuild: MaterialModel = MaterialModel()
}
```

```cangjie
public class MaterialProgressStyle {

    | MaterialCircular
    | MaterialHorizontal
    | SmoothCircular
    | SmoothHorizontal
}
```



