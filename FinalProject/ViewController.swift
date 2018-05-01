//
//  ViewController.swift
//  FinalProject
//
//  Created by Jess Newman on 4/18/18.
//  Copyright © 2018 Newman. All rights reserved.
//

import UIKit
import TwitterKit
import SafariServices

class ViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.center = self.view.center
        showLoginButton()

    }


    func showLoginButton () {
        loginButton = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                print("signed in as \(String(describing: session?.userName))");
            } else {
                print("error: \(String(describing: error?.localizedDescription))");
            }
        })
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        loginTwitter()
        }
    
        func loginTwitter () {
        TWTRTwitter.sharedInstance().logIn(completion: { (session, error) in
            if (session != nil) {
                print("signed in as \(String(describing: session?.userName))");
                self.performSegue(withIdentifier: "ShowTimelineSegue", sender: self)
            } else {
                print("error: \(String(describing: error?.localizedDescription))");
            }
        })
    }
}

