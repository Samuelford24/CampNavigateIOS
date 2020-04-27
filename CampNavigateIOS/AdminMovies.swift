//
//  AdminMovies.swift
//  CampNavigateIOS
//
//  Created by Samuel Ford on 4/18/20.
//  Copyright © 2020 Camp Navigate. All rights reserved.
//

import UIKit
import Firebase
class AdminMovies: UIViewController {

    @IBOutlet weak var week: UITextField!
    @IBOutlet weak var k2nd: UITextField!
    @IBOutlet weak var three5: UITextField!
    @IBOutlet weak var ms: UITextField!
    var weekRef: String!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addMovie(_ sender: Any) {
        weekRef=week.text!
        if(weekRef=="Week1"||weekRef=="Week2"||weekRef=="Week3"||weekRef=="Week4"||weekRef=="Week5"||weekRef=="Week6"||weekRef=="Week7"||weekRef=="Week8"||weekRef=="Week9"||weekRef=="Week"){ Firestore.firestore().collection(weekRef).document("Movies").collection("MovieEntries").addDocument(data: [
            "k2": k2nd.text!,
        "three5": three5.text!,
        "ms": ms.text!,
    ])
   { err in
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
