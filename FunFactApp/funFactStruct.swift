//
//  FunFactStruct.swift
//  FunFactApp
//
//  Created by Laryssa Husiak on 4/1/16.
//  Copyright © 2016 Laryssa Husiak. All rights reserved.
//

import Foundation

struct FunFact {
    let fact: String?
    let number: Int?
    let date: String?
    let year: String?
    
    init(factDictionary: [String: AnyObject]){
        
        fact = factDictionary["text"] as? String
        number = factDictionary["number"] as? Int
        date = factDictionary["date"] as? String
        year = factDictionary["year"] as? String
        
    }
    
    
}