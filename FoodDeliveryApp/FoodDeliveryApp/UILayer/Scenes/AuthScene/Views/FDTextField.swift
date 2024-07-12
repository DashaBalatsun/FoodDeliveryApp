//
//  FDTextField.swift
//  FoodDeliveryApp
//
//  Created by Дарья Балацун on 31.03.24.
//

import UIKit

class FDTextField: UITextField {

    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        self.layer.cornerRadius = 24
        self.backgroundColor = AppColors.grey
        self.font = UIFont.Roboto.regular.size(of: 14)
        self.placeholder = "Text to input"
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }

}
