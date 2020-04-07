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
    @IBOutlet weak var `where`: UILabel!
    @IBOutlet weak var when: UILabel!
    @IBOutlet weak var bring: UILabel!
    
}
class FIeldTripController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    var fieldTripsArray=[FieldTrip]()
    @IBOutlet weak var cv: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        retrieveData();
    }
    func retrieveData(){
        let reference = Firestore.firestore().collection("week").document("FieldTrips").collection("FieldTripEntries").addSnapshotListener(){ querySnapshot, error in
       
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
        self.cv.reloadData()
        }
        
          }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return  fieldTripsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ft", for: indexPath) as! FieldTripCell
           let FT = fieldTripsArray[indexPath.row]
        cell.day?.text=FT.day
        cell.where?.text="Where: " + FT.wheree!
        cell.when?.text="When: " + FT.when!
        cell.bring?.text="Bring: " + FT.bring!
        

           cell.contentView.layer.borderWidth = 1.0
          cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
           cell.contentView.layer.borderColor = UIColor.black.cgColor
          
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