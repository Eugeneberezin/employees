//
//  EmployeeViewCell.swift
//  Employees
//
//  Created by Eugene Berezin on 2/3/20.
//  Copyright © 2020 Eugene Berezin. All rights reserved.
//

import UIKit

class EmployeeViewCell: UICollectionViewCell {
    
    let photoView = UIImageView(image: UIImage(named: "small"))
    let fullNameLabel = UILabel(text: "Full name: Justine Mason", font: UIFont.preferredFont(forTextStyle: .body), textColor: .label)
    let phoneNumberLabel = UILabel(text: "Phone number: 5553280123", font: UIFont.preferredFont(forTextStyle: .body), textColor: .label)
    let emailAddressLabel = UILabel(text: "email: jmason.demo@squareup.com", font: UIFont.preferredFont(forTextStyle: .body), textColor: .label)
    let teamLabel = UILabel(text: "Team: Point of Sale", font: UIFont.preferredFont(forTextStyle: .body), textColor: .label)
    let employeeTypeLabel = UILabel(text: "Employment type: FULL_TIME", font: UIFont.preferredFont(forTextStyle: .body), textColor: .label)
    let biography = UITextView(text: "Bio: Engineer on the Point of Sale team.", font: UIFont.preferredFont(forTextStyle: .body), textColor: .label, textAlignment: .left, isEditable: false)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "cellBackgorund")
        configureUI()
        
    }
    let topPadding: CGFloat = 10
    let leftingPadding: CGFloat = 60
    let rightPadding: CGFloat = 60
    
    fileprivate func scaleText() {
        fullNameLabel.adjustsFontForContentSizeCategory = true
        fullNameLabel.numberOfLines = 0
        phoneNumberLabel.adjustsFontForContentSizeCategory = true
        phoneNumberLabel.numberOfLines = 0
        emailAddressLabel.adjustsFontForContentSizeCategory = true
        emailAddressLabel.numberOfLines = 0
        teamLabel.adjustsFontForContentSizeCategory = true
        teamLabel.numberOfLines = 0
        employeeTypeLabel.adjustsFontForContentSizeCategory = true
        employeeTypeLabel.numberOfLines = 0
        biography.adjustsFontForContentSizeCategory = true
    }
    
    private func configureUI() {
        addSubview(photoView)
        photoView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: topPadding, left: leftingPadding, bottom: topPadding, right: rightPadding))
        let stackView = UIStackView(arrangedSubviews: [fullNameLabel, phoneNumberLabel, emailAddressLabel, teamLabel, employeeTypeLabel, biography])
        scaleText()
        biography.backgroundColor = UIColor(named: "cellBackgorund")
        stackView.axis = .vertical
        stackView.spacing = 10
        addSubview(stackView)
        stackView.anchor(top: photoView.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 10, left: 20, bottom: 10, right: 20))
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
