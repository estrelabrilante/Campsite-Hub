//
//  ViewController.swift
//  Campsite Hub
//
//  Created by SHYNU MARY VARGHESE on 2023-12-01.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
class LoginViewController: UIViewController {
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElement()
    }
    func setUpElement(){
        errorLabel.alpha = 0
    }
    func validateFields() -> String?{
        // Check that all fields are filled in
        var email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        var password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if email == ""{
            return "Please fill in all fields."
        }
        else if password == ""    || Utilities.isPasswordValid(password!) == false {
            return "Please make sure password is 8 character with a special character and a number"
        }
        return nil
    }
    func showError(_ message: String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    func transitionToSignUp() {
        let signUpViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.signUpViewController) as? SignUpViewController
        view.window?.rootViewController = signUpViewController
        view.window?.makeKeyAndVisible()
       
    }
    func transitionToHome() {
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
       
        let email = emailTextField.text!
        homeViewController?.email = email
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
        
        
    }
    @IBAction func signUpButton(_ sender: UIButton) {
        transitionToSignUp()
    }
    
    @IBAction func LogInButton(_ sender: Any) {
        let error = validateFields()
        //error is there
        if error != nil {
            showError(error!)
            print("error found")
            errorLabel.alpha = 1
        }
        else{
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            // Create the user
            Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
                // Check for errors
                if err != nil {
                    // There was an error creating the user
                    self.showError("Error creating user")
                    self.errorLabel.alpha = 1
                }
                else {
                    self.transitionToHome()
                }
                
            }
            
        }
    }
}

