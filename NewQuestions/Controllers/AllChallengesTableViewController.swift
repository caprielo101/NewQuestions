//
//  AllChallengesTableViewController.swift
//  NewQuestions
//
//  Created by Indra Sumawi on 29/04/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

struct Challenge {
    var title: String
    var background: String
    var enable: Bool = true
}

class ChallengeTableViewCell: UITableViewCell {
    @IBOutlet weak var challengeLabel: UILabel!
    @IBOutlet weak var challengeButton: UIButton!
    @IBOutlet weak var comingSoonLabel: UILabel!
}

class AllChallengesTableViewController: UITableViewController {

    @IBOutlet var tableVIew: UITableView!
    var challengeList: [Challenge] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVIew.backgroundView = UIImageView(image: UIImage(named: "Background Image App Blur"))
        challengeList.append(Challenge(title: "4-7-8 Breathing", background: "breathing", enable: true))
        challengeList.append(Challenge(title: "Meditation", background: "meditation", enable: false))
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
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "challengeCell", for: indexPath) as! ChallengeTableViewCell

        // Configure the cell...
        let challenge = challengeList[indexPath.row]
        cell.challengeLabel?.text = challenge.title
        print(challenge.background)

        cell.challengeButton.isEnabled = challenge.enable
        cell.comingSoonLabel.isHidden = challenge.enable
        cell.challengeButton.tag = indexPath.row
        cell.challengeButton.setBackgroundImage(UIImage(named: challenge.background), for: .normal)
        cell.challengeButton.addTarget(self, action: #selector(challengButtonTapped(_:)), for: .touchUpInside)

        return cell
    }
    
    @objc func challengButtonTapped(_ sender: UIButton) {
        if sender.tag == 0 {
            print("Breathing")
            performSegue(withIdentifier: "GoToBreathing", sender: self)
        }
        else if sender.tag == 1 {
            print("Meditation")
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
