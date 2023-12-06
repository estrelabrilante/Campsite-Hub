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
    //if every data is correct, this function returns nil otherwise eroor message
    func validateFields() -> String?{
        //check all the fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "Please fill all the fields"
        }
        //check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false{
            return "Please make sure password is 8 character with a special character and a number"
        }
        return nil
    }
    func showError(_ message: String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
         let error = validateFields()
        //error is there
        if error != nil {
            let e = error
            showError(e!)
        }
        else{
            //create the user
            let firstName = firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!
            let password = passwordTextField.text!
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if error != nil{
                    self.showError("Error creating user")
                }
                else{
                    //users created account, now store data firstName and lastName
                    let db = Firestore.firestore()
                    // Add a new document with a generated ID
                    var ref: DocumentReference? = nil
                    ref = db.collection("users").addDocument(data: [
                        "firstname": firstName!,
                      "lastname": lastName!,
                        "uid": authResult?.user.uid
                    ]) { err in
                      if let err = err {
                          self.showError("Errror saving data")
                      } else {
                        print("Document added with ID: \(ref!.documentID)")
                      }
                    }
                    // Go to our home screen -- Navigate to homescreen
                    self.performSegue(withIdentifier: "GoToHomeScreen", sender: self)
                }
             
            }
         
        }
    }
    
}
