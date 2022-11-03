//
//  cardGame.swift
//  project3_Jumana
//
//  Created by Jumana Rahman on 12/14/20.
//  Copyright © 2020 Jumana Rahman. All rights reserved.
//

import Foundation


class Cardgame{
    
    var cards = [Card]()            // list of all cards
    var selectedEmojis: [String]
    
    var clickNum = 0        //counts all clicks
    var movesleft = 50         //can change if want less/more moves
    var cardsplayed:[Int] = []        //list of all tagnumbers clicked
    var blank:Bool = true
    
    var emojiList: [String] = ["😇","😎", "🥳","🤓","🎃","🤠","👻","🤩","🦋","🤑","😇", "😎","🥳","🤓","🎃", "🤠","👻","🤩","🦋","🤑"].shuffled()
    
    
    
    init(){
        var x = 0
        selectedEmojis = emojiList
        while x < 20{
            cards.append(Card(emoji: selectedEmojis[x], isMatched: false,display: false,id: x))
            x = x + 1
        }
        cards = cards.shuffled()
    }
    
    func checkinit(){  //works
        print(cards)
    }
    
    
    func movesMadecalc()->Int{
        clickNum = clickNum + 1
        
        return clickNum/2               //1 move is 2 clicks
    }
    
    func movesLeft() -> Int{
        if movesleft - clickNum/2 == 0{      //1 move is 2 clicks
        }
        return movesleft - clickNum/2
    }
    
    func getEmoji(tag:Int)-> String{     //returns row and column number //NEED
        var selected: String = ""
        var x = 0
        while x < 20{
            if cards[x].id == tag{
                selected = cards[x].emoji
            }
            x = x + 1
        }
        return selected
    }
    
    func IsMatch(tag1: Int,tag2: Int) -> Bool{   //works //NEED
        
        if getEmoji(tag: tag1) == getEmoji(tag: tag2) && tag1 != tag2{ //case cards match
            cards[tag1].isMatched = true
            cards[tag2].isMatched = true
            return true
        }
        else{
            return false   //no match
        }
    }
    
    func gameOver()->Bool{         //default case: false unless matches done
        var x = 0
        var endGame = true
        let test = false
        while x < 20{
            if cards[x].isMatched == false{
                endGame = test
                return test
            }
            x = x + 1
        }
        return endGame
    }
}

