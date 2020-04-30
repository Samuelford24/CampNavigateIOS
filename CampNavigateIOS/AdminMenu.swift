//
//  AdminMenu.swift
//  CampNavigateIOS
//
//  Created by Samuel Ford on 4/6/20.
//  Copyright © 2020 Camp Navigate. All rights reserved.
//

import UIKit
import Firebase
class AdminMenu: UIViewController {
    
    @IBOutlet weak var week: UITextField!
    @IBOutlet weak var day: UITextField!
    @IBOutlet weak var breakfast: UITextField!
    @IBOutlet weak var lunch: UITextField!
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
    
    @IBAction func day(_ sender: Any) {
        let weekRef=week.text!
        if(weekRef=="Week1"||weekRef=="Week2"||weekRef=="Week3"||weekRef=="Week4"||weekRef=="Week5"||weekRef=="Week6"||weekRef=="Week7"||weekRef=="Week8"||weekRef=="Week9"||weekRef=="Week"){
        let b=Firestore.firestore()
            b.collection(week.text!).document("Menu").collection("MenuEntries").addDocument(data: [
            "day": day.text!,
            "lunch": lunch.text!,
            "breakfast": breakfast.text!,
           
        ]) { err in
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
        else{
            let ac = UIAlertController(title: "Incorrect Week Reference", message:"Reference should be Week + #(Week4). Week10=week", preferredStyle: UIAlertController.Style.alert)
                  let OKaction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { action in
                      ac.dismiss(animated: true, completion: nil)               })
                  
                  
                  
                  ac.addAction(OKaction)
                  present(ac, animated: true, completion: nil)
            
            //AlertView Incorrect week reference
        }
}
}

