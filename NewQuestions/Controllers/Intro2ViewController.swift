//
//  Intro2ViewController.swift
//  NewQuestions
//
//  Created by Josiah Elisha on 28/04/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

class Intro2ViewController: UIViewController {

    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var introText: UILabel!
    @IBOutlet weak var goToQuizButton: UIButton!
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        setupText()
        
        setupButton()
        
    }
    
    
    @IBAction func quizButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "GoQuiz", sender: self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    fileprivate func setupText(){
        labelName.text = "Hi \(name),"
        introText.text = "This app will help you asses the severity of your depression, but it is not meant to be a replacement for a clinical diagnosis and professional treatment for your mental health. \n\nSimple challenges will be provided to elevate your mood and hopefully reduce your depression level."
    }
    
    fileprivate func setupButton(){
        goToQuizButton.layer.borderWidth = 0.5
        goToQuizButton.layer.cornerRadius = 20
        goToQuizButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        goToQuizButton.layer.backgroundColor = nil
        goToQuizButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
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
