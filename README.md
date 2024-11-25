<div align="center">
<h1>materialProgressBar4cj</h1>
</div>

<p align="center">
<img alt="" src="https://img.shields.io/badge/release-v0.0.1-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/build-pass-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjc-v0.53.13-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjcov-NA-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/project-open-brightgreen" style="display: inline-block;" />
</p>

## 介绍 

materialProgressBar4cj 是一个自定义ProgressBar效果，包含进度轮和水平柱两种效果。它是一个用仓颉语言编写的适用于鸿蒙系统的三方库。

<p align="left">
<img src="./doc/assets/material_gif_demo.gif"  width="30%">
</p>

## 特性

- 提供material风格的进度轮进展条；
- 提供material风格的水平柱进展条；
- 提供smooth风格的进度轮进展条；
- 提供smooth风格的水平柱进展条：

### 源码目录

```shell
├─AppScope
├─doc            # API文档和使用手册存放目录                   
├─entry          # 示例代码文件夹                  
├─material # material 库源目录                  
│  └─src
│      └─main
│          ├─cangjie
│          │  └─src              # 核心实现功能代码                       
│          └─resources
├─hvigor     # 构建工具目录
├─README.md  # materialProgressBar4cj 介绍及使用说明
```
## 接口说明

主要类和函数接口说明详见 [API](doc/feature_api.md)

## 使用说明

1. 通过 module 引入
    1. 克隆下载项目
    2. 将 material 模块拷贝到应用项目下
    3. 修改自身应用 entry 下的 oh-package.json5 文件，在 dependencies 字段添加 "material": "file:../material"
      ```json
      {
         "name": "entry",
         "version": "1.0.0",
         "description": "Please describe the basic information.",
         "main": "",
         "author": "",
         "license": "",
        "dependencies": {
            "material": "file:../material"
        }
      }
      ```
    4. 修改自身应用 entry/src/main/cangjie 下的 cjpm.toml 文件，在 [dependencies] 字段下添加 material = {path = "../../../../material/src/main/cangjie", version = "1.0.0"}
       ```toml
       [dependencies]
           material = {path = "../../../../material/src/main/cangjie", version = "1.0.0"}
       ```
    5. 在项目中使用 import material.* 引用 material 项目
       ```cangjie
       import material.*
       ```
2. 把 materialProgressBar4cj 作为三方库依赖引入
    1. 目标工程把 materialProgressBar4cj 依赖库作为 git submodule 引入

    ```
    > cd $工程根目录
    > mkdir third-party
    > cd third-party
    > git submodule add "https://gitcode.com/Cangjie-TPC/materialProgressBar4cj.git"
    ```
    2. 修改自身应用 entry/src/main/cangjie 下的 cjpm.toml 文件，添加依赖
    ```toml
    [dependencies]
        material = {path = "../../../../third-party/materialProgressBar4cj/material/src/main/cangjie", version = "1.0.0"}
     ```
    3. 在项目中使用 material 组件
       ```cangjie
       import material.*
       ```

## 功能示例

详见 `entry`

#### 高亮引导组件示例

```cangjie
import material.*       //导入依赖
import ohos.router.*
import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.hilog.Hilog

@Entry
@Component
class MaterialProgressBarSample {
    var frameworkModel: MaterialModel = MaterialModel()

    protected override func aboutToAppear() {
        this.frameworkModel.setStyle(MaterialProgressStyle.MaterialHorizontal)
        this.frameworkModel.setProgress(30.0)
        this.frameworkModel.setSecondProgress(60.0)
        this.frameworkModel.setColor(0x009688)
        this.frameworkModel.setSecondColor(0x9fc6c2)
        this.frameworkModel.setBgColor(0xd7d7d7)
    }

    func build() {
        Column {
            Flex(FlexParams(direction: FlexDirection.Column)) {
                Text("Determinate Horizontal ProgressBar").fontSize(18).margin(2)
                Text("Framework Implementation").fontSize(14).fontColor(0x666666).margin(2)

                Flex(FlexParams(direction: FlexDirection.Column)) {
                    MaterialProgressBar(style: MaterialProgressStyle.MaterialHorizontal, modelBuild: this.frameworkModel
                    )
                }.height(20).width(100.percent).margin(2)
            }.width(100.percent).height(100.percent).padding(10)
        }.width(100.percent).height(100.percent).backgroundColor(Color.WHITE)
    }
}
```
<p align="left">
<img src="./doc/assets/material_demo1.png"  width="30%">
</p>

## 约束与限制
在下述版本验证通过：

    DevEco Studio NEXT Developer Beta2(5.0.3.910) 
    Cangjie Support Plugin 5.0.3.906
    Cangjie Compiler: 0.53.13 (cjnative)

由于DevEco Studio-Cangjie Plugin Beta2（5.0.3.910）UI界面
暂不具备curves差值运算能力，故smooth效果的进展条暂时只能匀速显示。
## 开源协议

本项目基于 [Apache License 2.0](./LICENSE)，请自由的享受和参与开源。

## 参与贡献

欢迎给我们提交 PR，欢迎给我们提交 Issue，欢迎参与任何形式的贡献。
