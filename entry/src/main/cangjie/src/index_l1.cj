/**
 * Created on 2024/8/8
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.router.*

@Entry
@Component
class Index_L1 {
    let arr_L0 = Array<String>([
            "L1_test_material_01",
            "L1_test_material_02",
            "L1_test_material_03",
            "L1_test_material_04"
        ])


    func build() {
            Scroll(Scroller()){
                Column {
                    Text("-- material-L1-用例 --").height(80)
                    Divider().color(0x000000).strokeWidth(1).margin(top: 10, bottom: 10)

                    ForEach(arr_L0, itemGeneratorFunc: {item: String, _: Int64 =>
                          Button(item).height(40).margin(top: 5, bottom: 5).fontSize(16)
                            .shape(ShapeType.Capsule).width(95.percent)
                            .stateEffect(true).id(item)
                          .onClick {
                            Router.push(url: item)
                        }
                    })

            }.width(100.percent)
        }
    }

}