//
//  ViewController.swift
//  Employees
//
//  Created by Eugene Berezin on 2/3/20.
//  Copyright © 2020 Eugene Berezin. All rights reserved.
//

import UIKit

class EmployerListVC: UICollectionViewController {
    
    let cellID = "employeeCell"
    var employees = [Employee]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Employees"
        collectionView.register(EmployeeViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.backgroundColor = .systemBackground
        EmployeeService.shared.getEmployeeList {[weak self]  (result) in
            switch result {
            case.success(let employees):
                self?.employees = employees
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            case.failure(let error):
                print(error)
            }
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return employees.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! EmployeeViewCell
        cell.layer.cornerRadius = 12
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        let employee = employees[indexPath.item]
        cell.employee = employee
    
        return cell
        
    }
    
    init() {
              super.init(collectionViewLayout: UICollectionViewFlowLayout())
          }
          
          required init?(coder aDecoder: NSCoder) {
              fatalError("init(coder:) has not been implemented")
          }
          


}

extension EmployerListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 20, height: 700)
    }
}

