//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var hardnessTypes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    var timer = Timer()
    var timerCurrentCount = 0
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var softButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    @IBOutlet weak var eggStackView: UIStackView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var currentHardness = 10
    @IBAction func hardnessPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        currentHardness = hardnessTypes[hardness]!
        self.timer = Timer.scheduledTimer(timeInterval: 1,
                                          target: self,
                                          selector: #selector(handleTimerExecution),
                                          userInfo: nil,
                                          repeats: true)
        self.mainLabel.text = "Timer started for \(hardness)."
        self.softButton.isEnabled = false
        self.mediumButton.isEnabled = false
        self.hardButton.isEnabled = false
        self.eggStackView.layer.opacity = 0.5
        self.progressBar.progress = 0.0
    }
    
    @objc private func handleTimerExecution() {
        if self.timerCurrentCount == currentHardness {
            self.timer.invalidate() // invalidating timer
            print("timer done... \(self.timerCurrentCount)")
            self.timerCurrentCount = 0
            self.mainLabel.text = "Cooked!"
            self.softButton.isEnabled = true
            self.mediumButton.isEnabled = true
            self.hardButton.isEnabled = true
            self.eggStackView.layer.opacity = 1
            
            
        } else {
            print("timer executed... \(self.timerCurrentCount)")
            self.timerCurrentCount += 1
            self.progressBar.progress = Float(self.timerCurrentCount) / Float(self.currentHardness)
        }
    }
}
