//
//  FieldTrip.swift
//  CampNavigateIOS
//
//  Created by Samuel Ford on 4/3/20.
//  Copyright © 2020 Camp Navigate. All rights reserved.
//

import UIKit

class FieldTrip: NSObject {
    var day: String?
        var wheree: String?
    var departing: String?
        var when: String?
    var bring: String?
        
        init(dictionary: [String: Any]) {
            self.day = dictionary["day"] as? String ?? ""
            self.wheree = dictionary["where"] as? String ?? ""
            self.departing = dictionary["departing"] as? String ?? ""
            self.when = dictionary["when"] as? String ?? ""
            self.bring = dictionary["bring"] as? String ?? ""
        }
    }
