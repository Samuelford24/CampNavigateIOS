//
//  AdminFieldTrip.swift
//  CampNavigateIOS
//
//  Created by Samuel Ford on 4/6/20.
//  Copyright © 2020 Camp Navigate. All rights reserved.
//

import UIKit

class AdminFieldTrip: UIViewController {
    @IBOutlet weak var week: UITextField!
    @IBOutlet weak var day: UITextField!
    @IBOutlet weak var `where`: UITextField!
    @IBOutlet weak var when: UITextField!
    @IBOutlet weak var bring: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addFieldTrip(_ sender: Any) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
