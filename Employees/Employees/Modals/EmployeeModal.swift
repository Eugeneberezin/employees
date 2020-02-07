//
//  EmployeeModal.swift
//  Employees
//
//  Created by Eugene Berezin on 2/6/20.
//  Copyright © 2020 Eugene Berezin. All rights reserved.
//

import Foundation

struct Employees: Codable {
    var employees: [Employee]?
}

struct Employee: Codable {
    
    var fullName: String
    var phoneNumber: String?
    var emailAddress: String
    var biography: String?
    var photoUrlSmall: String?
    var team: String
    var employeeType: EmployeeType
}

enum EmployeeType: String, Codable {
    case fullTime = "FULL_TIME"
    case partTime = "PART_TIME"
    case contractor = "CONTRACTOR"
}
