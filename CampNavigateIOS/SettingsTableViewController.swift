//
//  SettingsTableViewController.swift
//  CampNavigateIOS
//
//  Created by Samuel Ford on 4/28/20.
//  Copyright © 2020 Camp Navigate. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
              let ac = UIAlertController(title: "Questions?", message: "Email developer@campnavigate.org", preferredStyle: UIAlertController.Style.alert)
                 
                  let NOaction = UIAlertAction(title:"No", style: UIAlertAction.Style.default, handler:{ action in
                      ac.dismiss(animated: false, completion: nil)               })
                  
                  
                  
                 
                  ac.addAction(NOaction)
                  present(ac, animated: true, completion: nil)
                  
                  
        case 1:
             let ac = UIAlertController(title: "Support?", message: "This will take you out of the app", preferredStyle: UIAlertController.Style.alert)
                  let OKaction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { action in
                      if let url = URL(string: "https://forms.gle/HcxZPUtWSJwQJpREA") {
                          UIApplication.shared.open(url, options: [:])
                      }
                  })
                  let NOaction = UIAlertAction(title:"No", style: UIAlertAction.Style.default, handler:{ action in
                      ac.dismiss(animated: false, completion: nil)               })
                  
                  
                  
                  ac.addAction(OKaction)
                  ac.addAction(NOaction)
                  present(ac, animated: true, completion: nil)
                  
                  
        case 2:
            let ac = UIAlertController(title: "View the privacy policy?", message: "This will take you out of the app", preferredStyle: UIAlertController.Style.alert)
                  let OKaction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { action in
                      if let url = URL(string: "https://forms.gle/LGBmwxFdp7ngTYfA9") {
                          UIApplication.shared.open(url, options: [:])
                      }
                  })
                  let NOaction = UIAlertAction(title:"No", style: UIAlertAction.Style.default, handler:{ action in
                      ac.dismiss(animated: false, completion: nil)               })
                  
                  
                  
                  ac.addAction(OKaction)
                  ac.addAction(NOaction)
                  present(ac, animated: true, completion: nil)
                  
                  
        case 3:
              let ac = UIAlertController(title: "View the terms and conditions?", message: "This will take you out of the app", preferredStyle: UIAlertController.Style.alert)
                  let OKaction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { action in
                      if let url = URL(string: "https://forms.gle/24DXn6pkrfRH67EL6") {
                          UIApplication.shared.open(url, options: [:])
                      }
                  })
                  let NOaction = UIAlertAction(title:"No", style: UIAlertAction.Style.default, handler:{ action in
                      ac.dismiss(animated: false, completion: nil)               })
                  
                  
                  
                  ac.addAction(OKaction)
                  ac.addAction(NOaction)
                  present(ac, animated: true, completion: nil)
     
        default:
            print("4")
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
