//
//  Menu.swift
//  CampNavigateIOS
//
//  Created by Samuel Ford on 4/3/20.
//  Copyright © 2020 Camp Navigate. All rights reserved.
//

import UIKit

class Menu: NSObject {
 var day: String?
    var breakfast: String?
    var lunch: String?
    
    init(dictionary: [String: Any]) {
        self.day = dictionary["day"] as? String ?? ""
        self.breakfast = dictionary["breakfast"] as? String ?? ""
        self.lunch = dictionary["lunch"] as? String ?? ""
    }
}
