//
//  ViewController.swift
//  PullsEye
//
//  Created by Yassmin Taha on 4/8/17.
//  Copyright © 2017 Yassmin Taha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 0
    var randomVal = 0
    var score = 0
    var roundNumber = 0
    @IBOutlet var slider : UISlider!
    @IBOutlet var randLabel : UILabel!
    @IBOutlet var scoreLabel : UILabel!
    @IBOutlet var roundNumberLabel : UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        StartNewRound();
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    @IBAction func hitMeClicked(){
        var msgTitle = ""
        var currentScore = 0
        if currentValue == randomVal{
            currentScore = 100
            msgTitle = "perfect!"
        }
        else if abs(currentValue - randomVal) < 5{
            currentScore = 50
            msgTitle = "You almost had it!"
        }
        else if abs(currentValue - randomVal) < 10{
            msgTitle = "Pretty good!"
        }
        else{
            msgTitle = "Not even close..."
        }
        score += currentScore

        scoreLabel.text = String(score)
        let msg = "You scored \(currentScore) points\n your value is \(currentValue) \n your target is \(randomVal)"
        ShowAlert(title : msgTitle,msg : msg,actionName : "OK")
        GenerateRandom()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        print("Slider value is \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startRound() {
        StartNewRound()
    }
    
    func ShowAlert(title : String, msg : String, actionName : String){
        let alert = UIAlertController(title : title , message : msg, preferredStyle : .alert)
        let action  = UIAlertAction(title: actionName, style: .default,handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func StartNewRound() {
        roundNumber += 1
        slider.value = 50
        score = 0
        currentValue = lroundf(slider.value)
        GenerateRandom()
        roundNumberLabel.text = String(roundNumber)
        scoreLabel.text = String(score)
    }
    
    func  GenerateRandom() {
        randomVal = 1 + Int(arc4random_uniform(100))
        randLabel.text = String(randomVal)
    }

}

