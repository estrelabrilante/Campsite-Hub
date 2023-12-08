//
//  SignUpViewController.swift
//  Campsite Hub
//
//  Created by SHYNU MARY VARGHESE on 2023-12-02.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
class SignUpViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
   
    @IBOutlet weak var emailTextField: UITextField!
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
    //if every data is correct, this function returns nil otherwise erorr message
    func validateFields() -> String?{
        // Check that all fields are filled in
        var firstName =  firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
         var lastName = lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
         var email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
         var password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if firstName == ""{
            return "Please fill in all fields."
        }
        else if lastName == "" {
            return "Please fill in all fields."
        }
        else if email == ""{
            
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
    func transitionToHome() {
        
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
    @IBAction func signUpTapped(_ sender: Any) {
        print("button signup pressed")
         let error = validateFields()
        //error is there
        if error != nil {
            showError(error!)
            print("error found")
            errorLabel.alpha = 1
        }
        else{
            // Create cleaned versions of the data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                // Check for errors
                if err != nil {
                    // There was an error creating the user
                    self.showError("Error creating user")
                    self.errorLabel.alpha = 1
                }
                else {
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "uid": result!.user.uid ]) { (error) in
                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data")
                        }
                    }
                    // Transition to the home screen
                    self.transitionToHome()
                         
                      }
                    }
                }
             
            }
         
        }
    
    

