//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var event1Data : Event!
    var event2Data : Event!
    var event3Data : Event!
    var event4Data : Event!
    
    var yearEvent1 : Int = 0
    var yearEvent2 : Int = 0
    var yearEvent3 : Int = 0
    var yearEvent4 : Int = 0
    
    var roundPassed : Int = 0
    var correctRounds : Int = 0
    
    var storedDataEvent1 : String = ""
    var storedDataEvent2 : String = ""
    var storedDataEvent3 : String = ""
    var storedDataEvent4 : String = ""

    var gameTimer = Timer()
    var gameTimeLeft : Int = 60
    
    @IBOutlet weak var event1: UILabel!
    @IBOutlet weak var event2: UILabel!
    @IBOutlet weak var event3: UILabel!
    @IBOutlet weak var event4: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var shakeLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var myScoreLabel: UILabel!
    @IBOutlet var playAgainButton: UIButton!
    
    
    @IBOutlet weak var downFullButton: UIButton!
    
    @IBOutlet weak var halfUpButton: UIButton!
    @IBOutlet weak var halfDownButton: UIButton!
    
    @IBOutlet weak var halfUpButton1: UIButton!
    @IBOutlet weak var downHalfButton1: UIButton!
    
    @IBOutlet weak var upFullButton: UIButton!
  
    @IBOutlet var correctWrongAnswer: UIButton!
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        displayEvents()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayEvents() {                                                ///DISPLAY EVENTS
        
        gameTimeLeft = 60
        timerLabel.text = "0:\(String(gameTimeLeft))"
        shakeLabel.text = "Shake to complete"
        
        event1.isHidden = false
        event2.isHidden = false
        event3.isHidden = false
        event4.isHidden = false
        downFullButton.isHidden = false
        halfUpButton.isHidden = false
        halfDownButton.isHidden = false
        halfUpButton1.isHidden = false
        downHalfButton1.isHidden = false
        upFullButton.isHidden = false
        timerLabel.isHidden = false
        shakeLabel.isHidden = false
        correctWrongAnswer.isHidden = false
        
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)

        scoreLabel.isHidden = true
        myScoreLabel.isHidden = true
        playAgainButton.isHidden = true
        correctWrongAnswer.isHidden = true
        
        event1Data = getRandomEventsData()                                 //SETTING RANDOM EVENTS AND LABELS
        event2Data = getRandomEventsData()
        event3Data = getRandomEventsData()
        event4Data = getRandomEventsData()
        
        while (event1Data.name.contains(event2Data.name) || event1Data.name.contains(event3Data.name) || event1Data.name.contains(event4Data.name)) || (event2Data.name.contains(event1Data.name) || event2Data.name.contains(event3Data.name) || event2Data.name.contains(event4Data.name)) || (event3Data.name.contains(event1Data.name) || event3Data.name.contains(event2Data.name) || event3Data.name.contains(event4Data.name) || event4Data.name.contains(event1Data.name) || event4Data.name.contains(event2Data.name) || event4Data.name.contains(event3Data.name)){
            
            event1Data = getRandomEventsData()
            event2Data = getRandomEventsData()
            event3Data = getRandomEventsData()
            event4Data = getRandomEventsData()
            
        }
        
        event1.text = event1Data.name
        event2.text = event2Data.name
        event3.text = event3Data.name
        event4.text = event4Data.name
        
    }
    
    func updateTimer() {                                                    ///TIMER UPDATE
        
        gameTimeLeft -= 1
        timerLabel.text = "0:\(String(gameTimeLeft))"
        
        if gameTimeLeft == 0 {
            
            gameTimer.invalidate()
            checkCorrectEventOrder()
        }
        
    }
   
 
    @IBAction func eventControl(_ sender: UIButton) {                       ///RE-ORDER EVENTS
        
        switch sender {
        
        case downFullButton:
            downFullButton.setImage(#imageLiteral(resourceName: "down_full_selected"), for: .highlighted)
            
            storedDataEvent1 = event1.text!                ///FORCE UNWRAPPED OPTIONAL BECAUSE DATA IN THIS APP IS ALWAYS AVAILABLE
            storedDataEvent2 = event2.text!
            event1.text = storedDataEvent2
            event2.text = storedDataEvent1
            
        case halfUpButton:
            halfUpButton.setImage(#imageLiteral(resourceName: "up_half_selected"), for: .highlighted)
            
            storedDataEvent1 = event1.text!
            storedDataEvent2 = event2.text!
            event1.text = storedDataEvent2
            event2.text = storedDataEvent1
            
        case halfDownButton:
            halfDownButton.setImage(#imageLiteral(resourceName: "down_half_selected"), for: .highlighted)
        
            storedDataEvent2 = event2.text!
            storedDataEvent3 = event3.text!
            event2.text = storedDataEvent3
            event3.text = storedDataEvent2
            
        case halfUpButton1:
            halfUpButton1.setImage(#imageLiteral(resourceName: "up_half_selected"), for: .highlighted)
            
            storedDataEvent2 = event2.text!
            storedDataEvent3 = event3.text!
            event2.text = storedDataEvent3
            event3.text = storedDataEvent2
            
        case downHalfButton1:
            downHalfButton1.setImage(#imageLiteral(resourceName: "down_half_selected"), for: .highlighted)
            
            storedDataEvent3 = event3.text!
            storedDataEvent4 = event4.text!
            event3.text = storedDataEvent4
            event4.text = storedDataEvent3
            
        case upFullButton:
            upFullButton.setImage(#imageLiteral(resourceName: "up_full_selected"), for: .highlighted)
            
            storedDataEvent3 = event3.text!
            storedDataEvent4 = event4.text!
            event3.text = storedDataEvent4
            event4.text = storedDataEvent3
            
        default: break
       
        }
    }

                                                                                ///CHECK CORRECT EVENT ORDER
    func checkCorrectEventOrder() {
        
        for eventCheck1 in events {
            
            if eventCheck1.name == event1.text! {
                
                yearEvent1 = eventCheck1.year
            }
        }
        
        for eventCheck2 in events {
            
            if eventCheck2.name == event2.text! {
            
            yearEvent2 = eventCheck2.year
            
            }
        }
        
        for eventCheck3 in events {
            
            if eventCheck3.name == event3.text! {
                
                yearEvent3 = eventCheck3.year
            
            }
        }
        
        for eventCheck4 in events {
            
            if eventCheck4.name == event4.text {
                
                yearEvent4 = eventCheck4.year
            }
        }
    
        if yearEvent4 < yearEvent3 && yearEvent2 < yearEvent1 {
            
            shakeLabel.text = "Tap events to learn more"
            correctRounds += 1
            correctWrongAnswer.isHidden = false
            correctWrongAnswer.setBackgroundImage(#imageLiteral(resourceName: "next round_succes"), for: .normal)
            
            event1Tap()
            event2Tap()
            event3Tap()
            event4Tap()
            
        }else{
            
            shakeLabel.text = "Tap events to learn more"
            correctWrongAnswer.isHidden = false
            correctWrongAnswer.setBackgroundImage(#imageLiteral(resourceName: "next round_fail"), for: .normal)
            
            event1Tap()
            event2Tap()
            event3Tap()
            event4Tap()
            
           
        }
    }
    
                                                                                ///SHAKE METHOD TO CHECK CORRECTNESS
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if roundPassed == 5 {
            
            loadFinalScore(seconds: 2)
        }
        
        checkCorrectEventOrder()
        gameTimer.invalidate()
        gameTimeLeft = 60
        timerLabel.text = "0:\(String(gameTimeLeft))"
        
    }
    
                                                                                   ///DISPLAY NEW ROUND
    @IBAction func nextRound() {

        roundPassed += 1
        displayEvents()
    }
    
                                                                                    ///DISPLAY FINAL SCORE
    
    func finalScore() {
    
        gameTimer.invalidate()
        gameTimeLeft = 60
        timerLabel.text = "0:\(String(gameTimeLeft))"
        
        scoreLabel.isHidden = false
        myScoreLabel.isHidden = false
        playAgainButton.isHidden = false
        
        event1.isHidden = true
        event2.isHidden = true
        event3.isHidden = true
        event4.isHidden = true
        downFullButton.isHidden = true
        halfUpButton.isHidden = true
        halfDownButton.isHidden = true
        halfUpButton1.isHidden = true
        downHalfButton1.isHidden = true
        upFullButton.isHidden = true
        timerLabel.isHidden = true
        shakeLabel.isHidden = true
        correctWrongAnswer.isHidden = true
        
        scoreLabel.text = "\(correctRounds)/\(roundPassed) "
    }
    
                                                                                      ///SETTING PLAYAGAIN BUTTON
    
    @IBAction func playAgain() {
        
        roundPassed = 0
        correctRounds = 0
        displayEvents()
        
    }
    

    func event1Tap() {                                                                 ///EVENT TAPS METHOD
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.loadWebView))
        event1.isUserInteractionEnabled = true
        event1.addGestureRecognizer(tapGesture)
    }
    
    func event2Tap() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.loadWebView))
        event2.isUserInteractionEnabled = true
        event2.addGestureRecognizer(tapGesture)
    }
    
    func event3Tap() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.loadWebView))
        event3.isUserInteractionEnabled = true
        event3.addGestureRecognizer(tapGesture)
    }
    
    func event4Tap() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.loadWebView))
        event4.isUserInteractionEnabled = true
        event4.addGestureRecognizer(tapGesture)
    }

    
                                                                                         ///SWITCH TO CHILDVIEW
    
    func loadWebView() {
    
        //
    }
    

    
                                                                                          ///HELPER METHOD
    func loadFinalScore(seconds: Int) {
        
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        //display score page
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            
            self.finalScore()
        }
        
    }
   
}















