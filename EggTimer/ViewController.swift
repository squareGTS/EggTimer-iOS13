//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    /*
     let softTime = 5
     let mediumTime = 7
     let hardTime = 12
     */
    
    var player: AVAudioPlayer!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var timer = Timer()
    
    @IBOutlet weak var outletSelected: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        /*
         //print(sender.currentTitle)
         let hardness = sender.currentTitle
         
         if hardness == "Soft"{
         print(softTime)
         } else if hardness == "Medium" {
         print(mediumTime)
         } else {
         print(hardTime)
         }*/
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        outletSelected.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
    
    func playSound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
           
        } else {
            timer.invalidate()
            outletSelected.text = "done"
            playSound()
        }
        
    }
}


