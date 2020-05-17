//
//  FIeldTripController.swift
//  CampNavigateIOS
//
//  Created by Samuel Ford on 4/4/20.
//  Copyright © 2020 Camp Navigate. All rights reserved.
//

import UIKit
import Firebase
class FieldTripCell: UICollectionViewCell {
    @IBOutlet weak var day: UILabel!
    
    @IBOutlet weak var `where`: UITextView!
    
    @IBOutlet weak var departing: UITextView!

    @IBOutlet weak var when: UITextView!
    
    @IBOutlet weak var bring: UITextView!
}
class FIeldTripController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    var fieldTripsArray=[FieldTrip]()
    @IBOutlet weak var cv: UICollectionView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    var passedReference: String!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        passedReference = defaults.object(forKey: "WeekReference") as! String
        retrieveData();
    }
    func retrieveData(){
        self.loading.startAnimating()
        let reference = Firestore.firestore().collection(passedReference).document("FieldTrips").collection("FieldTripEntries").addSnapshotListener(){ querySnapshot, error in
       
            guard let snapshot = querySnapshot else {
                print("Error retreiving snapshots \(error!)")
                return
            }

            //print("Current data: \(snapshot.documents.map { $0.data() })")
        self.fieldTripsArray.removeAll()
            for document in snapshot.documents{
                let  temp = FieldTrip(dictionary: document.data())
                
        
                print(temp.bring)
                self.fieldTripsArray.append(temp)
                
               
            }
            self.loading.stopAnimating()
        self.cv.reloadData()
        }
        
          }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return  fieldTripsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ft", for: indexPath) as! FieldTripCell
           let FT = fieldTripsArray[indexPath.row]
        cell.departing?.text="Departing: " + FT.departing!
        cell.day?.text=FT.day
        cell.where?.text="Where: " + FT.wheree!
        cell.when?.text="When: " + FT.when!
        cell.bring?.text="Bring: " + FT.bring!
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
              

          // cell.contentView.layer.borderWidth = 1.0
         // cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
           //cell.contentView.layer.borderColor = UIColor.black.cgColor
          
        return cell
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
