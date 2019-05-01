//
//  SecondViewController.swift
//  NewQuestions
//
//  Created by Josiah Elisha on 26/04/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit
import RealmSwift

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
        testResult.append(Result(result: "No to Minimal Depression", suggestions: """
            Your score suggests minimal or no symptoms of depression.
            If you feel emotionally down, you can take our simple challenges to help elevate your mood.
            """))
        testResult.append(Result(result: "Mild Depression", suggestions: """
            Your score suggests that you might be suffering from mild depression. Consider making an appointment to see a mental health professional if necessary.
            
            In the mean time, this app provides simple challenges to minimize your depression level. We suggest you take the first challenge to help elevate your mood.
            """))
        testResult.append(Result(result: "Moderate Depression", suggestions: """
            Your score suggests that you might be suffering from moderate depression. You should make an appointment to see a mental health professional as soon as possible.

            In the mean time, this app provides simple challenges to minimize your depression level. We suggest you take the first challenge to help elevate your mood.
            """))
        testResult.append(Result(result: "Moderately Severe Depression", suggestions: """
            Your score suggests that you might be suffering from moderately severe depression. You should make an appointment to see a mental health professional as soon as possible.

            In the mean time, this app provides simple challenges to minimize your depression level. We suggest you take the first challenge to help elevate your mood.
            """))
        testResult.append(Result(result: "Severe Depression", suggestions: """
            Your score suggests that you might be suffering from severe depression. It would be beneficial for you to consult a mental health professional immediately.

            In the mean time, this app provides simple challenges to minimize your depression level. We suggest you take the first challenge to help elevate your mood.
            """))
    }
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    @IBOutlet weak var suggestionLabel: UILabel!
    
    @IBOutlet weak var NextButton: UIButton!
    
    @IBOutlet weak var RetestButton: UIButton!
    
    var points:Double = 0
    var startValue:Double = 0
    
    let animationDuration:Double = 2
    
    let animationStartDate = Date()
    
    let result = ResultData()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        points = Double(realm.objects(Tests.self).last!.score)

        debugPrint(points)
        // Do any additional setup after loading the view.
        setupButton()
        defineResult(points: points)
        
        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        displayLink.add(to: .main, forMode: .default)
        
    }
    
    @IBAction func retestButton(_ sender: UIButton) {
        performSegue(withIdentifier: "GoToTest", sender: self)
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
    
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let nextVC = segue.destination as! BottomSheetController
        
        // VC points segue (points is Double type)
        //nextVC.points = Int(points)
        
    //}
    
    func setupButton(){
        NextButton.layer.borderWidth = 0.5
        NextButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        NextButton.layer.cornerRadius = 20
        
        RetestButton.layer.borderWidth = 0.5
        RetestButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        RetestButton.layer.cornerRadius = 20
    }
    
    @objc func handleUpdate(){
        let now = Date()
        let elapsedTime = now.timeIntervalSince(animationStartDate)
        
        let percentageProgress: Double! = Double(points)/27.0*100
        if elapsedTime > animationDuration {
            self.pointsLabel.text = String(format:"%.0f",percentageProgress) + "%"
        } else {
            let percentage = elapsedTime / animationDuration
            let value = startValue + (percentage * (percentageProgress - startValue))
            self.pointsLabel.text = String(format:"%.0f",value) + "%"
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
