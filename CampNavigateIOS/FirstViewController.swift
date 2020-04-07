//
//  FirstViewController.swift
//  CampNavigateIOS
//
//  Created by Samuel Ford on 4/3/20.
//  Copyright © 2020 Camp Navigate. All rights reserved.
//

import UIKit
import Firebase
class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
          retrieveData()
            }
         func retrieveData()  {
            Firestore.firestore().collection("week").document("Menu").collection("MenuEntries").getDocuments(){ querySnapshot, error in
             print(querySnapshot)
                 guard let snapshot = querySnapshot else {
                     print("Error retreiving snapshots \(error!)")
                     return
                 }

                 //print("Current data: \(snapshot.documents.map { $0.data() })")

                 for document in snapshot.documents{
                     print(document.data())
                 }
             }

}

}
