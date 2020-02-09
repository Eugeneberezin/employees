//
//  EmployeeEmptyListVC.swift
//  Employees
//
//  Created by Eugene Berezin on 2/8/20.
//  Copyright © 2020 Eugene Berezin. All rights reserved.
//

import UIKit
import JGProgressHUD

class EmployeeEmptyListVC: UICollectionViewController {
    
    let cellID = "employeeCell"
    var employees = [Employee]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Employees"
        collectionView.register(EmployeeViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.backgroundColor = .systemBackground
        getEmployees()
        
    }
    
    fileprivate func getEmployees() {
        EmployeeService.shared.getEmployeeList {[weak self]  (result) in
            
            let hud = JGProgressHUD()
            
            DispatchQueue.main.async {
                hud.textLabel.text = "Loading"
                hud.show(in: self!.collectionView)
                hud.detailTextLabel.text = "Loading a list of employees"
            }
            switch result {
            case.success(let employees):
                self?.employees = employees
                
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                    hud.dismiss()
                }
                
                if employees.isEmpty {
                    let ac = UIAlertController(title: EmployeeError.emptyList.rawValue, message: nil, preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .default))
                    
                    DispatchQueue.main.async {
                        
                        self?.present(ac,animated: true)
                    }
                    
                }
            case.failure(let error):
                
                DispatchQueue.main.async {
                    hud.dismiss()
                    let ac = UIAlertController(title: error.rawValue, message: nil, preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .default))
                    self?.present(ac,animated: true)
                    
                }
                print(error.localizedDescription)
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

extension EmployeeEmptyListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dummyCell = EmployeeViewCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
        dummyCell.fullNameLabel.text = employees[indexPath.item].fullName
        dummyCell.emailAddressLabel.text = employees[indexPath.item].emailAddress
        dummyCell.phoneNumberLabel.text = employees[indexPath.item].phoneNumber
        dummyCell.teamLabel.text = employees[indexPath.item].team
        dummyCell.employeeTypeLabel.text = employees[indexPath.item].employeeType.rawValue
        dummyCell.biography.text = employees[indexPath.item].biography
        dummyCell.layoutIfNeeded()
        let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 500))
        
        
        return .init(width: view.frame.width - 20, height: estimatedSize.height)
    }
}

