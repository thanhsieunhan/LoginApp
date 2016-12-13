//
//  ListViewTest.swift
//  LoginAppTest
//
//  Created by Lê Hà Thành on 12/13/16.
//  Copyright © 2016 Lê Hà Thành. All rights reserved.
//

import XCTest

class ListViewTest: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let myTable = tester().waitForView(withAccessibilityLabel: "List Table") as! UITableView
        let index = IndexPath(row: 0, section: 0)
        tester().tapRow(at: index, in: myTable)
//        tester().
    }
    
}
