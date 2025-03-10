import XCTest
@testable import FoundationX
@testable import FoundationX_Objc

final class GHFoundationTests: XCTestCase {
    func testmMethodLock() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssert(lockFunc() != nil)
        XMethodLock(self, #selector(lockFunc))
        XLogger.log(XMethodIsLocked(self, #selector(lockFunc)))
        XCTAssert(lockFunc() == nil)
        XMethodUnlock(self, #selector(lockFunc))
        XLogger.log(XMethodIsLocked(self, #selector(lockFunc)))
    }

    @objc func lockFunc() -> Any? {
        if XMethodIsLocked(self, #selector(lockFunc)) {
            return nil
        }
        return "called"
    }

    func testLogger() throws {
        XLogger.log("Hello!", "Logger")
        let obj = NSObject()
        XLogger.log("This is a message with my custom flags and my objc:", obj, flags: ["🍎", "🍊"])
    }

    func testMirror() throws {
        let str: String? = ""
        let _str: Any = str
        XLogger.log(Mirror.isOptional(_str))
        let str_ = str!
        XLogger.log(Mirror.isOptional(str_))
    }

    func testThen() throws {
        _ = NSObject().then { objc in
            XLogger.log(objc)
        }
    }
    
    func testArraySafe() throws {
        let arr: [Int] = [0]
        XLogger.log(arr[safe: 100]) // output: nil
    }
    
    func testStringIndex() throws {
        XCTAssertEqual("hello"[1], "e")
        XCTAssertNil("world"[-1])
        XCTAssertNotNil("world"[0])
        XCTAssertEqual("world"[3].stringValue, "l")
        XCTAssertEqual("world"[3]?.stringValue, "l")
        XLogger.log("world"[1].stringValue)
    }
    
    func testTrim() throws {
        let str = "\n Hello   \n"
        let trimmed = str.trimWhitespacesAndNewlines()
        XCTAssertEqual(trimmed, "Hello")
    }
    
    func testCharacter() throws {
        let str = "Hello"
        let chr = str[2]
        XCTAssertEqual(chr, Character("l"))
    }
    
    func testCharacterConvert() throws {
        let chr: String = Character("H").stringValue
        XCTAssertEqual(chr, "H")
    }
    
    func testDeviceManager() throws {
        #if os(macOS)
        XLogger.log(DeviceManager.shared.macAddresses,
                             DeviceManager.shared.serialNumber,
                             DeviceManager.shared.appVsersion,
                             DeviceManager.shared.buildNumber,
                             DeviceManager.shared.systemVersion
        )
        XCTAssertTrue(DeviceManager.shared.macAddresses.count > 0)
        XCTAssertTrue(DeviceManager.shared.serialNumber.count > 0)
        #endif
    }
}
