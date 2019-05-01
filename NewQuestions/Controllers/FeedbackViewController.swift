//
//  FeedbackViewController.swift
//  NewQuestions
//
//  Created by Indra Sumawi on 29/04/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit
import RealmSwift

class FeedbackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitFeedback(_ sender: UIButton) {
        
        let realm = try! Realm()
        let feedback = Feedbacks()
        feedback.challenge_id = 1
        
        //find last challenge
        let lastFeedback = realm.objects(Feedbacks.self).filter("challenge_id == \(feedback.challenge_id)").last
        
        if lastFeedback == nil {
            feedback.challenge_no = 1
        }
        else {
            feedback.challenge_no = lastFeedback!.challenge_no+1
        }
        
        switch sender.tag {
        case 1:
            feedback.score = 2
        case 2:
            feedback.score = 1
        case 3:
            feedback.score = 0
        case 4:
            feedback.score = -1
        case 5:
            feedback.score = -2
        default:
            break;
        }
        
        try! realm.write {
            realm.add(feedback)
        }
        performSegue(withIdentifier: "GoToDashboard", sender: self)
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
