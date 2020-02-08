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
    
    func testEmployeeModal() {
        let employeeCell = EmployeeViewCell()
        let employee = Employee(fullName: "Jon Doe", phoneNumber: "777777777", emailAddress: "test@email.com", biography: "biography test", photoUrlSmall: "https://photo.com", team: "Test tea,", employeeType: EmployeeType(rawValue: EmployeeType.fullTime.rawValue)!)
        
        employeeCell.fullNameLabel.text = employee.fullName
        employeeCell.phoneNumberLabel.text = employee.phoneNumber
        employeeCell.emailAddressLabel.text = employee.emailAddress
        employeeCell.teamLabel.text = employee.team
        employeeCell.biography.text = employee.biography
        
        XCTAssertEqual(employeeCell.fullNameLabel.text, employee.fullName, "Full name is incorrect")
        XCTAssertEqual( employeeCell.phoneNumberLabel.text, employee.phoneNumber, "Phone number is incorrect")
        XCTAssertEqual(employeeCell.emailAddressLabel.text, employee.emailAddress, "Email is incorrect")
        XCTAssertEqual(employeeCell.teamLabel.text, employee.team, "Team is incorrect")
        XCTAssertEqual(employeeCell.biography.text, employee.biography, "Bio is incorrect")
        
    }
    
    func testMainVC() {
        let mainVC = MainVC()
        mainVC.viewDidLoad()
        XCTAssert(mainVC.getEmployeeListButton.isEnabled)
        XCTAssert(mainVC.getMalFormedEmployeeListButton.isEnabled)
        XCTAssert(mainVC.getEmployeeListButton.isEnabled)
        XCTAssertEqual(mainVC.getMalFormedEmployeeListButton.title(for: .normal)!, "Get Malformed Employee List"  , "Title is wrong")
        XCTAssertEqual(mainVC.getEmployeeListButton.title(for: .normal)!, "Get Employee List"  , "Title is wrong")
        XCTAssertEqual(mainVC.getEmptyEmployeeListButton.title(for: .normal)!, "Get Empty Employee List"  , "Title is wrong")
        XCTAssertNotNil(mainVC.getEmptyEmployeeListButton)
        XCTAssertNotNil(mainVC.getMalFormedEmployeeListButton)
        XCTAssertNotNil(mainVC.getEmployeeListButton)
        }
    
}
