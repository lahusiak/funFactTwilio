//
//  SensitiveFunction.swift
//  FunFactApp
//
//  Created by Laryssa Husiak on 3/31/16.
//  Copyright © 2016 Laryssa Husiak. All rights reserved.
//

import Foundation

func valueForPrivateInfo(keyname:String) -> String {
    let filePath = NSBundle.mainBundle().pathForResource("SensitivePlist2", ofType:"plist")
    print("This is plistpath:", filePath)
    
    let plist = NSDictionary(contentsOfFile:filePath!)
    
    
    let value:String = plist?.objectForKey(keyname) as! String
    return value
}
