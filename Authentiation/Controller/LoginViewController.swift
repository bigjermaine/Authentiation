//
//  LoginViewController.swift
//  Authentiation
//
//  Created by Apple on 29/03/2023.
//

import UIKit

class LoginViewController: UIViewController {
    private let emailfield: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.keyboardType = .emailAddress
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        field.leftViewMode = .always
        field.placeholder = "Email Address"
        field.backgroundColor = .systemBackground
        field.layer.cornerRadius = 8
        field.layer.masksToBounds = true
      return field
    }()
    private let passwordfield: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.leftViewMode = .always
        field.isSecureTextEntry = true
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        field.placeholder = "password"
        field.backgroundColor = .systemBackground
        field.layer.cornerRadius = 8
        field.layer.masksToBounds = true
      return field
    }()
    
    private let siginbutton: UIButton  = {
        let button = UIButton()
        button.backgroundColor = .systemRed
        button.setTitle("Sign in ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
      return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(emailfield)
        view.addSubview(passwordfield)
        view.addSubview(siginbutton)
    }
    
     
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
     
        emailfield.frame = CGRect(x: 25, y: Int(view.top)+100, width: Int(view.frame.width) - 40, height: 30)
        passwordfield.frame = CGRect(x: 25, y: Int(emailfield.frame.maxY) + 10, width: Int(view.frame.width) - 40, height: 30)
        siginbutton.frame = CGRect(x: 25, y: Int(passwordfield.frame.maxY) + 10, width: Int(view.frame.width) - 40, height: 30)
      

        

        
    }
    
    
}
