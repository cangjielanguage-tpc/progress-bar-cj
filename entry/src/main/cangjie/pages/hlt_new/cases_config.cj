/**
 * Created on 2025/3/18
 */
package ohos_app_cangjie_entry.pages.hlt_new

var casesHLTLevel0: Array<Array<String>> = [
    ["1", "Case01", "Case01"],
    ["2", "Case02", "Case02"],
    ["3", "Case03", "Case03"],
    ["4", "Case04", "Case04"],
    ["5", "Case05", "Case05"]
]

public func getRunCases(): Array<Array<String>> {
    return casesHLTLevel0
}

public class RefreshTypeMapParam {
    var id: Int64 = 0
    var name: String = ""
    var url: String = ""

    public init(id: Int64, name: String, url: String) {
        this.id = id
        this.name = name
        this.url = url
    }
}
