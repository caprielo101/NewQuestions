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
        
        //click anywhere to dismiss keyboard
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector("endEditing:")))
        setNeedsStatusBarAppearanceUpdate()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        NameTextField.addBottomBorder()
        NameTextField.contentVerticalAlignment = .center;
        NameTextField.textAlignment = .center;
        setupButton()
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func submitAction(_ sender: UIButton) {

        if let nameText = NameTextField.text, !nameText.isEmpty {
            name = nameText
            performSegue(withIdentifier: "SubmitName", sender: self)
        }
        let alertController = UIAlertController(title: "Name is required", message:
            "Hello there! Please tell me your name :)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! Intro2ViewController
        
        nextVC.name = name
    }
    
    fileprivate func setupButton(){
        submitButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        submitButton.layer.cornerRadius = 20
        submitButton.layer.borderWidth = 0.5
        submitButton.layer.backgroundColor = nil
        submitButton.setTitleColor(.white, for: .normal)
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

func textFieldShouldReturn(textField: UITextField) -> Bool {
    
    textField.resignFirstResponder()
    //or
    //self.view.endEditing(true)
    return true
}

extension UITextField {
    
    func addBottomBorder(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect.init(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor.white.cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
    }
}
