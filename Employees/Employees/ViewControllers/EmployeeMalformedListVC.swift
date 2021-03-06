//
//  EmployerMalformedListVC.swift
//  Employees
//
//  Created by Eugene Berezin on 2/8/20.
//  Copyright © 2020 Eugene Berezin. All rights reserved.
//

import UIKit
import JGProgressHUD

class EmployeeMalformedListVC: UICollectionViewController {
    
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
        EmployeeService.shared.getMalformedList {[weak self]  (result) in
            
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

extension EmployeeMalformedListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 20, height: 700)
    }
}

