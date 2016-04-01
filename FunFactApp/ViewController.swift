//
//  ViewController.swift
//  FunFactApp
//
//  Created by Laryssa Husiak on 3/24/16.
//  Copyright © 2016 Laryssa Husiak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var phone:Phone = Phone()
    
//    var networkOperation = NetworkOperation()

    @IBOutlet weak var funFactLabel: UILabel!
    
    override func viewDidLoad() {
        funFactLabel.text = "I'm a fun fact"
        super.viewDidLoad()

        
    }
        


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showFunFact() {
        funFactLabel.text = "Check me out!"
       
    }

    @IBAction func makeACall(sender: AnyObject) {
//        self.phone.connectWithParams()
        print("Tapped button1")
        
        
        // Use your own details here
        let twilioSID = valueForPrivateInfo("twilioSID")
        let twilioSecret = valueForPrivateInfo("twilioSecret")
        let fromNumber = valueForPrivateInfo("fromNumber")
        let toNumber = valueForPrivateInfo("toNumber")
        let message = "Hey! You did it!"
        
        // Build the request
        let request = NSMutableURLRequest(URL: NSURL(string:"https://\(twilioSID):\(twilioSecret)@api.twilio.com/2010-04-01/Accounts/\(twilioSID)/SMS/Messages")!)
        request.HTTPMethod = "POST"
        request.HTTPBody = "From=\(fromNumber)&To=\(toNumber)&Body=\(message)".dataUsingEncoding(NSUTF8StringEncoding)
        
        // Build the completion block and send the request
        NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) in
            print("Finished")
            if let data = data, responseDetails = NSString(data: data, encoding: NSUTF8StringEncoding) {
                // Success
                print("Response: \(responseDetails)")
            } else {
                // Failure
                print("Error: \(error)")
            }
        }).resume()
        
        
}

}
