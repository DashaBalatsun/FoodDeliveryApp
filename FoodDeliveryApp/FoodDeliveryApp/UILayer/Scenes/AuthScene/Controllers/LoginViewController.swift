//
//  LoginViewController.swift
//  FoodDeliveryApp
//
//  Created by Дарья Балацун on 30.03.24.
//

import UIKit

enum LoginViewState {
    case initial
    case signIn
    case signUp
}

protocol LoginViewInput: AnyObject {
    func startLoader()
    func stopLoader()
}

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    private var state: LoginViewState = .initial
    var viewOutput: LoginViewOutput?
    private var isKeyboardShown = false
    private var bottomCtValue = 0.0
    
    // MARK: - Views
    private lazy var bottomView = FDBottomView()
    private lazy var titleLabel = UILabel()
    private lazy var signInUserName = FDTextField()
    private lazy var signInPassword = FDTextField()
    private lazy var signUpUserName = FDTextField()
    private lazy var signUpPassword = FDTextField()
    private lazy var signUpReEnterPass = FDTextField()
    private lazy var forgotLabel = UILabel()
    private lazy var logoImage = UIImageView()
    private lazy var signInButton = FDButton()
    private lazy var signUpButton = FDButton()
    private lazy var verticalStack = UIStackView()
    private lazy var loader = UIActivityIndicatorView(style: .large)
    private lazy var loaderContainer = UIView()
    
    // MARK: - Constraints
    private var stackViewBottomCT = NSLayoutConstraint()
    
    // MARK: - Initializers
    init(viewOutput: LoginViewOutput, state: LoginViewState) {
        self.viewOutput = viewOutput
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecircle 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        startKeyboardListener()
    }
    
    deinit {
        stopKeyboardListener()
    }
    
    func facebookPresed() {
        print("facebookPresed")
    }
    
    func googlePlusPresed() {
        print("googlePlusPresed")
    }
}

// MARK: - Layout
extension LoginViewController {
    func setupLayout() {
        switch state {
        case .initial:
            setupBottomView()
            setupLogoImage()
            setupSignInButton()
            setupSignUpButton()
        case .signIn:
            setupBottomView()
            setupStackView()
            setupSignInPassword()
            setupSignInUserName()
            setupTitleLabel()
            setupSignInButton()
            setupForgotLabel()
            setupNavigationBar()
        case .signUp:
            setupBottomView()
            setupStackView()
            setupSignUpPassword()
            setupSignUpUserName()
            setupSignUpReEnterPass()
            setupTitleLabel()
            setupSignInButton()
            setupForgotLabel()
            setupNavigationBar()
        }
        setupLoaderContainer()
        setupLoader()
    }
    
