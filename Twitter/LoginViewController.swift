//
//  LoginViewController.swift
//  Twitter
//
//  Created by Kelly Ly on 3/13/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
        
        
    }
    

    // outlet - creating something you'll change
    //action - creating something that'll react to an action (ex. click a button)
    @IBAction func onLoginButton(_ sender: Any) {
        
        // success - what we'll do if it works
        // failure if it doesn't (ex. print error)
        // url endpoint
        
        let myUrl = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: myUrl, success: {
            
            // when user logs in, creates userLoggedIn var to be true
            // next login, app checks for var first
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            
            
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
        }, failure: { Error in
            print("Could not log in!")
        })
    }
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
