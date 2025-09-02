package ohos_app_cangjie_entry_test.LLT

import std.unittest.TestClass
import std.unittest.TestPackage
import std.unittest.TestSuite
import std.unittest.UnitTestCase
import std.unittest.common.Configuration
import std.unittest.testmacro.Test
import std.unittest.testmacro.TestCase
import progressBar.*
import ohos.ui_test.Driver
import ohos.ui_test.On

@Test
class TestExample00 {
    @TestCase
    func test00(): Unit {
        let driver = Driver.create()
        try {
            let componentButton1 = driver.findComponent(On().id("DeterminateCircularBar"))
            componentButton1.click()
            driver.delayMs(1000)
            let componentButton2 = driver.findComponent(On().id("MaterialProgressBar"))
            componentButton2.click()
            driver.delayMs(1000)
            let componentButton3 = driver.findComponent(On().id("ModelInitBar"))
            componentButton3.click()
            driver.delayMs(1000)
            let componentButton4 = driver.findComponent(On().id("SmoothProgressBar"))
            componentButton4.click()
            driver.delayMs(1000)

        }catch (e: Exception) {

        }
    }
}
