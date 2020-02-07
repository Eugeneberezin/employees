//
//  EmployeesTests.swift
//  EmployeesTests
//
//  Created by Eugene Berezin on 2/3/20.
//  Copyright © 2020 Eugene Berezin. All rights reserved.
//

import XCTest
@testable import Employees

class EmployeesTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStringsForUILabelsAndTextView() {
        let employeeCell = EmployeeViewCell()
        employeeCell.fullNameLabel.text = "Test name"
        employeeCell.phoneNumberLabel.text = "7777777777"
        employeeCell.emailAddressLabel.text = "email@test.org"
        employeeCell.employeeTypeLabel.text = EmployeeType.fullTime.rawValue
        employeeCell.biography.text = "This is bio"
        XCTAssertEqual(employeeCell.fullNameLabel.text, "Test name")
        XCTAssertEqual(employeeCell.phoneNumberLabel.text, "7777777777")
        XCTAssertEqual(employeeCell.emailAddressLabel.text, "email@test.org")
        XCTAssertEqual(employeeCell.employeeTypeLabel.text, "FULL_TIME")
        XCTAssertEqual(employeeCell.biography.text, "This is bio")
        
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
