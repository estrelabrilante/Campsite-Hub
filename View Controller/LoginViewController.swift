//
//  ViewController.swift
//  Campsite Hub
//
//  Created by SHYNU MARY VARGHESE on 2023-12-01.
//

import UIKit

class LoginViewController: UIViewController {

  
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElement()
    }
    func setUpElement(){
        errorLabel.alpha = 0
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
    }
    
    @IBAction func LogInButton(_ sender: Any) {
        
        print("pressed")
    }
    
}

