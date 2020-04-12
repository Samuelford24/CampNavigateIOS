//
//  Announcement.swift
//  CampNavigateIOS
//
//  Created by Samuel Ford on 4/8/20.
//  Copyright © 2020 Camp Navigate. All rights reserved.
//

import UIKit

class Announcement: NSObject {
    var announcement: String?
        var timestamp: String?
       
        
        init(dictionary: [String: Any]) {
            self.announcement = dictionary["announcement"] as? String ?? ""
            self.timestamp = dictionary["timeStamp"] as? String ?? ""
          
        }
    }
