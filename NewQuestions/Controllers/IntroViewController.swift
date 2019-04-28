//
//  IntroViewController.swift
//  NewQuestions
//
//  Created by Josiah Elisha on 27/04/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    
    @IBOutlet weak var NameTextField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func submitAction(_ sender: UIButton) {
        if let nameval = NameTextField.text {
            name = nameval
        }
        performSegue(withIdentifier: "SubmitName", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! FirstPageViewController
        
        nextVC.name = name
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
