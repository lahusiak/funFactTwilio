//
//  PhoneService.swift
//  FunFactApp
//
//  Created by Laryssa Husiak on 3/29/16.
//  Copyright © 2016 Laryssa Husiak. All rights reserved.
//

import Foundation

struct MessageService {

    let twilioBaseURL: NSURL?
    let twilioSID: String
    let twilioSecret: String
   
    
    init(acctSID: String, acctSecret: String){
        self.twilioSID = acctSID
        self.twilioSecret = acctSecret
        
        self.twilioBaseURL = NSURL(string:"https://\(twilioSID):\(twilioSecret)@api.twilio.com/2010-04-01/Accounts/\(twilioSID)/SMS/Messages")
    }
    
    
    func postMessage(toNumber: String, fromNumber: String, message: String) {
        
    
        // Build the request
        let request = NSMutableURLRequest(URL: NSURL(string:"https://\(twilioSID):\(twilioSecret)@api.twilio.com/2010-04-01/Accounts/\(twilioSID)/SMS/Messages")!)
        request.HTTPMethod = "POST"
        request.HTTPBody = "From=\(fromNumber)&To=\(toNumber)&Body=\(message)".dataUsingEncoding(NSUTF8StringEncoding)
        print("the is request\(request)")
        
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


