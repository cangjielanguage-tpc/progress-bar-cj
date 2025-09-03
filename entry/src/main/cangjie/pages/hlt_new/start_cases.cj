/**
 * Created on 2025/3/18
 */
package ohos_app_cangjie_entry.pages.hlt_new

import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.prompt_action.PromptAction
import ohos.router.Router
import std.math.floor
import std.convert.Parsable

@Entry
@Component
class InitTest {
    let scroller = Scroller()
    private var cases:Array<Array<String>>=getRunCases()
    func build() {
         Column {
           Text("-- InitTest back --").id("HLT_new_back").height(80)
                .onClick ({ evt =>
                    Router.back()
                })
            Text("测试主页面")
                // 宽度
                .width(100.percent)
                // 文本颜色
                .fontColor(0x000000)
                // 背景颜色
                .backgroundColor(0xFFFFFF)
                // 字体大小
                .fontSize(25)
                //设置文字居中
                .textAlign(TextAlign.Center)
            Divider()
                // 分割线颜色
                .color(0x000000)
                // 分割线高度
                .strokeWidth(1)
                // 内边距属性
                .margin(top: 10, bottom: 10)
            Scroll() {
                Column(20) {
                    ForEach(
                        this.cases,
                        itemGeneratorFunc: {
                            item: Array<String>, idx: Int64 =>
                                Button("${idx}_${item[1]}")
                                 .height(50)
                                 .fontColor(Color.BLACK)
                                 .width(100.percent).id(item[1])
                                 .onClick{Router.push(url: item[2])}
                        }
                    )
                }
                .width(100.percent)
            }
            .scrollable(ScrollDirection.Vertical)
        }
    }
}