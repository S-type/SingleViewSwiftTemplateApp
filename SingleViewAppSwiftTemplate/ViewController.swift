//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var event1Data : String = ""
    var event2Data : String = ""
    var event3Data : String = ""
    var event4Data : String = ""
    var roundPassed : Int = 0
    var correctRounds : Int = 0
    
    
    @IBOutlet weak var event1: UILabel!
    @IBOutlet weak var event2: UILabel!
    @IBOutlet weak var event3: UILabel!
    @IBOutlet weak var event4: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var myScoreLabel: UILabel!
    @IBOutlet weak var playAgainLabel: UIButton!
    
    @IBOutlet weak var downFullButton: UIButton!
    
    @IBOutlet weak var halfUpButton: UIButton!
    @IBOutlet weak var halfDownButton: UIButton!
    
    @IBOutlet weak var halfUpButton1: UIButton!
    @IBOutlet weak var downHalfButton1: UIButton!
    
    @IBOutlet weak var upFullButton: UIButton!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayEvents()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayEvents() {                                                //if game is finished display final score
        
        scoreLabel.isHidden = true
        myScoreLabel.isHidden = true
        playAgainLabel.isHidden = true
        
        roundPassed += 1
        
        if roundPassed == 6 {
            
            finalScore()
        }
        
        event1Data = getRandomEventsData().name                           //setting random events and labels
        event2Data = getRandomEventsData().name
        event3Data = getRandomEventsData().name
        event4Data = getRandomEventsData().name
        
        while (event1Data.contains(event2Data) || event1Data.contains(event3Data) || event1Data.contains(event4Data)) || (event2Data.contains(event1Data) || event2Data.contains(event3Data) || event2Data.contains(event4Data)) || (event3Data.contains(event1Data) || event3Data.contains(event2Data) || event3Data.contains(event4Data) || event4Data.contains(event1Data) || event4Data.contains(event2Data) || event4Data.contains(event3Data)){
            
            event1Data = getRandomEventsData().name
            event2Data = getRandomEventsData().name
            event3Data = getRandomEventsData().name
            event4Data = getRandomEventsData().name
            
        }
        
        event1.text = event1Data
        event2.text = event2Data
        event3.text = event3Data
        event4.text = event4Data
        
    }
   
 
    
    
    @IBAction func eventControl(_ sender: UIButton) {
        
        if sender === downFullButton || sender === halfUpButton || sender === halfDownButton || sender === halfUpButton1 || sender === downHalfButton1 || sender === upFullButton {
            
            downFullButton.setImage(#imageLiteral(resourceName: "down_full_selected"), for: .normal)
            
            halfUpButton.setImage(#imageLiteral(resourceName: "up_half_selected"), for: .normal)
            halfDownButton.setImage(#imageLiteral(resourceName: "down_half_selected"), for: .normal)
            
            halfUpButton1.setImage(#imageLiteral(resourceName: "up_half_selected"), for: .normal)
            downHalfButton1.setImage(#imageLiteral(resourceName: "down_half_selected"), for: .normal)
            
            upFullButton.setImage(#imageLiteral(resourceName: "up_full_selected"), for: .normal)
            
            
        }
    }
    
    
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
                                                                           //displaying finalScore page
    
    func finalScore() {
        scoreLabel.text = "\(correctRounds)/\(roundPassed) "
    }
    
                                                                           //setting playButton
    @IBAction func playAgainButton() {
        displayEvents()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}












