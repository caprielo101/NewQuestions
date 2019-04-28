//
//  SecondViewController.swift
//  NewQuestions
//
//  Created by Josiah Elisha on 26/04/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

class Result {
    
    var resultText:String
    var suggestionText:String
    
    init(result: String, suggestions: String) {
        self.resultText = result
        self.suggestionText = suggestions
    }
}

class ResultData {
    var testResult = [Result]()
    
    init() {
        testResult.append(Result(result: "You have minimal to none depression", suggestions: "Monitor, may not require treatment"))
        testResult.append(Result(result: "You are mildly depressed", suggestions: "Use clinical judgment (symptom duration, functional impairment) to determine necessity of treatment"))
        testResult.append(Result(result: "You are moderately depressed", suggestions: "Use clinical judgment (symptom duration, functional impairment) to determine necessity of treatment"))
        testResult.append(Result(result: "You have moderately severe depression", suggestions: "Warrants active treatment with psychotherapy, medications, or combination"))
        testResult.append(Result(result: "You have severe depression", suggestions: "Warrants active treatment with psychotherapy, medications, or combination"))
    }
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    @IBOutlet weak var suggestionLabel: UILabel!
    
    @IBOutlet weak var NextButton: UIButton!
    
    var points:Double = 0
    var startValue:Double = 0
    
    let animationDuration:Double = 2
    
    let animationStartDate = Date()
    
    let result = ResultData()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint(points)
        // Do any additional setup after loading the view.
        setupButton()
        defineResult(points: points)
        
        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        displayLink.add(to: .main, forMode: .default)
        
    }
    
    func defineResult(points: Double) {
        switch points {
        case 0...4:
            resultDescriptionLabel.text = result.testResult[0].resultText
            suggestionLabel.text = result.testResult[0].suggestionText
        case 5...9:
            resultDescriptionLabel.text = result.testResult[1].resultText
            suggestionLabel.text = result.testResult[1].suggestionText
        case 10...14:
            resultDescriptionLabel.text = result.testResult[2].resultText
            suggestionLabel.text = result.testResult[2].suggestionText
        case 15...19:
            resultDescriptionLabel.text = result.testResult[3].resultText
            suggestionLabel.text = result.testResult[3].suggestionText
        case 20...27:
            resultDescriptionLabel.text = result.testResult[4].resultText
            suggestionLabel.text = result.testResult[4].suggestionText
        default:
            return
        }
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        //go to next VC and pass the data for circular progress view
        performSegue(withIdentifier: "goToHome", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! HomeViewController
        
        // VC points segue (points is Double type)
        nextVC.points = Int(points)
        
    }
    
    func setupButton(){
        NextButton.layer.borderWidth = 0.5
        NextButton.layer.borderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        NextButton.layer.cornerRadius = 30
    }
    
    @objc func handleUpdate(){
        let now = Date()
        let elapsedTime = now.timeIntervalSince(animationStartDate)
        
        if elapsedTime > animationDuration {
            self.pointsLabel.text = String(format:"%.0f/27",points)
        } else {
            let percentage = elapsedTime / animationDuration
            let value = startValue + (percentage * (points - startValue))
            self.pointsLabel.text = String(format:"%.0f/27",value)
        }
        
        
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
