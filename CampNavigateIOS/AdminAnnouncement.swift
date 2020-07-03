//
//  AdminAnnouncement.swift
//  CampNavigateIOS
//
//  Created by Samuel Ford on 4/8/20.
//  Copyright © 2020 Camp Navigate. All rights reserved.
//

import UIKit
import Firebase
class AdminAnnouncement: UIViewController{

    @IBOutlet weak var announcement: UITextView!
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
    @IBAction func addAnnouncement(_ sender: Any) {
        let announceMent=announcement.text!
      //  let date = Date()
        //           let formatter = DateFormatter()
         //          formatter.dateFormat = "MM.dd.yyyy"
          //         let result = formatter.string(from: date)
 let date = Date()
 let formatter = DateFormatter()
        
        formatter.dateFormat = "LLLL d,yyyy"
                      let result = formatter.string(from: date)
 formatter.dateFormat = "h:mm a"
        let time = formatter.string(from: date as Date)
      print(time)
    let timeStamp=result + " at " + time
        Firestore.firestore().collection("Announcements").addDocument(data: [
            "announcement": announceMent,
            "timeStamp":timeStamp,"SortTimeStamp":FieldValue.serverTimestamp(),
            
           
          
           
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
