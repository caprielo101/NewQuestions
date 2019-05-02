//
//  BottomSheetController.swift
//  RealmDemo
//
//  Created by Indra Sumawi on 27/04/19.
//  Copyright © 2019 Indra Sumawi. All rights reserved.
//

import UIKit
import UICircularProgressRing
import RealmSwift
import Charts

class BottomSheetController: UIViewController, challengeStart {
    func didPressButton(value: Bool) {
        print(value)
        performSegue(withIdentifier: "GoToBreathing", sender: self)
    }
    
    @IBOutlet weak var moodChart: LineChartView!
    
    @IBOutlet weak var testCategoryLabel: UILabel!
    @IBOutlet weak var testPercentageLabel: UILabel!
    @IBOutlet weak var testLastTakenLabel: UILabel!

    enum CardState {
        case expanded
        case collapsed
    }
    
    var bottomSheetView: BottomSheetView!
    //var visualEffectView: UIVisualEffectView!
    
    var cardHeight: CGFloat = 600
    let cardHandleAreaHeight: CGFloat = 140
    
    var cardVisible = false
    var nextState: CardState {
        return cardVisible ? .collapsed : .expanded
    }
    
    var runningAnimations = [UIViewPropertyAnimator]()
    var animationProgressWhenInterrupted: CGFloat = 0
    let result = ResultData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        let test = realm.objects(Tests.self).last
        //set test label
        defineResult(points: Double(test!.score))
        testPercentageLabel.text = String(format: "%.0f", Double(Double(test!.score) / 27.0 * 100).rounded()) + "%"
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        testLastTakenLabel.text = "Last taken: \(formatter.string(from: test!.timestamp))"
        
        let maximumScore = 27.0
        let percentage = Double(test!.score) / maximumScore * 100
        print("SCORE: \(percentage)")
        
