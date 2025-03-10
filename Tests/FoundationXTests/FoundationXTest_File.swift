//
//  FoundationXTest_File.swift
//  FoundationX 
// 
//  Created by 梁光辉 on 2023/3/26.
//  Copyright © 2023 Guanghui Liang. All rights reserved.
//

import XCTest
@testable import FoundationX

final class FoundationXTest_File: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testNSURLFile() throws {
        let url = NSURL(fileURLWithPath: #file)
        XLogger.log("current test file size:", url.x_fileSize())
    }

    func testApplicationSize() throws {
        let size = FileManager.default.applicationSize()
        XLogger.log(size)
    }
}
