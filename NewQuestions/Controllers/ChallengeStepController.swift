//
//  ChallengeStepController.swift
//  NewQuestions
//
//  Created by Indra Sumawi on 29/04/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

class ChallengeStepController: UIViewController {

    @IBOutlet weak var StartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancelAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupButton() {
        StartButton.layer.cornerRadius = 20
        StartButton.layer.borderWidth = 0.5
        StartButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}
