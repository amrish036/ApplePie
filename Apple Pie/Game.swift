//
//  Game.swift
//  Apple Pie
//
//  Created by Amrish Mahesh on 26/7/18.
//  Copyright © 2018 Amrish Mahesh. All rights reserved.
//

import Foundation

struct Game {
  var word: String
  var incorrectMovesRemaining: Int
  var guessedLetter: [Character]
  
  mutating func playerGuessed(letter: Character){
    guessedLetter.append(letter)
    if !word.contains(letter){
      incorrectMovesRemaining -= 1
    }
  }
  
  var formattedString: String{
    var guessedWord = ""
    for letter in word{
      if guessedLetter.contains(letter){
        guessedWord += "\(letter)"
      }
      else{
        guessedWord += "_"
      }
    }
    return guessedWord
  }
}
