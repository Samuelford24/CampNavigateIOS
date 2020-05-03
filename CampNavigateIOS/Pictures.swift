//
//  Pictures.swift
//  CampNavigateIOS
//
//  Created by Samuel Ford on 4/27/20.
//  Copyright © 2020 Camp Navigate. All rights reserved.
//

import UIKit
import Firebase
class Pictures: UIViewController {

  
   
    @IBOutlet weak var tv: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        retrieveLink()
    }
    
    func retrieveLink(){
        Firestore.firestore().collection("Pictures").document("Link").addSnapshotListener() { (document, error) in
            if let document = document, document.exists {
                let s =   document.get("link") as! String
                print(s)
                self.tv.text="Link to Pictures: " + s
              
            } else {
                print("Document does not exist")
            }
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
