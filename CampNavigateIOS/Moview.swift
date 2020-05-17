//
//  Moview.swift
//  CampNavigateIOS
//
//  Created by Samuel Ford on 4/17/20.
//  Copyright © 2020 Camp Navigate. All rights reserved.
//

import UIKit
import Firebase
class MovieCell: UICollectionViewCell{


    
    @IBOutlet weak var k2: UITextView!

    
    @IBOutlet weak var th5: UITextView!
    
    @IBOutlet weak var ms: UITextView!
    
    
}
class Moview: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var cv: UICollectionView!
    var movieArray=[Movie]()
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
            let reference = Firestore.firestore().collection(passedReference).document("Movies").collection("MovieEntries").addSnapshotListener(){ querySnapshot, error in
           
                guard let snapshot = querySnapshot else {
                    print("Error retreiving snapshots \(error!)")
                    return
                }

                //print("Current data: \(snapshot.documents.map { $0.data() })")
            self.movieArray.removeAll()
                for document in snapshot.documents{
                    let  temp = Movie(dictionary: document.data())
                    
            
         
                    self.movieArray.append(temp)
                    
                   
                }
                self.loading.stopAnimating()
            self.cv.reloadData()
            }
            
              }
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return  movieArray.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movie", for: indexPath) as! MovieCell
               let movie = movieArray[indexPath.row]
            cell.k2?.text="K-2nd: " + movie.k2!
            cell.th5?.text="3rd-5th: " + movie.three5!
            cell.ms?.text="Middle School: " + movie.ms!
            
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
