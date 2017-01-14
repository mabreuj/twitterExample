//
//  TwitterFollower.swift
//  twitterExample
//
//  Created by Miguel Abreu on 1/14/17.
//  Copyright © 2017 mabreu. All rights reserved.
//

import UIKit

class TwitterFollower: NSObject {
    var userName: String = ""
    
    init(dictionary: Dictionary<String, Any>)
    {
        self.userName = dictionary["name"] as! String
    }
}
