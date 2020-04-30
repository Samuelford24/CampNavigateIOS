//
//  AdminLogin.swift
//  CampNavigateIOS
//
//  Created by Samuel Ford on 4/6/20.
//  Copyright © 2020 Camp Navigate. All rights reserved.
//

import UIKit
import Firebase
class AdminLogin: UIViewController {

    @IBOutlet weak var password: UITextField!
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
    @IBAction func login(_ sender: Any) {
        Firestore.firestore().collection("Admin").document("Password").getDocument()
    { document, error in
  
        guard let snapshot = document else {
            print("Error retreiving snapshots \(error!)")
            return
        }
        
        let v = document?.get("password") as? String
        
        if(self.password.text == v){
            self.performSegue(withIdentifier: "admin", sender: self)
        }
        else{
            let ac = UIAlertController(title: "Wrong Password", message:nil, preferredStyle: UIAlertController.Style.alert)
                  let OKaction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { action in
                      ac.dismiss(animated: true, completion: nil)               })
                  
                  
                  
                  ac.addAction(OKaction)
            self.present(ac, animated: true, completion: nil)
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
}
