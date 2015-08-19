//
//  ViewController.swift
//  Rochambo
//
//  Created by Will Wyatt on 8/16/15.
//  Copyright (c) 2015 Will Wyatt. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {
    

    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!
    
    var rock = UIImage(named: "rock")
    var paper = UIImage(named: "paper")
    var scissors = UIImage(named: "scissors")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        paperButton.setBackgroundImage(paper, forState: .Normal)
        rockButton.setBackgroundImage(rock, forState: .Normal)
        scissorButton.setBackgroundImage(scissors, forState: .Normal)
        
        paperButton.setTitle("", forState: .Normal)
        rockButton.setTitle("", forState: .Normal)
        scissorButton.setTitle("", forState: .Normal)
        
//        rockButton.addTarget(self, action: "play", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    // Programmatic Approach
    // 
    // This will be used by the "Rock" button.  But we will use the getUserShape helper method so that we
    // could use this method with any chice if we wanted to change later
    
    @IBAction private func play(sender: UIButton) {
        let rvc = self.storyboard!.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        
        rvc.userChoice = getUserChoice(sender)
        
        presentViewController(rvc, animated: true, completion: nil)
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func getUserChoice(sender: UIButton) -> String{
        if sender == rockButton {
            return "Rock"
        } else if sender == paperButton {
            return "Paper"
        } else {
            return "Scissors"
        }
    }
}

