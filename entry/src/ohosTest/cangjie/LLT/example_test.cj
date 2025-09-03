package ohos_app_cangjie_entry_test.LLT

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import ohos.ui_test.*
@Test
class TestExample {
    @TestCase
    func testLevel0(): Unit {
        let driver = Driver.create()
        driver.findComponent(On().id("DeterminateCircularBar")).click()
        driver.delayMs(1500)
        driver.findComponent(On().id("back")).click()
        driver.delayMs(1500)

        driver.findComponent(On().id("MaterialProgressBar")).click()
        driver.delayMs(1500)
        driver.findComponent(On().id("back")).click()
        driver.delayMs(1500)

        driver.findComponent(On().id("ModelInitBar")).click()
        driver.delayMs(1500)
        driver.findComponent(On().id("back")).click()
        driver.delayMs(1500)

        driver.findComponent(On().id("SmoothProgressBar")).click()
        driver.delayMs(1500)
        driver.findComponent(On().id("back")).click()
        driver.delayMs(1500)

        driver.findComponent(On().id("HLT_new")).click()
        driver.delayMs(1500)

        for(item in arr_HLT_new) {
            driver.findComponent(On().id("${item}")).click()
            driver.delayMs(1500)

            driver.findComponent(On().id("back")).click()
            driver.delayMs(1500)
        }
        driver.findComponent(On().id("HLT_new_back")).click()
        driver.delayMs(1500)



    }
}
