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

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(EmployeeViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.backgroundColor = .systemBackground
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! EmployeeViewCell
        
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
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
        return .init(width: view.frame.width - 20, height: 250)
    }
}

