//
//  BottomSheetView.swift
//  RealmDemo
//
//  Created by Indra Sumawi on 27/04/19.
//  Copyright © 2019 Indra Sumawi. All rights reserved.
//

import UIKit
import RealmSwift


protocol challengeStart {
    func didPressButton(value: Bool)
}

class BottomSheetView: UIViewController {
    
    var delegate:challengeStart!

    @IBOutlet var handleArea: UIView!
    @IBOutlet weak var challengeLabel: UILabel!
    var challengeID: Int = 0
    @IBOutlet weak var challengeDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        print("Challenge: \(challengeID)")
        
        let realm = try! Realm()
        
        let challenge1 = realm.objects(Challenges.self).filter("id == \(challengeID)").first
        challengeLabel.text = challenge1!.tiitle!
        challengeDescriptionLabel.text = challenge1!.desc!
    }
    
    
    @IBAction func challengeStart(_ sender: UIButton) {
        delegate.didPressButton(value: true)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}
