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
    
    var currentPage = 1
    
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
        loginTwitter() { () -> () in
           func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "ShowTimelineSegue" {
                    let destination = segue.destination as! ListTimelineTableViewController
                }
            }
        }
    }
    
        func loginTwitter (completed: @escaping () -> ()) {
        TWTRTwitter.sharedInstance().logIn(completion: { (session, error) in
            if (session != nil) {
                print("signed in as \(String(describing: session?.userName))");
            } else {
                print("error: \(String(describing: error?.localizedDescription))");
            }
        })
        completed ()
    }
}

