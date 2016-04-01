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
        
        

//            
//            // Use your own details here
//            let twilioSID = "AC49e1289b9227677c6ae2302565b1d133"
//            let twilioSecret = "ac3e06bd70c5a4b9fdd9a5da9965272d"
//            let fromNumber = "+15005550006"
//            let toNumber = "+6464987345"
//            let message = "Hey! You did it!"
//            
//            // Build the request
//            let request = NSMutableURLRequest(URL: NSURL(string:"https://\(twilioSID):\(twilioSecret)@api.twilio.com/2010-04-01/Accounts/\(twilioSID)/SMS/Messages")!)
//            request.HTTPMethod = "POST"
//            request.HTTPBody = "From=\(fromNumber)&To=\(toNumber)&Body=\(message)".dataUsingEncoding(NSUTF8StringEncoding)
//            
//            // Build the completion block and send the request
//            NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) in
//                print("Finished")
//                if let data = data, responseDetails = NSString(data: data, encoding: NSUTF8StringEncoding) {
//                    // Success
//                    print("Response: \(responseDetails)")
//                } else {
//                    // Failure
//                    print("Error: \(error)")
//                }
//            }).resume()
        
            
        
        
        
        
        
//        self.phone.login()
//        //GET URL
//        let postEndpoint: String = "http://jsonplaceholder.typicode.com/post/1"
//        //POST URL
//        let postsEndpoint: String = "http://jsonplaceholder.typicode.com/posts"
//        //TwilioPost
//        let twilioEndpoint: String = "https://api.twilio.com/2010-04-01"
//        
//        //guard should check to see if url is valid
//        guard let postsURL = NSURL(string: postsEndpoint)else{
//            print("Error: cannot create url")
//            return
//        }
//        
//            let url = NSURL(string: postEndpoint)
////        
////        let urlRequest = NSURLRequest(URL: url)
//        let postsUrlRequest = NSMutableURLRequest(URL: postsURL)
//        postsUrlRequest.HTTPMethod = "POST"
//        
//        //Create a session to send request
//        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
//        let session = NSURLSession(configuration: config)
//        
//        //Post body
//        let newPost: NSDictionary = ["title": "Frist Psot", "body": "I iz fisrt", "userId": 1]
//        do {
//            let jsonPost = try NSJSONSerialization.dataWithJSONObject(newPost, options: [])
//            postsUrlRequest.HTTPBody = jsonPost
//        } catch {
//            print("Error: cannot create JSON from post")
//        }
//        
//        
//        //POST Request
//        let task = session.dataTaskWithRequest(postsUrlRequest, completionHandler: {
//            (data, response, error) in
//            guard let responseData = data else {
//                print("Error: did not receive data")
//                return
//            }
//            guard error == nil else {
//                print("error calling GET on /posts/1")
//                print(error)
//                return
//            }
//            
//            // parse the result as JSON, since that's what the API provides
//            let post: NSDictionary
//            do {
//                post = try NSJSONSerialization.JSONObjectWithData(responseData,
//                    options: []) as! NSDictionary
//            } catch  {
//                print("error parsing response from POST on /posts")
//                return
//            }
//            // now we have the post, let's just print it to prove we can access it
//            print("The post is: " + post.description)
//            
//            // the post object is a dictionary
//            // so we just access the title using the "title" key
//            // so check for a title and print it if we have one
//            if let postID = post["id"] as? Int
//            {
//                print("The ID is: \(postID)")
//            }
//        })
//        task.resume()
//    }

        
        //GET Request implement tasks for completion handler
        //what will be done with the response from API
//        let task = session.dataTaskWithRequest(urlRequest, completionHandler: {( data, response, error) in
//            
//            //Handle error
//            guard let responseData = data else{
//                print("Error: did not receive data")
//                return
//            }
//            
//            guard error == nil else{
//                print("error calling GET on /posts/1")
//                print(error)
//                return
//            }
//            
//            //parse the result as JSON, since that's what the API returns
//            let post: NSDictionary
//            
//            do{
//                post = try NSJSONSerialization.JSONObjectWithData(responseData, options: []) as! NSDictionary
//            }catch{
//                print("error trying to convert data to JSON")
//                return
//            }
//            print("The pose is : " + post.description)
//            
//            //the post object is a dictionary
//            //access title with 'title key
//            //check for a title and print it if we have one
//            
//            if let postTitle = post["title"] as? String {
//                print("The title is : " + postTitle)
//            }
//            
//        })
        
//        task.resume()

        
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
