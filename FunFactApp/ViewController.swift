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
        funFactLabel.sizeToFit()
        
        super.viewDidLoad()
        retrieveFunFact()
    
        

        
    }
    override func viewDidLayoutSubviews(){
        funFactLabel.numberOfLines = 0
        funFactLabel.sizeToFit()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func retrieveFunFact(){
        let postEndpoint: String = "http://numbersapi.com/random/year?json"
        
        
        //guard should check to see if url is valid
        guard let url = NSURL(string: postEndpoint)else{
            print("Error: cannot create url")
            return
        }
        
        //    let url = NSURL(string: postEndpoint)
        
        let urlRequest = NSURLRequest(URL: url)
        
        //Create a session to send request
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        //implement tasks for completion handler
        //what will be done with the response from API
        let task = session.dataTaskWithRequest(urlRequest, completionHandler: {( data, response, error) in
            
            //Handle error
            guard let responseData = data else{
                print("Error: did not receive data")
                return
            }
            
            guard error == nil else{
                print("error calling GET on /posts/1")
                print(error)
                return
            }
            
            //parse the result as JSON, since that's what the API returns
            let post: NSDictionary
            
            do{
                post = try NSJSONSerialization.JSONObjectWithData(responseData, options: []) as! NSDictionary
            }catch{
                print("error trying to convert data to JSON")
                return
            }
            print("The fact is : " + post.description)
            
            //the post object is a dictionary
            //access title with 'title key
            //check for a title and print it if we have one
            
            if let postTitle = post["text"] as? String {
                print("The title is : " + postTitle)
                
                dispatch_async(dispatch_get_main_queue()){
                   
                    self.funFactLabel.text = postTitle
                    
                }
            }
        })
        
        task.resume()
    }


    @IBAction func showFunFact() {
//        funFactLabel.text = "Another fact"
        retrieveFunFact()
       
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