    func setupNavigationBar() {
        let backImage = UIImage(resource: .back)
        let backButtonItem = UIBarButtonItem(image: backImage,
                                             style: .plain,
                                             target: navigationController,
                                             action: #selector(navigationController?.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backButtonItem
        navigationItem.leftBarButtonItem?.tintColor = AppColors.black
    }
    
    func setupStackView() {
        view.addSubview(verticalStack)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.axis = .vertical
        verticalStack.spacing = 20
        
        switch state {
        case .initial:
            return
        case .signIn:
            verticalStack.addArrangedSubview(signInUserName)
            verticalStack.addArrangedSubview(signInPassword)
            bottomCtValue = -262
            stackViewBottomCT = verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: bottomCtValue)
            
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stackViewBottomCT
            ])
        case .signUp:
            verticalStack.addArrangedSubview(signUpUserName)
            verticalStack.addArrangedSubview(signUpPassword)
            verticalStack.addArrangedSubview(signUpReEnterPass)
            bottomCtValue = -227
            stackViewBottomCT =  verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: bottomCtValue)
            
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stackViewBottomCT
            ])
        }
    }
    
    func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.button2Action = { [weak self] in
            self?.facebookPresed()
        }
        bottomView.button1Action = { [weak self] in
            self?.googlePlusPresed()
        }
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func setupLogoImage() {
        view.addSubview(logoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(resource: .logo)
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 109),
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 57),
            logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -57),
            logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor)
        ])
    }
    
    func setupSignInButton() {
        view.addSubview(signInButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign In")
        signInButton.scheme = .orange
        signInButton.action = { [weak self] in
            self?.onSighInTapped()
        }
        
        switch state {
        case .initial:
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 60),
                signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        case .signIn:
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 30),
                signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        case .signUp:
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 30),
                signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    }
    
    func setupSignUpButton() {
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign Up")
        signUpButton.scheme = .grey
        signUpButton.action = { [weak self] in
            self?.onSignUpTapped()
        }
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .Roboto.bold.size(of: 24)
        
        switch state {
        case .signIn:
            titleLabel.text = "Sign in"
            NSLayoutConstraint.activate([
                titleLabel.bottomAnchor.constraint(equalTo: verticalStack.topAnchor, constant: -38),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                titleLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
        case .signUp:
            titleLabel.text = "Sign un"
            NSLayoutConstraint.activate([
                titleLabel.bottomAnchor.constraint(equalTo: verticalStack.topAnchor, constant: -38),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                titleLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
        case .initial:
            return
        }
    }
    
    func setupSignInUserName() {
        signInUserName.translatesAutoresizingMaskIntoConstraints = false
        signInUserName.placeholder = "Username"
        
        NSLayoutConstraint.activate([
            signInUserName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signInUserName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signInUserName.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupSignInPassword() {
        signInPassword.translatesAutoresizingMaskIntoConstraints = false
        signInPassword.placeholder = "Password"
        
        NSLayoutConstraint.activate([
            signInPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signInPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signInPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupSignUpUserName() {
        signUpUserName.translatesAutoresizingMaskIntoConstraints = false
        signUpUserName.placeholder = "Enter Username"
        
        NSLayoutConstraint.activate([
            signUpUserName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpUserName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signUpUserName.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupSignUpPassword() {
        signUpPassword.translatesAutoresizingMaskIntoConstraints = false
        signUpPassword.placeholder = "Enter Password"
        
        NSLayoutConstraint.activate([
            signUpPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signUpPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupSignUpReEnterPass() {
        signUpReEnterPass.translatesAutoresizingMaskIntoConstraints = false
        signUpReEnterPass.placeholder = "Re-enter Password"
        
        NSLayoutConstraint.activate([
            signUpReEnterPass.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpReEnterPass.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signUpReEnterPass.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupForgotLabel() {
        view.addSubview(forgotLabel)
        forgotLabel.translatesAutoresizingMaskIntoConstraints = false
        forgotLabel.text = "Forgot Password?"
        forgotLabel.font = .Roboto.regular.size(of: 14)
        forgotLabel.textColor = AppColors.bottomViewGray
        
        NSLayoutConstraint.activate([
            forgotLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor,constant: 20),
            forgotLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func setupLoaderContainer() {
        view.addSubview(loaderContainer)
        loaderContainer.translatesAutoresizingMaskIntoConstraints = false
        loaderContainer.backgroundColor = AppColors.black.withAlphaComponent(0.3)
        loaderContainer.isHidden = true
        
        NSLayoutConstraint.activate([
            loaderContainer.widthAnchor.constraint(equalTo: view.widthAnchor),
            loaderContainer.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    func setupLoader() {
        loaderContainer.addSubview(loader)
        loader.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: loaderContainer.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: loaderContainer.centerYAnchor)
        ])
    }
}

// MARK: - LoginViewInput delegate
extension LoginViewController: LoginViewInput {
    func startLoader() {
        loaderContainer.isHidden = false
        loader.startAnimating()
    }
    
    func stopLoader() {
        loaderContainer.isHidden = true
        loader.stopAnimating()
    }
}
// MARK: - Privates methods
private extension LoginViewController {
    func onBackPressed() {
        
    }
    
    func onSighInTapped() {
        switch state {
        case .initial:
            viewOutput?.goToSignIn()
        case .signIn:
            viewOutput?.loginStart(login: signInUserName.text ?? "", password: signInPassword.text ?? "")
        case .signUp:
            return
        }
    }
    
    func onSignUpTapped() {
        switch state {
        case .initial:
            viewOutput?.goToSignUp()
        case .signIn:
          return
        case .signUp:
            return
        }
    }
    
    func onFacebookTapped() {
        
    }
    
    func onGoogleTapped() {
        
    }
    
    func onForgotTapped() {
        
    }
}

// MARK: - Keyboard listener
private extension LoginViewController {
    func setupObservers() {
        startKeyboardListener()
    }
    
    func startKeyboardListener() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    func stopKeyboardListener() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        if !isKeyboardShown {
            UIView.animate(withDuration: 0.3) {
                self.stackViewBottomCT.constant -= keyboardHeight/4
                self.view.layoutIfNeeded()
                self.isKeyboardShown = true
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        if isKeyboardShown {
            UIView.animate(withDuration: 0.3) {
                self.stackViewBottomCT.constant = self.bottomCtValue
                self.view.layoutIfNeeded()
                self.isKeyboardShown = false
            }
        }
    }
}

