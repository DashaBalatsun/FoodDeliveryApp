//
//  BottomView.swift
//  FoodDeliveryApp
//
//  Created by Дарья Балацун on 30.03.24.
//

import UIKit

class FDBottomView: UIView {

    private let label = UILabel()
    private let view1 = UIView()
    private let view2 = UIImageView()
    private let button1 = UIButton()
    private let button2 = UIButton()
    
    var button1Action: (() -> Void)?
    var button2Action: (() -> Void)?

    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FDBottomView {
    func setupLayout() {
        setupLabel()
        setupView1()
        setupView2()
        setupButton1()
        setupButton2()
    }
    
    func setupLabel() {
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Or connect with"
        label.font = .Roboto.regular.size(of: 14)
        label.textColor = AppColors.bottomViewGray
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
        ])
    }
    
    func setupView1() {
        self.addSubview(view1)
        view1.backgroundColor = AppColors.bottomViewGray.withAlphaComponent(0.3)
        view1.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view1.centerYAnchor.constraint(equalTo: label.centerYAnchor) ,
            view1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view1.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -12),
            view1.heightAnchor.constraint(equalToConstant: 3)
        ])
    }
    
    func setupView2() {
        self.addSubview(view2)
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.image = UIImage(named: "BottomView")
        view2.contentMode = .scaleAspectFit
        view2.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            view2.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 18) ,
            view2.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view2.heightAnchor.constraint(equalToConstant: 150),
            view2.widthAnchor.constraint(equalToConstant: 282)
        ])
    }
    
    func setupButton1() {
        self.addSubview(button1)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setImage(UIImage(named: "GooglePlus"), for: .normal)
        button1.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20) ,
            button1.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        ])
    }
    
    func setupButton2() {
        self.addSubview(button2)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.setImage(UIImage(named: "Facebook"), for: .normal)
        button2.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button2.centerYAnchor.constraint(equalTo: button1.centerYAnchor) ,
            button2.trailingAnchor.constraint(equalTo: button1.leadingAnchor, constant: -20)
        ])
    }
}

private extension FDBottomView {
    @objc func button1Tapped() {
        button1Action?()
    }
    
    @objc func button2Tapped() {
        button2Action?()
    }
}
