//
//  Staff.swift
//  CampNavigateIOS
//
//  Created by Samuel Ford on 4/11/20.
//  Copyright © 2020 Camp Navigate. All rights reserved.
//

import UIKit
class StaffCell: UICollectionViewCell{
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var biography: UITextView!
    @IBOutlet weak var contactInfo: UILabel!
    
}
class Staff: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var pictures=[UIImage(named: "Eleanor"),UIImage(named: "katelyn"),UIImage(named: "suzy")]
    var position=["Eleanor Ramseier – Camp Navigate Director","Katelyn Ellinger – Program Director","Suzy Spears – Administration Coordinator"]
    var contactInfo=["Contact Information","Contact Information","Contact Information"]
    var biography=["Eleanor has been serving youth in the Wabash Valley for 27+ years. She began volunteering as a youth worker alongside her husband in 1990. In the most recent past, as Executive Director of the local YMCA, she helped develop and oversee the youth activities as well as the summer camps. She is the mother of three awesome adult children. She has always had a desire to encourage youth to find their passion, set goals and be strong in their faith! With Camp Navigate she can now combine these passions with another aspiration she has– developing youth to succeed in our community’s workforce! She loves spending time with family and friends, running, hiking, and anything adventurous.", "We are so blessed to have Katelyn as a part of our Camp Navigate Team!  In Katelyn’s words, “I was born to put my whole heart into our youth. My day is filled with LOVE from littles, they teach me so much!” Katelyn starts her day at Fuqua Elementary as a Special Education Assistant and continues it at Camp Navigate’s After-School Care as the Program Director! During the summer she will assist in designing and Co-Directing our programs at camp. She has two years completed at Indiana State University in Elementary Education and plans to further her education with the end goal being a kindergarten teacher. Some of her favorite days are spent with friends, her fur babies and being outdoors in the sunshine!","Suzy grew up in the north suburbs of Chicago. She attended Indiana State University and graduated with an Elementary Education Degree. It is there she met her husband and continued on to have two daughters (14 and 17). She pursued different career paths including teaching special needs students, banking, and now administrative work. She truly enjoys combining all her skills into her new position at Camp Navigate.  She loves the challenge of learning new tasks as well as acquiring new bookkeeping certifications for her current duties. She is very involved in her church and different ministries. One of the things she has a passion for is fostering. Her family has fostered for 7 years and has had a total of 15 kids. She also loves the Chicago Cubs, time with friends and family, taking the dogs for walks, and enjoying the outdoors."]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 3
       }
       
       
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "staff", for: indexPath) as! StaffCell
           
           cell.picture.image = pictures[indexPath.row]
           cell.position.text = position[indexPath.row]
        cell.biography.text = biography[indexPath.row]
        cell.contactInfo.text=contactInfo[indexPath.row]
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
