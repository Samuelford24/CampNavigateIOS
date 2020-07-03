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
    var pictures=[UIImage(named: "eleanorfinal"),UIImage(named: "katelyn"), UIImage(named: "marcela")]
    var position=["Eleanor Ramseier – Camp Navigate Director","Katelyn Ellinger – Program Director","Marcela Burbach - Bookkeeper"
]
    var contactInfo=[ "812-201-4862 eleanor@campnavigate.org","812-230-1759 Katelyn@campnavigate.org","marcela@campnavigate.org" ]
    var biography = [ "Eleanor has been serving youth in the Wabash Valley for 27+ years. She began volunteering as a youth worker alongside her husband in 1990. In the most recent past, as Executive Director of the local YMCA, she helped develop and oversee the youth activities as well as the summer camps. She is the mother of three awesome adult children. She has always had a desire to encourage youth to find their passion, set goals and be strong in their faith! With Camp Navigate she can now combine these passions with another aspiration she has– developing youth to succeed in our community’s workforce! She loves spending time with family and friends, running, hiking, and anything adventurous.", "We are so blessed to have Katelyn as a part of our Camp Navigate Team!  In Katelyn’s words, “I was born to put my whole heart into our youth. My day is filled with LOVE from littles, they teach me so much!” Katelyn starts her day at Fuqua Elementary as a Special Education Assistant and continues it at Camp Navigate’s After-School Care as the Program Director! During the summer she will assist in designing and Co-Directing our programs at camp. She has two years completed at Indiana State University in Elementary Education and plans to further her education with the end goal being a kindergarten teacher. Some of her favorite days are spent with friends, her fur babies and being outdoors in the sunshine!","Marcela was born in Colombia, South America, and graduated from Universidad del Rosario with a degree in Business Administration. She met her husband Jeff there, and they moved to California in 2013. They moved to Terre haute in 2015 to be closer to her husband's family in Indiana. She has fifteen years of experience attending international markets for the steel industry. She also has experience in the financial sector and is combining business, organizational skills, and knowledge into her new position at Camp Navigate. She is very passionate about helping others. She enjoys furthering her education and likes to take on new challenges. This is her first job for a nonprofit organization, which is very exciting for her. She is glad to have the opportunity to bring her knowledge and experience in this new position. She loves spending time with her husband and dog in the country, and with her nephews in Colombia. She eniovs dancing salsa and tropical music.What excites you about Camp Navigate? There is a lot of positive energy and dynamism in Camp Navigate, not only the kids but the team too. It is very motivating and inspiring. Helping the kids to discover and improve their skills is rewarding. We are preparing a new generation. I am so inspired to be working here that I want to become a Spanish Teacher for the summer. Learning another language will open a whole world of new opportunities for the kids."  ]
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
