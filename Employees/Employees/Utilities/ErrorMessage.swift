//
//  ErrorMessage.swift
//  Employees
//
//  Created by Eugene Berezin on 2/6/20.
//  Copyright © 2020 Eugene Berezin. All rights reserved.
//

import Foundation

enum EmployeeError: String, Error {
    case malformedList    = "Sorry! Something went wrong. Please try again"
    case emptyList   = "Oops! No employees there. Please try again"
    case invalidResponse    = "Invalid response from the server. Please try again."
}
