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
    
    var correctURLEventData : String = ""
    
    @IBOutlet var event1: UIButton!
    @IBOutlet var event2: UIButton!
    @IBOutlet var event3: UIButton!
    @IBOutlet var event4: UIButton!
    
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
        
        roundPassed += 1
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
        
        event1.setTitle("\(event1Data.name)", for: .normal)
        event2.setTitle("\(event2Data.name)", for: .normal)
        event3.setTitle("\(event3Data.name)", for: .normal)
        event4.setTitle("\(event4Data.name)", for: .normal)
        
        event1.titleLabel!.numberOfLines = 2
        event2.titleLabel!.numberOfLines = 2
        event3.titleLabel!.numberOfLines = 2
        event4.titleLabel!.numberOfLines = 2
        
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
        
        event1.titleLabel!.numberOfLines = 2
        event2.titleLabel!.numberOfLines = 2
        event3.titleLabel!.numberOfLines = 2
        event4.titleLabel!.numberOfLines = 2
        
        switch sender {
        
        case downFullButton:
            downFullButton.setImage(#imageLiteral(resourceName: "down_full_selected"), for: .highlighted)
            
            storedDataEvent1 = event1.titleLabel!.text!      ///FORCE UNWRAPPED OPTIONAL BECAUSE DATA IN THIS APP IS ALWAYS AVAILABLE
            storedDataEvent2 = event2.titleLabel!.text!
            event1.setTitle("\(storedDataEvent2)", for: .normal)
            event2.setTitle("\(storedDataEvent1)", for: .normal)
            
        case halfUpButton:
            halfUpButton.setImage(#imageLiteral(resourceName: "up_half_selected"), for: .highlighted)
            
            storedDataEvent1 = event1.titleLabel!.text!
            storedDataEvent2 = event2.titleLabel!.text!
            event1.setTitle("\(storedDataEvent2)", for: .normal)
            event2.setTitle("\(storedDataEvent1)", for: .normal)
            
        case halfDownButton:
            halfDownButton.setImage(#imageLiteral(resourceName: "down_half_selected"), for: .highlighted)
        
            storedDataEvent2 = event2.titleLabel!.text!
            storedDataEvent3 = event3.titleLabel!.text!
            event2.setTitle("\(storedDataEvent3)", for: .normal)
            event3.setTitle("\(storedDataEvent2)", for: .normal)
            
        case halfUpButton1:
            halfUpButton1.setImage(#imageLiteral(resourceName: "up_half_selected"), for: .highlighted)
            
            storedDataEvent2 = event2.titleLabel!.text!
            storedDataEvent3 = event3.titleLabel!.text!
            event2.setTitle("\(storedDataEvent3)", for: .normal)
            event3.setTitle("\(storedDataEvent2)", for: .normal)
            
        case downHalfButton1:
            downHalfButton1.setImage(#imageLiteral(resourceName: "down_half_selected"), for: .highlighted)
            
            storedDataEvent3 = event3.titleLabel!.text!
            storedDataEvent4 = event4.titleLabel!.text!
            event3.setTitle("\(storedDataEvent4)", for: .normal)
            event4.setTitle("\(storedDataEvent3)", for: .normal)
            
        case upFullButton:
            upFullButton.setImage(#imageLiteral(resourceName: "up_full_selected"), for: .highlighted)
            
            storedDataEvent3 = event3.titleLabel!.text!
            storedDataEvent4 = event4.titleLabel!.text!
            event3.setTitle("\(storedDataEvent4)", for: .normal)
            event4.setTitle("\(storedDataEvent3)", for: .normal)
            
        default: break
       
        }
    }

                                                                                ///CHECK CORRECT EVENT ORDER
    func checkCorrectEventOrder() {
        
        for eventCheck1 in events {
            
            if eventCheck1.name == event1.titleLabel!.text! {
                
                yearEvent1 = eventCheck1.year
            }
        }
        
        for eventCheck2 in events {
            
            if eventCheck2.name == event2.titleLabel!.text! {
            
            yearEvent2 = eventCheck2.year
            
            }
        }
        
        for eventCheck3 in events {
            
            if eventCheck3.name == event3.titleLabel!.text! {
                
                yearEvent3 = eventCheck3.year
            
            }
        }
        
        for eventCheck4 in events {
            
            if eventCheck4.name == event4.titleLabel!.text! {
                
                yearEvent4 = eventCheck4.year
            }
        }
    
        if yearEvent4 < yearEvent3 && yearEvent2 < yearEvent1 {
            
            shakeLabel.text = "Tap events to learn more"
            correctRounds += 1
            correctWrongAnswer.isHidden = false
            correctWrongAnswer.setBackgroundImage(#imageLiteral(resourceName: "next round_succes"), for: .normal)
        
        }else{
            
            shakeLabel.text = "Tap events to learn more"
            correctWrongAnswer.isHidden = false
            correctWrongAnswer.setBackgroundImage(#imageLiteral(resourceName: "next round_fail"), for: .normal)

        }
    }
    
                                                                                   ///SHAKE METHOD TO CHECK CORRECTNESS
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        checkCorrectEventOrder()
        gameTimer.invalidate()
        gameTimeLeft = 60
        timerLabel.text = "0:\(String(gameTimeLeft))"
        
    }
    
                                                                                   ///DISPLAY NEW ROUND
    @IBAction func nextRound() {

        if roundPassed < 6 {
            
            displayEvents()
        
        }else{
            
            finalScore()
    }
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
    
    
                                                                                    ///TAPS EVENT FOR MORE AND FIND CORRECT URL
    @IBAction func eventTap1(_ sender: Any) {
        
        if shakeLabel.text == "Tap events to learn more"{
            
            for finalURLData in events {
                
                if finalURLData.name == event1.titleLabel!.text! {
                    
                    correctURLEventData = finalURLData.dataURL
                    
                }
            }
        
            performSegue(withIdentifier: "segue", sender: nil)
            
        }
    }
    
    @IBAction func eventTap2(_ sender: Any) {
        
        if shakeLabel.text == "Tap events to learn more"{
            
            for finalURLData in events {
                
                if finalURLData.name == event2.titleLabel!.text! {
                    
                    correctURLEventData = finalURLData.dataURL
                    
                }
            }
            
            performSegue(withIdentifier: "segue", sender: nil)
            
        }
    }
    
    
    @IBAction func eventTap3(_ sender: Any) {
        
        if shakeLabel.text == "Tap events to learn more"{
            
            for finalURLData in events {
                
                if finalURLData.name == event3.titleLabel!.text! {
                    
                    correctURLEventData = finalURLData.dataURL
                    
                }
            }
            
            performSegue(withIdentifier: "segue", sender: nil)
            
        }
    }
    
    @IBAction func eventTap4(_ sender: Any) {
        
        if shakeLabel.text == "Tap events to learn more"{
            
            for finalURLData in events {
                
                if finalURLData.name == event4.titleLabel!.text! {
                    
                    correctURLEventData = finalURLData.dataURL
                    
                }
            }
            
            performSegue(withIdentifier: "segue", sender: nil)
            
        }
    }
                                                                                           ///PREPARING SEGUE,MANAGE WITH SUBVIEW
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let webViewControllerI : WebViewControllerI = segue.destination as! WebViewControllerI
        webViewControllerI.webEventData = "\(correctURLEventData))"
        
        
    }
    
}

















