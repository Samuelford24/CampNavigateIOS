//
//  Movie.swift
//  CampNavigateIOS
//
//  Created by Samuel Ford on 4/17/20.
//  Copyright © 2020 Camp Navigate. All rights reserved.
//

import UIKit

class Movie: NSObject {
    var k2: String?
        var three5: String?
    var ms: String?
      
        
        init(dictionary: [String: Any]) {
            self.k2 = dictionary["k2"] as? String ?? ""
            self.three5 = dictionary["three5"] as? String ?? ""
            self.ms = dictionary["ms"] as? String ?? ""
           
        }
    }


