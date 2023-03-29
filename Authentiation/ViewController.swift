//
//  ViewController.swift
//  Authentiation
//
//  Created by Apple on 29/03/2023.
//

import UIKit

class ViewController: UIViewController {
    

    
    let authenticationManager = AuthenticationManager()
    
    let ButtonView: UIButton = {
        let imageView = UIButton()
        imageView.backgroundColor = .orange
        imageView.layer.cornerRadius = 12
        imageView.layer.shadowRadius = 26
        imageView.setTitle("Login", for: .normal)
        return imageView
        
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        alertShow()
         view.backgroundColor = .systemBackground
         view.addSubview(ButtonView)
        image()
        buttonFunctions()
        
       
    }
  
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        ButtonView.frame = CGRect(x: view.width/8 , y: view.height/2, width: view.width -  100, height: view.width/8)
        
    }

    private func image() {
        switch authenticationManager.biometryType {

        case .touchID:
            ButtonView.setTitle("Login with TouchId", for: .normal)
        case .faceID:
            ButtonView.setTitle("Login with FaceId", for: .normal)
         default:
            ButtonView.setTitle("Login with Credentials", for: .normal)
        }
     
    }
    
    private func buttonFunctions() {
        switch authenticationManager.biometryType {

        case .touchID:
            ButtonView.addTarget(self, action: #selector(verification), for: .touchUpInside)
        case .faceID:
            ButtonView.addTarget(self, action: #selector(verification), for: .touchUpInside)
         default:
            ButtonView.addTarget(self, action: #selector(verification1), for: .touchUpInside)
        }
     
    }
    
    
    @objc  func verification() {
        Task.init {
            await  authenticationManager.authenticateWithBiometrics()
        }
    }
        
    @objc  func verification1() {
        let signVC = LoginViewController()
        signVC.navigationItem.largeTitleDisplayMode = .always
        let NavVc =  UINavigationController(rootViewController: signVC)
        NavVc.navigationBar.prefersLargeTitles  = true
        NavVc.modalPresentationStyle = .fullScreen
        self.present(NavVc, animated: true)
    }
    
    private func  alertShow() {
        if  authenticationManager.showAlert {
            DispatchQueue.main.asyncAfter(deadline: .now()){
                let sheet = UIAlertController(title: "WrongCredentials", message: nil, preferredStyle: .actionSheet)
                sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel,handler:nil))
                self.present(sheet, animated: true)
            }
        } else {
            print("Good to go")
            DispatchQueue.main.asyncAfter(deadline: .now()){
                let signVC = HomeViewController()
                signVC.navigationItem.largeTitleDisplayMode = .always
                let NavVc =  UINavigationController(rootViewController: signVC)
                NavVc.navigationBar.prefersLargeTitles  = true
                NavVc.modalPresentationStyle = .fullScreen
                self.present(NavVc, animated: true)
            }
        }
     
    }
    
}

