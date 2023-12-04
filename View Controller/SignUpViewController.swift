//
//  SignUpViewController.swift
//  Campsite Hub
//
//  Created by SHYNU MARY VARGHESE on 2023-12-02.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
   
    @IBOutlet weak var userNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElement()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    func setUpElement(){
        //hide the error label
        errorLabel.alpha = 0
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func signUpTapped(_ sender: Any) {
    }
    
}
