//
//  AnnouncementVC.swift
//  CampNavigateIOS
//
//  Created by Samuel Ford on 4/8/20.
//  Copyright © 2020 Camp Navigate. All rights reserved.
//

import UIKit
import Firebase
class AnnouncementCell: UICollectionViewCell {
    @IBOutlet weak var timestamp: UILabel!
    
    @IBOutlet weak var announcement: UITextView!
}
class AnnouncementVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var AnnouncementArray=[Announcement]()
  
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var CV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
CV!.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        // Do any additional setup after loading the view.
        retrieveData()
    }
   
    func retrieveData(){
        self.loading.startAnimating()
        let reference = Firestore.firestore().collection("Announcements").order(by: "SortTimeStamp", descending: true).addSnapshotListener(){ querySnapshot, error in
        guard let snapshot = querySnapshot else {
                 print("Error retreiving snapshots \(error!)")
                 return
             }

         self.AnnouncementArray.removeAll()
             for document in snapshot.documents{
                 let  temp = Announcement(dictionary: document.data())
                   self.AnnouncementArray.append(temp)
             }
              self.loading.stopAnimating()
            
         self.CV.reloadData()
     
            let ac = UIAlertController(title: "There aren't any announcements", message:"Please check back later", preferredStyle: UIAlertController.Style.alert)
                              let OKaction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { action in
                                  ac.dismiss(animated: true, completion: nil)               })
                              
        }
    
         
           
    
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(AnnouncementArray.count)
     return  AnnouncementArray.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
          
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "announcement", for: indexPath) as! AnnouncementCell
        let AnnouncementItem = AnnouncementArray[indexPath.row]
      cell.contentView.layer.cornerRadius = 8.0
                  //cell.contentView.layer.borderWidth = 1.0
                  //cell.contentView.layer.borderColor = UIColor.black.cgColor
        cell.contentView.layer.masksToBounds = true
        cell.layer.shadowColor = UIColor.gray.cgColor
                  cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
                  cell.layer.shadowRadius = 4.0
                  cell.layer.shadowOpacity = 1.0
                  cell.layer.masksToBounds = true
                  cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
                  
           
        
            
            cell.announcement?.text=AnnouncementItem.announcement
        cell.timestamp?.text=AnnouncementItem.timestamp
        cell.layer.cornerRadius = 8
            return cell
                // let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menu", for: indexPath) as! MenuCell
            //return cell
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