        setupCard()
        
    }
    
    func defineResult(points: Double) {
        switch points {
        case 0...4:
            testCategoryLabel.text = result.testResult[0].resultText
        case 5...9:
            testCategoryLabel.text = result.testResult[1].resultText
        case 10...14:
            testCategoryLabel.text = result.testResult[2].resultText
        case 15...19:
            testCategoryLabel.text = result.testResult[3].resultText
        case 20...27:
            testCategoryLabel.text = result.testResult[4].resultText
        default:
            return
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupMoodChart()
    }
    
    func setupMoodChart() {
        /*let todayStart = Calendar.current.startOfDay(for: Date())
        let todayEnd: Date = {
            let components = DateComponents(day: 1, second: -1)
            return Calendar.current.date(byAdding: components, to: todayStart)!
        }()
        */
        let realm = try! Realm()
        let moods = realm.objects(Feedbacks.self)//.filter("timestamp BETWEEN %@", [todayStart, todayEnd])
        
        var moodChartEntry = [ChartDataEntry]()

        var counter: Double = 0
        
        if moods.count == 0 {
            print("no data")
            
        }
        
        //initial data
        let value = ChartDataEntry(x: counter, y: 0)
        moodChartEntry.append(value)

        for mood in moods {
            counter += 1
            let value = ChartDataEntry(x: counter, y: Double(mood.score))
            moodChartEntry.append(value)
        }
        
        let line = LineChartDataSet(entries: moodChartEntry, label: "Mood")
        line.colors = [NSUIColor.white]
        
        let data = LineChartData()
        data.addDataSet(line)
        data.setValueTextColor(NSUIColor.white)
        moodChart.data = data
        moodChart.tintColor = UIColor.white
        moodChart.gridBackgroundColor = NSUIColor.white
        moodChart.chartDescription?.text = "Your Mood Graph"
        moodChart.dragEnabled = false
        moodChart.pinchZoomEnabled = false
        moodChart.scaleXEnabled = false
        moodChart.scaleYEnabled = false
        
    }
    
    
    @IBAction func testViewButton(_ sender: Any) {
        performSegue(withIdentifier: "GoToTestResult", sender: self)
    }
    
    
    @IBAction func challengeViewButton(_ sender: Any) {
        //performSegue(withIdentifier: "GoToAllChallenges", sender: self)
    }
    
    @IBAction func testResultButton(_ sender: Any) {
        print("go to test result")
    }
    
    @IBAction func testButton(_ sender: Any) {
        
        print("retest")
    }
    
    @IBAction func deleteAll(_ sender: Any) {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
        performSegue(withIdentifier: "ShowIntro", sender: self)
    }
    
    func setupCard() {
        cardHeight = self.view.bounds.height - 100
        
       /*
        somehow cannot interact with button if this enable
        visualEffectView = UIVisualEffectView()
        visualEffectView.frame = self.view.frame
        self.view.addSubview(visualEffectView)
        */
        bottomSheetView = BottomSheetView(nibName: "BottomSheetView", bundle: nil)
        bottomSheetView.challengeID = 1
        self.addChild(bottomSheetView)
        self.view.addSubview(bottomSheetView.view)
        bottomSheetView.delegate = self //IMPORTANT FOR DELEGATE
        
        bottomSheetView.view.frame = CGRect(x: 0, y: self.view.frame.height-cardHandleAreaHeight, width: self.view.bounds.width, height: cardHeight)
        
        bottomSheetView.view.clipsToBounds = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(BottomSheetController.handleCardTap(recognizer:))) //action only possible on objective C
    
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(BottomSheetController.handleCardPan(recognizer:)))
        
        bottomSheetView.handleArea.addGestureRecognizer(tapGestureRecognizer)
        bottomSheetView.handleArea.addGestureRecognizer(panGestureRecognizer)
        
    }
    
    @objc
    func handleCardTap(recognizer: UITapGestureRecognizer) {
        switch recognizer.state {
        case .ended:
            animateTransitionIfNeeded(state: nextState, duration: 0.9)
        default:
            break
        }
    }
    
    @objc
    func handleCardPan(recognizer: UIPanGestureRecognizer) {
        
        switch recognizer.state {
        case .began:
            //start transition
            startInteractiveTransition(state: nextState, duration: 0.9)
        case .changed:
            //update transition
            let translation = recognizer.translation(in: self.bottomSheetView.handleArea)
            var fractionComplete = translation.y / cardHeight
            fractionComplete = cardVisible ? fractionComplete : -fractionComplete
            
            updateInteractiveTransition(fractionCompleted: fractionComplete)
        case .ended:
            //continue transition
            continueInteractiveTransition()
        default:
            break
        }
    }
    
    func animateTransitionIfNeeded (state: CardState, duration: TimeInterval) {
        if runningAnimations.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    self.bottomSheetView.view.frame.origin.y = self.view.frame.height - self.cardHeight
                case .collapsed:
                    self.bottomSheetView.view.frame.origin.y = self.view.frame.height - self.cardHandleAreaHeight
                }
            }
            
            frameAnimator.addCompletion { _ in
                self.cardVisible = !self.cardVisible
                self.runningAnimations.removeAll()
            }
            
            frameAnimator.startAnimation()
            runningAnimations.append(frameAnimator)
        }
    }
    
    func startInteractiveTransition (state: CardState, duration: TimeInterval) {
        if runningAnimations.isEmpty {
            //run animation
            animateTransitionIfNeeded(state: state, duration: duration)
        }
        for animatior in runningAnimations {
            animatior.pauseAnimation()
            animationProgressWhenInterrupted = animatior.fractionComplete
        }
    }
    
    func updateInteractiveTransition (fractionCompleted: CGFloat) {
        for animator in runningAnimations {
            animator.fractionComplete = fractionCompleted + animationProgressWhenInterrupted
        }
    }
    
    func continueInteractiveTransition () {
        for animator in runningAnimations {
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
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
