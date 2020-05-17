//
//  MenuViewController.swift
//  CampNavigateIOS
//
//  Created by Samuel Ford on 4/3/20.
//  Copyright © 2020 Camp Navigate. All rights reserved.
//

import UIKit
import Firebase

class MenuCell: UICollectionViewCell {
    @IBOutlet weak var day: UILabel!
   
    @IBOutlet weak var breakfast: UITextView!
    @IBOutlet weak var lunch: UITextView!
}
class MenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var passedReference: String!
    @IBOutlet weak var cv: UICollectionView!
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    var documentID=[String]()
    var menuArray=[Menu]()
    override func viewDidLoad() {
           super.viewDidLoad()

           // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        passedReference = defaults.object(forKey: "WeekReference") as! String
        retrieveData()
       }
    
    func retrieveData()  {
        self.loading.startAnimating()
        Firestore.firestore().collection(passedReference).document("Menu").collection("MenuEntries").addSnapshotListener(){ querySnapshot, error in
        print(querySnapshot)
            guard let snapshot = querySnapshot else {
                print("Error retreiving snapshots \(error!)")
                return
            }

            //print("Current data: \(snapshot.documents.map { $0.data() })")
        self.menuArray.removeAll()
        self.documentID.removeAll()
            for document in snapshot.documents{
                let  temp = Menu(dictionary: document.data())
                print(temp.breakfast)
              print(temp)
                self.menuArray.append(temp)
                self.documentID.append(document.documentID)
               
            }
            self.loading.stopAnimating()
        self.cv.reloadData()
        }
          /*      let temp = Menu(dictionary: document.data())
             print(temp)
                self.menu.append(temp)*/
           /*    if let city = document.flatMap({
                     $0.data().flatMap({ (data) in
                       return menu(dictionary: data)
                     })
                   }) {
                       print("City: \(city)")
                   } else {
                       print("Document does not exist")
                   }
          if let document = document, document.exists() {
            let people = document.data()!["people"]! as [Any]
            print(people!)
          } else {
            */
          }
        

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(menuArray.count)
        return menuArray.count
    }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menu", for: indexPath) as! MenuCell
    let menuItem = menuArray[indexPath.row]
    print("In cell",menuItem.breakfast)

   //cell.contentView.layer.borderWidth = 1.0
   //cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
   // cell.contentView.layer.borderColor = UIColor.black.cgColor
    cell.contentView.layer.cornerRadius = 4.0
          cell.contentView.layer.borderWidth = 1.0
          cell.contentView.layer.borderColor = UIColor.black.cgColor
          cell.contentView.layer.masksToBounds = false
          cell.layer.shadowColor = UIColor.gray.cgColor
          cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
          cell.layer.shadowRadius = 4.0
          cell.layer.shadowOpacity = 1.0
          cell.layer.masksToBounds = false
          cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
          
   
  
    
    cell.day?.text=menuItem.day
    cell.breakfast?.text="Breakfast: " + menuItem.breakfast!
    cell.lunch?.text="Lunch: " + menuItem.lunch!
 
    /* populate cell */
    return cell
        // let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menu", for: indexPath) as! MenuCell
    //return cell
     }
  /*  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let m=menuArray[indexPath.row]
        let t = documentID[indexPath.row]
        
    performSegue(withIdentifier: "edit", sender: self)
    }
  */
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             if (segue.identifier=="edit") {
}
}
}
