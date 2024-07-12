//
//  FDButton.swift
//  FoodDeliveryApp
//
//  Created by Дарья Балацун on 31.03.24.
//

import UIKit

enum FDButtonColorsSchemes {
    case white
    case orange
    case grey
}

class FDButton: UIView {
    
    private let button = UIButton()
    
    var action: (() -> Void)?
    var scheme: FDButtonColorsSchemes = .white {
        didSet {
            setColorScheme(scheme: scheme)
        }
    }
    
    init(scheme: FDButtonColorsSchemes = .white) {
        super.init(frame: .zero)
        self.backgroundColor = .clear
        self.scheme = scheme
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FDButton {
    private func setupLayout() {
        setupBottomButton()
    }
    
    private func setupBottomButton() {
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .Roboto.black.size(of: 18)
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.topAnchor.constraint(equalTo: self.topAnchor)
        ])
        
        setColorScheme(scheme: .white)
    }
    
    @objc private func buttonPressed() {
        guard let action = action else { return  }
        action()
    }
    
    private func setColorScheme(scheme: FDButtonColorsSchemes) {
        switch scheme {
        case .grey:
            button.backgroundColor = AppColors.grey
            button.setTitleColor(AppColors.black, for: .normal)
        case .orange:
            button.backgroundColor = AppColors.accentOrange
            button.setTitleColor(AppColors.white, for: .normal)
        case .white:
            button.backgroundColor = AppColors.white
            button.setTitleColor(AppColors.black, for: .normal)
        }
    }
    
    public func setTitle(_ title: String? ) {
        button.setTitle(title, for: .normal)
    }
}
