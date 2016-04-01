//
//  PhoneService.swift
//  FunFactApp
//
//  Created by Laryssa Husiak on 3/29/16.
//  Copyright © 2016 Laryssa Husiak. All rights reserved.
//

import Foundation

struct MessageService {


    let twilioAPIKey: String
    let twilioBaseURL: NSURL?
    let defaultClientName: String
    let twilioAccSid: String
    let twilioAccToken: String
   
    
//    let SPDefaultClientName:String = "larz";
//    let SPBaseCapabilityTokenUrl:String = "https://api.twilio.com/2010-04-01"
//    let SPTwiMLAppSid:String = "AP33cd5250b309679d2ef6f53676920f8e"
    
    
    //Things needed to make a message POST
    //Reference: https://www.twilio.com/docs/api/rest/sending-messages
    //To the destination phone number ex. +16175551212 
    //At least one:
        //From phone number
        //MessagingServiceSid
    //At least one:
        //Body
        //MediaUrl
    
    init(APIKey: String){
        
        twilioAPIKey = "AP33cd5250b309679d2ef6f53676920f8e"
        twilioAccSid = "ACef5153966a48320544c430f106950f3b"
        twilioAccToken = "d34e69a7e4c89dd389ccb41b82f26bab"
        twilioBaseURL = NSURL(string: "https://api.twilio.com/2010-04-01/\(twilioAccSid)/Messages")
        defaultClientName = "larz"
    
    }
    
    func postMessage(to: String, from: String, body: String, completion: (Phone? -> Void)){
//    
//        if let messageURL = NSURL(string: "\(to),\(body)")
    }
    
    
}

    //Construction URL with params
    
//    func login(){
//        
//        if let twilioURL = NSURL(string: "\(to)"
//        
//        var networkOperation = NetworkOperation(url: twilioURL);
//        
//            networkOperation.get(twilioURL, callback: { (err, response, body)-> () in
//        
//                if(err != nil){
//                    return;
//        
//                }
//        
//                var token = body as? NSString
//        
//                print(token);
//        
//                if (err == nil && token != nil) {
//                    if ( self.device == nil ) {
//                        self.device = TCDevice(capabilityToken: token as! String, delegate: nil);
//                    } else {
//                        self.device!.updateCapabilityToken(token as! String);
//                    }
//                } else if ( err != nil && response != nil) {
//                    // We received and error with a response
//                } else if (err != nil) {
//                    // We received an error without a response
//                }
//                
//                
//                
//            });
//        
//        func getCapabilityTokenUrl() ->String{
//        
//            var querystring:String = String();
//        
//            querystring += String(format: "&sid=%@", SPTwiMLAppSid);
//            querystring += String(format: "&name=%@", SPDefaultClientName)
//        
//            return String(format:SPBaseCapabilityTokenUrl, querystring);
//            
//        }
//
//}
