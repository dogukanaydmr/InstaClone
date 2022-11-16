//
//  ViewController.swift
//  InstagramClone
//
//  Created by Doğukan Aydemir on 8.11.2022.
//

import UIKit
import Firebase
import FirebaseFirestore

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInClicked(_ sender: UIButton) {
        if emailTextfield.text != "" && passwordTextfield.text != "" {
            Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { authdata, error in
                
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            makeAlert(titleInput: "Error!", messageInput: "Username/Password not found.")
        }
    }
    
    @IBAction func signUpClicked(_ sender: UIButton) {
        if emailTextfield.text != "" && passwordTextfield.text != "" {
            Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { authdata, error in
                
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            makeAlert(titleInput: "Error!", messageInput: "Username/Password not found.")
        }
    }

    

    
    func makeAlert(titleInput : String, messageInput : String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

