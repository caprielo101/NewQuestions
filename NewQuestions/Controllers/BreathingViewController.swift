//
//  BreathingViewController.swift
//  Challenge478Breathing
//
//  Created by Josiah Elisha on 29/04/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

class BreathingViewController: UIViewController {

    
    @IBOutlet weak var TimeCounterView: UIView!
    
    @IBOutlet weak var TimeCounterLabel: UILabel!
    
    @IBOutlet weak var ActLabel: UILabel!
    
    @IBOutlet weak var CounterLabel: UILabel!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var DoneButton: UIButton!
    
    var inhaleTime = 5
    var holdTime = 8
    var exhaleTime = 9
    
    var timer = Timer()
    
    //loopCount ambil dari VC sebelumnya, ditimpa aja dengan prepare for segue
    var loopCount = 2
    var setCounter = 1
    var tempLoop = 0
    
    var timerInterval = 0.2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4190502763, green: 0.414557457, blue: 0.4683071375, alpha: 1)
        tempLoop = loopCount
        CounterLabel.text = "\(setCounter) out of \(tempLoop) set(s)"
        setNeedsStatusBarAppearanceUpdate()
        setupTimeInSeconds()
        setupViewLayout()
        
        runBreatheTimer()
    }
    
    func runBreatheTimer() {
        timer = Timer.scheduledTimer(timeInterval: timerInterval, target: self, selector: #selector(breatheCountdown), userInfo: nil, repeats: true)
        ActLabel.text = "INHALE THROUGH YOUR NOSE NOW"
    }
    
    func runHoldTimer(){
        timer = Timer.scheduledTimer(timeInterval: timerInterval, target: self, selector: #selector(holdCountdown), userInfo: nil, repeats: true)
        ActLabel.text = "HOLD YOUR BREATH NOW"
    }
    
    func runExhaleTimer(){
        timer = Timer.scheduledTimer(timeInterval: timerInterval, target: self, selector: #selector(exhaleCountdown), userInfo: nil, repeats: true)
        ActLabel.text = "EXHALE SLOWLY THROUGH YOUR MOUTH"
    }
    
    @objc func breatheCountdown(){
        inhaleTime -= 1
        TimeCounterLabel.text = "\(inhaleTime)"
        if inhaleTime <= 0 {
            timer.invalidate()
            inhaleTime = 5
            runHoldTimer()
        }
    }
    
    @objc func holdCountdown(){
        holdTime -= 1
        TimeCounterLabel.text = "\(holdTime)"
        if holdTime <= 0 {
            timer.invalidate()
            holdTime = 8
            runExhaleTimer()        }
    }
    
    @objc func exhaleCountdown(){
        exhaleTime -= 1
        TimeCounterLabel.text = "\(exhaleTime)"

        if isTimerLooped(when: exhaleTime) && loopCount > 0{
            timer.invalidate()
            loopCount -= 1
            if setCounter < tempLoop {
                setCounter += 1
            } else {
                setCounter = tempLoop
            }
            CounterLabel.text = "\(setCounter) out of \(tempLoop) set(s)"
            debugPrint(loopCount, setCounter)
            runBreatheTimer()
            exhaleTime = 9
        }
        if loopCount <= 0 {
            timer.invalidate()
            //show button for segue calling and hide the sets counter labels
            showButtonAndHideCounterLabel()
            
            //changing the text of action label to nil (empty)
            ActLabel.text = nil
        }
    }
    
    func isTimerLooped(when exhaleTime: Int) -> Bool{
        if exhaleTime == 0 {
            return true
        }
        return false
    }
    
    @IBAction func challengeDoneAction(_ sender: Any) {
        performSegue(withIdentifier: "GoToFeedback", sender: self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupViewLayout(){
        TimeCounterView.layer.cornerRadius = TimeCounterView.frame.width/2
        TimeCounterView.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)

        DoneButton.layer.cornerRadius = 20
        DoneButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        DoneButton.layer.borderWidth = 0.5
        DoneButton.setTitleColor(.white, for: .normal)
        DoneButton.isHidden = true
        DoneButton.alpha = 0
        
        ActLabel.textColor = .white
        
        CounterLabel.textColor = .white
        CounterLabel.alpha = 1.0
        
        TimeCounterView.backgroundColor = .black
        TimeCounterView.alpha = 0.7
    }
    
    func showButtonAndHideCounterLabel() {
        self.DoneButton.isHidden = false
        
        UIView.animate(withDuration: 1, delay:  0.5, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.DoneButton.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
            self.CounterLabel.alpha = 0.0
        }, completion: {
            (finished: Bool) -> Void in
            self.CounterLabel.isHidden = true
            debugPrint("Am i hidden = \(self.CounterLabel.isHidden)")
        })
    }
    
    
    @IBAction func cancelAction(_ sender: UIButton) {
        timer.invalidate()
        self.dismiss(animated: true, completion: nil)
    }
    func setupTimeInSeconds() {
        inhaleTime = 5
        holdTime = 8
        exhaleTime = 9
    }
}
