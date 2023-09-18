//
//  ViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 이승현 on 2023/09/11.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    
    @IBOutlet weak var changeButton: UIButton!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        nicknameTextField.placeholder = NSLocalizedString("nickname_result", comment: "")
        
        nicknameTextField.placeholder = "nic"
        
        
        let value = NSLocalizedString("nickname_result", comment: "")
        
        resultLabel.text = String(format: value, "고래밥")
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    
    
    
    


}

