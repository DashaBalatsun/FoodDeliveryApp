//
//  FDSearchField.swift
//  FoodDeliveryApp
//
//  Created by Дарья Балацун on 25.07.24.
//

import UIKit

class FDSearchField: UITextField {

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
        self.font = UIFont.Roboto.regular.size(of: 16)
        self.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor : AppColors.black.withAlphaComponent(0.5)])
        let imageView = UIImageView(frame: CGRect(x: 20, y: 2, width: 20, height: 20))
        imageView.image = UIImage(resource: .loupe1)
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 22))
        leftPaddingView.addSubview(imageView)
        let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: self.frame.height))
        self.leftView = leftPaddingView
        self.leftViewMode = .always
        self.rightView = rightPaddingView
        self.rightViewMode = .always
    }
}
