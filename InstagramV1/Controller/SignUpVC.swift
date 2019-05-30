//
//  SignUpVC.swift
//  InstagramV1
//
//  Created by Hitesh Nalamwar on 2019-05-31.
//  Copyright © 2019 Hitesh Nalamwar. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    let plusPhotoBtn: UIButton = {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named:"plus_photo")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let fullNameTextField : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter your Name"
        tf.backgroundColor = UIColor (white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    let userNameTextField : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter your username"
        tf.backgroundColor = UIColor (white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    let emailTextField : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter your Email"
        tf.backgroundColor = UIColor (white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    let passwordTextField : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter your password"
        tf.backgroundColor = UIColor (white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    let signUpButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SignUp", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 149/255, green: 204/255, blue: 244/255, alpha: 1)
        button.layer.cornerRadius = 5
        return button
    }()
    
    let alreadyLoginButton : UIButton = {
        
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: "Already have an Account?  ",attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor:UIColor.lightGray])
        
        attributedTitle.append(NSAttributedString(string: "Login", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor(red: 17/255, green: 154/255, blue: 237/255, alpha: 1)]))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(plusPhotoBtn)
        plusPhotoBtn.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 40, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 140, height: 140)
        
        plusPhotoBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        configureViewComponents()
        
        view.addSubview(alreadyLoginButton)
        
        alreadyLoginButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingBottom: 40, paddingLeft: 0, paddingRight: 0, width: 0, height: 50)
        // Do any additional setup after loading the view.
    }
    
    @objc func handleShowLogin() {
        
        let loginVC = LoginVC()
        navigationController?.pushViewController(loginVC, animated: true)
        
    }
    
    func configureViewComponents() {
        
        let stackview = UIStackView(arrangedSubviews: [fullNameTextField, userNameTextField, emailTextField, passwordTextField, signUpButton])
        stackview.axis = .vertical
        stackview.spacing = 10
        stackview.distribution = .fillEqually
        
        view.addSubview(stackview)
        stackview.anchor(top: plusPhotoBtn.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 40, paddingBottom: 0, paddingLeft: 40, paddingRight: 40, width: 0, height: 300)
        
    }


}
