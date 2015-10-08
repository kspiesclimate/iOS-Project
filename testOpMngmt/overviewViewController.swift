//
//  overviewViewController.swift
//  testOpMngmt
//
//  Created by Katie Spies on 10/4/15.
//  Copyright (c) 2015 Katie Spies. All rights reserved.
//

import UIKit

class overviewViewController: UIViewController {

    @IBAction func dismissButtonAction(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            //hide nitrogen topic, unhide overview
            self.overviewImage.hidden = false
            self.nitrogenTopic.frame.origin.y = 768
        }) { (completed) -> Void in
            //completion code, disable button
            self.dismissButtonOutlet.enabled = false
        }
    }
    @IBOutlet weak var dismissButtonOutlet: UIButton!
    @IBOutlet weak var overviewImage: UIImageView!
    @IBOutlet weak var nitrogenTopic: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        nitrogenTopic.hidden = true
        dismissButtonOutlet.enabled = false

        // Do any additional setup after loading the view.
    }

    @IBAction func openNitrogenTopic(sender: AnyObject) {
        self.nitrogenTopic.hidden = false
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            //show nitrogen topic
            self.nitrogenTopic.frame.origin.y = 0
        }) { (completed) -> Void in
            //hide overview, enable dismiss button
            self.overviewImage.hidden = true
            self.dismissButtonOutlet.enabled = true
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
