//
//  AdminPictures.swift
//  CampNavigateIOS
//
//  Created by Samuel Ford on 4/28/20.
//  Copyright © 2020 Camp Navigate. All rights reserved.
//

import UIKit
import Firebase
class AdminPictures: UIViewController {

    @IBOutlet weak var link: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func updateLink(_ sender: Any) {
        Firestore.firestore().collection("Pictures").document("Link").updateData(["link":link.text!]){ err in
        if let err = err {
             let ac = UIAlertController(title: "Upload Error", message:"Please try again", preferredStyle: UIAlertController.Style.alert)
                  let OKaction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { action in
                      ac.dismiss(animated: true, completion: nil)               })
                  
                  
                  
                  ac.addAction(OKaction)
            self.present(ac, animated: true, completion: nil)
        } else {
              let ac = UIAlertController(title: "Successfully added", message:nil, preferredStyle: UIAlertController.Style.alert)
                  let OKaction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { action in
                      ac.dismiss(animated: true, completion: nil)               })
                  
                  
                  
                  ac.addAction(OKaction)
            self.present(ac, animated: true, completion: nil)
        }
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
}
