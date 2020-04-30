//
//  AccessCode.swift
//  CampNavigateIOS
//
//  Created by Samuel Ford on 4/16/20.
//  Copyright © 2020 Camp Navigate. All rights reserved.
//

import UIKit
import Firebase
class AccessCode: UIViewController {

    @IBOutlet weak var usercode: UITextField!
 override func viewDidAppear(_ animated: Bool){
 super.viewDidAppear(animated)
        let defaults = UserDefaults.standard
        let usercode = defaults.object(forKey: "AC") as? String
        print(usercode)
        
        if (usercode != nil) {
             let vc = self.storyboard?.instantiateViewController(withIdentifier: "tab")
                     self.present(vc!, animated: true, completion: nil)
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      let Tap:UITapGestureRecognizer = UITapGestureRecognizer (target: self, action: #selector(DismissKeyboard))
             view.addGestureRecognizer(Tap)
             // Do any additional setup after loading the view.
         }
         
         @objc func DismissKeyboard()  {
             view.endEditing(true)
         }
   
    @IBAction func verify(_ sender: Any) {
        let defaults=UserDefaults.standard
        var ActualCode=""
       Firestore.firestore().collection("AccessCode").document("Code").getDocument(){ querySnapshot, error in
                            print(querySnapshot)
                                guard let snapshot = querySnapshot else {
                                 
                                    return
                                }
        ActualCode = (querySnapshot?.get("code") as? String)!
                            print("Actual Code",ActualCode)
                        
        print(self.usercode.text)
        if(ActualCode == self.usercode.text){
                    
                            defaults.set(ActualCode, forKey: "AC")
            self.performSegue(withIdentifier: "verify", sender: self)
                         }
        else{
            let ac = UIAlertController(title: "Incorrect Code", message: "Please enter the correct code to access the app!", preferredStyle: UIAlertController.Style.alert)
           
                   let OKaction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { action in
                    ac.dismiss(animated: false, completion: nil)
            
    })
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
