//
//  FieldTripViewController.swift
//  FieldTrip7
//
//  Created by tim on 2015-09-20.
//  Copyright © 2015 Sbrew. All rights reserved.
//

import UIKit

public class FieldTripViewController: UIViewController {
    
    public var schoolName = ""
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        schoolNameLabel?.text = schoolName
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func submit(sender: AnyObject) {
        nameField.resignFirstResponder()

        // TODO:  Add validation on unique school name to server side
        if let fieldTripName = nameField.text {
            School.createFieldTrip(fieldTripName, forSchoolNamed: schoolName) { (result) in
                dispatch_async(dispatch_get_main_queue()) { () -> Void in
                    self.resultLabel?.text = (result! == 201) ? "Success" : "Failure"
                }
            }
        }
    }
    
    @IBAction func hitenter(sender: UITextField) {
        submit(sender)
    }
}
