//
//  FactService.swift
//  FunFactApp
//
//  Created by Laryssa Husiak on 4/1/16.
//  Copyright © 2016 Laryssa Husiak. All rights reserved.
//

import Foundation

struct FactService {
    
    let factBaseURL: NSURL?
    
    init() {
        factBaseURL = NSURL(string: "http://numbersapi.com")
//        "http://numbersapi.com/random/year?json"
       
        
    }
    //Building the URL with parameters
    func getFact(type: String, date: String, format: String, completion: (FunFact? -> Void)){
        if let funFactURL = NSURL(string: "/\(type)/\(date)?\(format)", relativeToURL: factBaseURL){
            
            print("This is funFactUrl: \(funFactURL)")
            
            let networkOperation = NetworkOperation(url: funFactURL)
            
            networkOperation.downloadJSONFromURL {
                (let JSONDictionary) in
                let funFact = self.funFactFromJSON(JSONDictionary)
                completion(funFact)
                
            }
            
        }else{
            print("Could not construct a valid URL")
            
        }
        
    }
    
    func funFactFromJSON(jsonDictionary: [String: AnyObject]?) -> FunFact? {
        if let funFactDictionary = jsonDictionary as [String: AnyObject]? {
            return FunFact(factDictionary: funFactDictionary)
            
        } else{
            print("JSON dictionary returned nil")
            return nil
        }
    }
    
}
