//
//  ViewController.swift
//  CampNavigateIOS
//
//  Created by Samuel Ford on 4/3/20.
//  Copyright © 2020 Camp Navigate. All rights reserved.
//

import UIKit
import Firebase
import OneSignal
class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var locationDescription: UILabel!
    
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    var weekReference: String!
    let locationNames = ["Week 1: Be the Change", "Week 2: Courage to Encourage", "Week 3: Knowledge Is Power", "Week 4: Think Big", "Week 5: Home of the Brave", "Week 6: Christmas in July", "Week 7: SUPER Healthy Habits", "Week 8: Team Work Makes the Dream Work", "Week 9: Camps Got Talent", "Week 10: Your Family is My Family"]
    
    let locationImages = [UIImage(named: "w1"), UIImage(named: "w2"), UIImage(named: "w3"), UIImage(named: "w4"), UIImage(named: "w5"), UIImage(named: "w6"), UIImage(named: "w7"), UIImage(named: "w10"), UIImage(named: "w8"), UIImage(named: "w9")]
    
    let locationDescription = ["Welcome! Summer Camp is new to so many and each summer is new and exciting at Camp Navigate! We will have a field day and fun activities as the campers gain the courage to adapt to new friends, work together, and become familiar with Summer Camp Life!", "We love encouraging our campers! We, also know, sometimes as a young person it takes courage to reach out to your peers. This is a perfect time to focus on inclusion, acceptance, and kindness. We will practice including others as we dine at the Grand Traverse Pie Company!", "This week is all about our campers’ personal expertise. They will be able to share their area of knowledge as we have a “teaching” Show and Tell week. The campers will take turns teaching others a particular activity they love and would like to share with their friends! It will take courage to speak in front of others but we are excited to see our campers’ communication skills improve and watch them shine amongst their peers!","This week we will think outside the box! Our Campers will learn from past inventors that had courage to make mistakes and discover that failures can be the beginning of something great. Attitude and perspective changes everything! We can’t wait to see what our Campers will create!","This week our campers will enjoy many activities that will remind us of the bravery of so many heroes throughout history. Many have benefited by the courage of our forefathers. Campers will explore our great nation’s history and celebrate the freedoms that we are so privileged to have. They will be designing their very own T-Shirt in honor of our Country’s Birthday!","We are blessed to have a real hero that watches over us daily. This week our devotionals will focus on the strength and love that we receive from God every single day. Our activities will center around how best to connect and celebrate each other with a Christ like love. And of course there will be a few Christmas surprises along the way.","We love our campers just the way they are! This week we will learn to love and respect ourselves! We all come in different shapes and sizes and this week we will focus on our amazing uniqueness! Having courage to be the best “me” requires making wise choices.","Join us as we have a week full of activities of Olympic proportion. This week we will learn about the courageous athletes who have traveled to Japan to represent the United States at the Summer Olympics. We will hear their stories of struggles and success; we will learn the history of this great event; and we will have some very competitive, yet friendly, Summer Games –Camp Navigate style!","This week is a favorite for our Campers! They love preparing group acts or going solo…either way, it is their creation (within limits). No capes needed for these Super Heroes that are up on stage!","During this last week of Camp, we celebrate with a private pool party at the Robinson pool and our end of the summer family cookout! By the end of summer, the Campers have played hard, worked hard and learned a lot about how to succeed in life! Our hope is that they will now better know how to communicate in a respectful manner with friends and family as they have the courage to enter a new school year."]
    
    
    override func viewDidAppear(_ animated: Bool) {
        //navigationController?.navigationBar.barStyle = .black
    }
    override func viewDidLoad() {
         
       let status: OSPermissionSubscriptionState = OneSignal.getPermissionSubscriptionState()

        let hasPrompted = status.permissionStatus.hasPrompted
       print("hasPrompted = \(hasPrompted)")
       if hasPrompted == false {
         OneSignal.addTrigger("prompt_ios", withValue: "true")
       }
          /*    let ac = UIAlertController(title: "Please Enter Code", message: nil, preferredStyle: UIAlertController.Style.alert)
                ac.addTextField { (textField : UITextField!) -> Void in
                       textField.placeholder = "Enter code"
                   }
                       let OKaction = UIAlertAction(title: "Verify", style: UIAlertAction.Style.default, handler: { action in
                            let entry=ac.textFields?.first
                  
                            let userCode = entry?.text
                                    print(userCode)
                            var ActualCode=""
                            Firestore.firestore().collection("AccessCode").document("Code").getDocument(){ querySnapshot, error in
                                print(querySnapshot)
                                    guard let snapshot = querySnapshot else {
                                        ac.message="Check your internet connection"
                                        return
                                    }
                               ActualCode = querySnapshot?.get("code") as! String
                                print("Actual Code",ActualCode)
                            }
            
                            if(ActualCode==userCode){
                                "1"
                                defaults.set(code, forKey: "Code")
                              
                             }
                            else{
                                ac.title="Incorrect Code"
                                ac.message="Please Enter a correct code"
                            }
                            
           })
                       //  ac.addAction(OKaction)
                        present(ac, animated: true, completion: nil)*/
            

    }

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.locationImage.image = locationImages[indexPath.row]
        cell.locationName.text = locationNames[indexPath.row]
        cell.locationDescription.text = locationDescription[indexPath.row]
        
        //This creates the shadows and modifies the cards a little bit
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        
        return cell
    }
    var valueToPass:String!
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
        //let currentCell = collectionView.cellForItem(at: indexpath) as! custom_class_cell
        //print(currentCell)
        let defaults = UserDefaults.standard
        switch indexPath.row {
            case 0:
            weekReference="Week1"
            case 1:
            weekReference="Week2"
            case 2:
            weekReference="Week3"
            case 3:
            weekReference="Week4"
            case 4:
            weekReference="Week5"
            case 5:
            weekReference="Week6"
            case 6:
            weekReference="Week7"
            case 7:
            weekReference="Week8"
            case 8:
            weekReference="Week9"
            case 9:
            weekReference="week"
        default:
            weekReference="none"
        }
        defaults.set(weekReference, forKey: "WeekReference")
        performSegue(withIdentifier: "show_week", sender: self)
            
        }
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if (segue.identifier=="show_week") {
                let tabCtrl: UITabBarController = segue.destination as! UITabBarController
                let destinationVC = tabCtrl.viewControllers![0] as! MenuViewController
               // let viewController = segue.destination as! MenuViewController
                destinationVC.passedReference = weekReference
               
                //viewController.receiveClassID = passID
                
                //  }
                
                //}
            }
          */
    }

   



