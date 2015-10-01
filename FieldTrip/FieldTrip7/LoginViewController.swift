//
//  LoginViewController.swift
//  FieldTrip7
//
//  Created by tim on 2015-09-17.
//  Copyright © 2015 Sbrew. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // (Retreive username and server from user preferences)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        School.serverName = serverName.text ?? "localhost:3000"
        School.userName = userName.text!
        School.password = password.text!
    }

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var serverName: UITextField!
}
