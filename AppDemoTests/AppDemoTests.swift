//
//  AppDemoTests.swift
//  AppDemoTests
//
//  Created by Nidhi Joshi on 28/06/2021.
//

import XCTest
@testable import AppDemo

class AppDemoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testValidHost() {
        let expected = expectation(description: "Check valid host")
        if Utilities.ConnectedToNetwork() {
            expected.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

}
