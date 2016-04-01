////
////  NetworkOperation.swift
////  FunFactApp
////
////  Created by Laryssa Husiak on 3/27/16.
////  Copyright © 2016 Laryssa Husiak. All rights reserved.
////
//
//import Foundation
//
//
//
////Simple Rest API Request
////from Grok Swift
//
//
////public func dataTaskWithRequest(request: NSURLRequest, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> {
//
//class NetworkOperation{
//
//    func makeGetRequest(){
//        
//        print("I'm in makeGetRequest")
//    //setup URL request
//    let postEndpoint: String = "http://jsonplaceholder.typicode.com/posts/1"
//
//    //guard should check to see if url is valid
//    guard let url = NSURL(string: postEndpoint)else{
//        print("Error: cannot create url")
//        return
//        }
//    
////    let url = NSURL(string: postEndpoint)
//
//    let urlRequest = NSURLRequest(URL: url)
//    
//    
//    //Create a session to send request
//    let config = NSURLSessionConfiguration.defaultSessionConfiguration()
//    let session = NSURLSession(configuration: config)
//    
//    //implement tasks for completion handler
//    //what will be done with the response from API
//    let task = session.dataTaskWithRequest(urlRequest, completionHandler: {( data, response, error) in
//        
//        //Handle error
//        guard let responseData = data else{
//            print("Error: did not receive data")
//            return
//        }
//        
//        guard error == nil else{
//            print("error calling GET on /posts/1")
//            print(error)
//            return
//        }
//        
//        //parse the result as JSON, since that's what the API returns
//        let post: NSDictionary
//        
//        do{
//            post = try NSJSONSerialization.JSONObjectWithData(responseData, options: []) as! NSDictionary
//        }catch{
//            print("error trying to convert data to JSON")
//            return
//        }
//        print("The pose is : " + post.description)
//        
//        //the post object is a dictionary
//        //access title with 'title key
//        //check for a title and print it if we have one
//        
//        if let postTitle = post["title"] as? String {
//            print("The title is : " + postTitle)
//        }
//        
//    })
//    
//    task.resume()
//
//}
//
//}
//
////class NetworkOperation{
////    
////    lazy var config: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
////    
////    lazy var session: NSURLSession = NSURLSession(configuration: self.config)
////    
////    let postEndpoint: String = " "
////    
////    let queryURL =  NSURL(string: self.postEndpoint)
////    
////    let urlRequest = NSURLRequest(URL: queryURL)
////    
////    //To be passed into completion callback
////    typealias JSONDictionaryCompletion = ([String: AnyObject]?)-> Void
////    
////
////    
////    //completion is callback
////    
////    func downloadJSONFromURL(completion: JSONDictionaryCompletion){
////    
////        let request: NSURLRequest = NSURLRequest(URL: queryURL)
////        let dataTask = session.dataTaskWithRequest(request){
////        
////            (let data, let response, let error) in
////            
////            //1. Check HTTP response for successful GET request
////            
////            
////            if let httpResponse = response as? NSHTTPURLResponse{
////            
////                switch(httpResponse.statusCode){
////                case 200:
////                    //2. Create JSON Object with data
////                    let jsonDictionary = try? NSJSONSerialization.JSONObjectWithData(data!, options: []) as? [String: AnyObject]
////                    
////                    completion(jsonDictionary!)
////                    
////                //add more error handling
////                default:
////                    print("GET request not successful, HTTP status code: \(httpResponse.statusCode)")
////                    
////                }
////                
////            }else{
////            
////            print("Error: Not a valid HTTP response")
////            }
////        }
////        
////    dataTask.resume()
////    }
////
////    
////}
