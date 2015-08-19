//
//  ResultsViewController.swift
//  Rochambo
//
//  Created by Will Wyatt on 8/16/15.
//  Copyright (c) 2015 Will Wyatt. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

//    Outlets
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultsLabel: UILabel!
    
//    Choices
    var userChoice: String!
    var opponentChoice: String!
    
//    View Lifecycle Methods
    
    override func viewWillAppear(animated: Bool) {
    
        super.viewDidLoad()

        // Generate random choice for opponent
        let choices = ["Rock", "Paper", "Scissors"]
        let randIndex = Int(arc4random() % 3)
        opponentChoice = choices[randIndex]
        
        displayResult()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func displayResult() {
        var imageName: String
        var text: String
        var youWon: Bool = false
        
        let matchup = "\(userChoice) vs \(opponentChoice)"
        
//        Handle a tie
        if userChoice == opponentChoice {
            resultImage.image = UIImage(named: "itsATie")
            resultsLabel.text = "\(matchup): it's a tie!"
            return
        }
        
//        Otherwise, figure out who won
        switch userChoice {
        case "Rock":
            youWon = opponentChoice == "Scissors"
        case "Paper":
            youWon = opponentChoice == "Rock"
        default: // Scissors
            youWon = opponentChoice == "Paper"
        }
        
//        Create the text
        if youWon {
            text = "You won! \(matchup)"
            imageName = "\(userChoice)-\(opponentChoice)"
        } else {
            text = "You lost! \(matchup)"
            imageName = "\(opponentChoice)-\(userChoice)"
        }
        
//        Update the Ui components
        resultImage.image = UIImage(named: imageName)
        resultsLabel.text = text
    }
    
    // When the user wants to play again we want to dismiss the curret view
    // so that the choice vew controller is exposed, and the player can choose again
    
    @IBAction private func playAgain() {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
