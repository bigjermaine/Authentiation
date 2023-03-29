//
//  HomeViewController.swift
//  Authentiation
//
//  Created by Apple on 29/03/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    
    private let headeImage : UIImageView  = {
        let    headeImage = UIImageView()
        headeImage.image = UIImage(systemName:"person")
        headeImage.contentMode = .scaleAspectFill
        headeImage.isUserInteractionEnabled = true
        headeImage.tintColor = .black
        headeImage.translatesAutoresizingMaskIntoConstraints = false
        headeImage.layer.masksToBounds = true

        
        headeImage.isUserInteractionEnabled = true
        
        return  headeImage
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
         title = "Welcome"
        view.backgroundColor = .systemBackground
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Custom Back", style: .plain, target: nil, action: nil)
        view.addSubview(headeImage)
        configureconstraints()
    }
    
    func configureconstraints() {
      
            let webconstraints = [
             headeImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
             headeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             headeImage.widthAnchor.constraint(equalToConstant: 80),
             headeImage.heightAnchor.constraint(equalToConstant: 120),
           
                
            ]
      
        
        NSLayoutConstraint.activate(webconstraints)
       
    }
    
    

}
