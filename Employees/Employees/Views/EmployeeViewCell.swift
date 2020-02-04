//
//  EmployeeViewCell.swift
//  Employees
//
//  Created by Eugene Berezin on 2/3/20.
//  Copyright © 2020 Eugene Berezin. All rights reserved.
//

import UIKit

class EmployeeViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .cyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
