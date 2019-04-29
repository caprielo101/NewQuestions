//
//  ViewController.swift
//  NewQuestions
//
//  Created by Josiah Elisha on 26/04/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    let allQuestions = QuestionData()
    var questionNumber = 0
    var selectedAnswer = 0
    var points = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()
        // Do any additional setup after loading the view.
        view.backgroundColor = .lightGray
        questionLabel.textColor = .white
        setupButton()
        updateQuestion()
        updateUI()
        showButton()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func handlePrev(_ sender: UIButton) {
        if questionNumber != 0 {
            questionCounter.text = "Question \(questionNumber-1)/\(allQuestions.list.count)"
            questionNumber -= 1
            updateQuestion()
            
        }
    }
    
    @IBAction func handleNext(_ sender: UIButton) {
        questionCounter.text = "Question \(questionNumber+1)/\(allQuestions.list.count)"
        questionNumber += 1
        updateQuestion()
    }
    
    func showButton(){
        if questionNumber == 0 {
            prevButton.isHidden = true
            nextButton.isHidden = true
        }
//        else if questionNumber == allQuestions.list.count-1 {
//            nextButton.isHidden = true
//        }
        else {
            prevButton.isHidden = false
//            nextButton.isHidden = false
        }
    }
    func updateUI(){
        questionCounter.text = "Question \(questionNumber+1)/\(allQuestions.list.count)"
        progressView.setProgress(Float(questionNumber)/Float(allQuestions.list.count), animated: true)
    }
    
    func updateQuestion(){
        if questionNumber <= allQuestions.list.count-1{
            questionLabel.text = allQuestions.list[questionNumber].questionText
            Button1.setTitle(allQuestions.list[questionNumber].answerText[0], for: .normal)
            Button2.setTitle(allQuestions.list[questionNumber].answerText[1], for: .normal)
            Button3.setTitle(allQuestions.list[questionNumber].answerText[2], for: .normal)
            Button4.setTitle(allQuestions.list[questionNumber].answerText[3], for: .normal)
            updateUI()
        }else {
            points = calculatePoints()
            savePoint(points: points); performSegue(withIdentifier: "TestCompletionSegue", sender: self)
            
        }
        showButton()
    }
    
    func savePoint(points: Int) {
        var realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL)
        let test = Tests()
        test.score = points
        test.uuid = UUID().uuidString
        
        try! realm.write {
            realm.add(test)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondViewController = segue.destination as! SecondViewController
        secondViewController.points = Double(points)
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            allQuestions.list[questionNumber].selectedAnswer = sender.tag
            debugPrint(allQuestions.list[questionNumber].selectedAnswer!, questionNumber)
            
        case 1:
            allQuestions.list[questionNumber].selectedAnswer = sender.tag
            debugPrint(allQuestions.list[questionNumber].selectedAnswer!, questionNumber)
            
        case 2:
            allQuestions.list[questionNumber].selectedAnswer = sender.tag
            debugPrint(allQuestions.list[questionNumber].selectedAnswer!, questionNumber)
        case 3:
            allQuestions.list[questionNumber].selectedAnswer = sender.tag
            debugPrint(allQuestions.list[questionNumber].selectedAnswer!, questionNumber)
        default:
            allQuestions.list[questionNumber].selectedAnswer = sender.tag
        }
        
        questionNumber += 1
        updateQuestion()
    }
    
    func calculatePoints() -> Int {
        var points = 0
        for i in 0..<allQuestions.list.count {
            if let answer = allQuestions.list[i].selectedAnswer {
                points += answer
//                debugPrint(answer)
            }
        }
//        debugPrint(points)
        return points
    }
    
    func setupButton(){
        for button in buttons {
            button.layer.cornerRadius = 10
        }
        
    }
}

