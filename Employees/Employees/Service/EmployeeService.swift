//
//  EmployeeServer.swift
//  Employees
//
//  Created by Eugene Berezin on 2/7/20.
//  Copyright © 2020 Eugene Berezin. All rights reserved.
//

import Foundation

class EmployeeService {
    static let shared = EmployeeService()
    let url = "https://s3.amazonaws.com/sq-mobile-interview/employees.json"
    let malformedListURL = "https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json"
    let emptyListURL = "https://s3.amazonaws.com/sq-mobile-interview/employees_empty.json"
    
    func getEmployeeList(completed: @escaping (Result<[Employee], EmployeeError>) -> Void) {
        
        let endpoint = url
        guard let url  = URL(string: endpoint) else {
            completed(.failure(.invalidResponse))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completed(.failure(.invalidResponse))
                print(error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                print(error?.localizedDescription)
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidResponse))
                print(error?.localizedDescription)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let employees = try decoder.decode(Employees.self, from: data)
                completed(.success(employees.employees ?? []))
                print(employees)
            } catch {
                completed(.failure(.malformedList))
                print(error.localizedDescription)
            }
            
        }
        task.resume()
        
    }
    
    func getEmptyList(completed: @escaping (Result<[Employee], EmployeeError>) -> Void) {
        let endpoint = emptyListURL
        guard let url  = URL(string: endpoint) else {
            completed(.failure(.invalidResponse))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completed(.failure(.invalidResponse))
                print(error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                print(error?.localizedDescription)
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidResponse))
                print(error?.localizedDescription)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let employees = try decoder.decode(Employees.self, from: data)
                completed(.success(employees.employees ?? []))
                print(employees)
            } catch {
                completed(.failure(.malformedList))
                print(error.localizedDescription)
            }
            
        }
        task.resume()
        
    }
    
    func getMalformedList(completed: @escaping (Result<[Employee], EmployeeError>) -> Void) {
        
        let endpoint = malformedListURL
        guard let url  = URL(string: endpoint) else {
            completed(.failure(.invalidResponse))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completed(.failure(.invalidResponse))
                print(error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.malformedList))
                print(error?.localizedDescription)
                return
            }
            
            guard let data = data else {
                completed(.failure(.malformedList))
                print(error?.localizedDescription)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let employees = try decoder.decode(Employees.self, from: data)
                completed(.success(employees.employees ?? []))
                print(employees)
            } catch {
                completed(.failure(.malformedList))
                print(error.localizedDescription)
            }
            
        }
        task.resume()
        
    }

}
