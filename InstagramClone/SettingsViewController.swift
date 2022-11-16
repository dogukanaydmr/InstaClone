//
//  SettingsViewController.swift
//  InstagramClone
//
//  Created by Doğukan Aydemir on 8.11.2022.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logOutClicked(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toVC", sender: nil)

        } catch {
            print("error")
        }
    }
}
