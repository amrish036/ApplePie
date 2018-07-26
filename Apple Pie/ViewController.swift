//
//  ViewController.swift
//  Apple Pie
//
//  Created by Amrish Mahesh on 24/7/18.
//  Copyright © 2018 Amrish Mahesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var currentGame: Game!
  var listOfWords = ["objc", "swift", "react", "javascript", "vedaleon", "haka", "amrish", "flying"]
  let incorrectMovesAllowed = 7
  
  var totalWins = 0 {
    didSet {
      newRound()
    }
  }
  var totalLosses = 0 {
    didSet {
      newRound()
    }
  }
  
  
  @IBOutlet weak var treeImageView: UIImageView!
  @IBOutlet weak var correctWordLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  
  @IBOutlet var letterButtons: [UIButton]!
  @IBAction func buttonTapped(_ sender: UIButton) {
    sender.isEnabled = false
    let letterString = sender.title(for: .normal)!
    let letter = Character(letterString.lowercased())
    currentGame.playerGuessed(letter: letter)
    updateGameState()
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    newRound()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func newRound(){
    if !listOfWords.isEmpty{
      let newWord = listOfWords.removeFirst()
      currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetter: [])
      enableLetterButtons(true)
      updateUI()
    }
    else{
      enableLetterButtons(false)
    }
  }
  
  func enableLetterButtons(_ enable: Bool){
    for button in letterButtons {
      button.isEnabled = enable
    }
  }
  
  func updateUI(){
    var letters = [String]()
    for letter in currentGame.formattedString{
      letters.append(String(letter))
    }
    
    let wordWithSpacing = letters.joined(separator: " ")
    
    correctWordLabel.text = wordWithSpacing
    scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
    treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
  }
  
  func updateGameState(){
    if currentGame.incorrectMovesRemaining == 0 {
      totalLosses += 1
    } else if currentGame.word == currentGame.formattedString{
      totalWins += 1
    }else {
      updateUI()
    }
  }


}

