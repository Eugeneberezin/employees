//
//  MainVC.swift
//  Employees
//
//  Created by Eugene Berezin on 2/8/20.
//  Copyright © 2020 Eugene Berezin. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    let getEmployeeListButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.widthAnchor.constraint(equalToConstant: 250).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        button.layer.cornerRadius = 20
        button.setTitle("Get Employee List", for: .normal)
        button.addTarget(self, action: #selector(navigateToEmployeeList), for: .touchUpInside)
        return button
    }()
    
    let getEmptyEmployeeListButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        button.layer.cornerRadius = 20
        button.setTitle("Get Empty Employee List", for: .normal)
        button.addTarget(self, action: #selector(navigateToEmptyEmployeeList), for: .touchUpInside)
        return button
    }()
    
    let getMalFormedEmployeeListButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        button.layer.cornerRadius = 20
        button.setTitle("Get Malformed Employee List", for: .normal)
        button.addTarget(self, action: #selector(navigateToMalformedEmployeeList), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    fileprivate func configureUI() {
        title = "Get EmplyeeList"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .tertiarySystemBackground
        let stackView = UIStackView(arrangedSubviews: [getEmployeeListButton, getEmptyEmployeeListButton, getMalFormedEmployeeListButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        view.addSubview(stackView)
        
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 100, left: 30, bottom: 0, right: 30))
    }
    
    @objc private func navigateToEmployeeList() {
        let employeeList = EmployerListVC()
        navigationController?.pushViewController(employeeList, animated: true)
    }
    
    @objc private func navigateToEmptyEmployeeList() {
        let employeeList = EmployeeEmptyListVC()
        navigationController?.pushViewController(employeeList, animated: true)
    }
    
    @objc private func navigateToMalformedEmployeeList() {
        let employeeList = EmployeeMalformedListVC()
        navigationController?.pushViewController(employeeList, animated: true)
    }
    
    
    
}
