//
//  Phone.swift
//  FunFactApp
//
//  Created by Laryssa Husiak on 3/26/16.
//  Copyright © 2016 Laryssa Husiak. All rights reserved.
//

import Foundation


let SPDefaultClientName:String = "larz";
let SPBaseCapabilityTokenUrl:String = "https://api.twilio.com/2010-04-01"
let SPTwiMLAppSid:String = "AP33cd5250b309679d2ef6f53676920f8e"

public class Phone{
    var device: TCDevice? = nil;
    var connection: TCConnection? = nil;
    
    
}

//This is from tutorial, I want to write my own so I understand what is happeing here
//
//func login(){
//    
//    let url:String = self.getCapabilityTokenUrl();
//    
//    var networkOperation = NetworkOperation();
//    
//    networkOperation.get(url, callback: { (err, response, body)-> () in
//        
//        if(err != nil){
//            return;
//            
//        }
//        
//        var token = body as? NSString
//        
//        print(token);
//        
//        if (err == nil && token != nil) {
//            if ( self.device == nil ) {
//                self.device = TCDevice(capabilityToken: token as! String, delegate: nil);
//            } else {
//                self.device!.updateCapabilityToken(token as! String);
//            }
//        } else if ( err != nil && response != nil) {
//            // We received and error with a response
//        } else if (err != nil) {
//            // We received an error without a response
//        }
//        
//        
//        
//    });
//    
//}
//
//func getCapabilityTokenUrl() ->String{
//    
//    var querystring:String = String();
//    
//    querystring += String(format: "&sid=%@", SPTwiMLAppSid);
//    querystring += String(format: "&name=%@", SPDefaultClientName)
//    
//    return String(format:SPBaseCapabilityTokenUrl, querystring);
//    
//}
//
//func connectWithParams(params dictParams:Dictionary<String,String> = Dictionary<String,String>()) {
//    
//    if (!self.capabilityTokenValid())
//    {
//        self.login();
//    }
//    
//    self.connection = self.device?.connect(dictParams, delegate: nil);
//}
//
//func capabilityTokenValid()->(Bool) {
//    var isValid:Bool = false;
//    
//    if (self.device != nil) {
//        var capabilities = self.device!.capabilities as NSDictionary;
//        
//        var expirationTimeObject:NSNumber = capabilities.objectForKey("expiration") as! NSNumber;
//        var expirationTimeValue:Int64 = expirationTimeObject.longLongValue;
//        var currentTimeValue:NSTimeInterval = NSDate().timeIntervalSince1970;
//        
//        if( (expirationTimeValue-Int64(currentTimeValue)) > 0 ) {
//            isValid = true;
//        }
//    }
//    
//    return isValid;
//}




