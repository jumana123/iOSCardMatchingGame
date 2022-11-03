//
//  ViewController.swift
//  project3_Jumana
//
//  Created by Jumana Rahman on 11/3/20.
//  Copyright © 2020 Jumana Rahman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = Cardgame()

    let emojiList: [String] = ["😇","😎", "🥳","🤓","🎃","🤠","👻","🤩","🦋","🤑","😇", "😎","🥳","🤓","🎃", "🤠","👻","🤩","🦋","🤑"].shuffled()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblMovesLeft.text = String(game.movesLeft())
    }

    @IBOutlet weak var lblMovesMade: UILabel!
    
    @IBOutlet weak var lblMovesLeft: UILabel!
    
    
    
    @IBAction func btnClick(_ sender: UIButton) {
        var newLabel: String = ""
        var image:UIImage = UIImage()
        var labels:String                //reset unmatched cards
        
        var flower:UIImage = UIImage()
        flower = (UIImage(named:"flower.png")as UIImage?)!
        
        
        lblMovesMade.text = String(game.movesMadecalc())      //labels for moves
        lblMovesLeft.text = String(game.movesLeft())          //labels for moves
        
        /*
        //code for movesmade here from demo vid
        if let movesString = lblMovesMade.text{
            var movesMade = Int(movesString)!
            movesMade = movesMade + 1 // changed it to a move is when two buttons is clicked, now is a move per button click
            lblMovesMade.text = String(movesMade)
            //add in logic for moves left
        }
        */
        
        if let label = sender.titleLabel!.text{
            newLabel = label
        }else{
            newLabel = ""
        }
        
        
        if newLabel != "" && game.blank == true && game.cards[sender.tag].isMatched == false && game.cards[sender.tag].display == false
        {
            image = (UIImage(named: "flower.png") as UIImage?)!
            newLabel = ""
            game.blank = false
        }else{
            image = UIImage()           // blank image
            game.blank = true
            game.cardsplayed.append(sender.tag)
           
            game.cards[sender.tag].display = true
            newLabel = game.getEmoji(tag: sender.tag)
        }
        
        
        if game.clickNum % 2 != 1{
            if game.IsMatch(tag1: game.cardsplayed[game.cardsplayed.count-1], tag2: game.cardsplayed[game.cardsplayed.count-2]){
                
                print(game.clickNum % 2)
            }
            else{      //flips the two flipped pictures back over again //works
                labels = ""
                for case let button as UIButton in self.view.subviews {
                    if game.cards[button.tag].isMatched == false && game.cards[button.tag].display == true {
                        button.setBackgroundImage(flower, for: UIControl.State.normal)//reflips all cards that are not matched.
                        button.setTitle(labels, for: UIControl.State.normal)
                        
                    }
                }
            }
        }
        
       
        if game.clickNum > 2{
            game.IsMatch(tag1:game.cardsplayed[game.cardsplayed.count-1], tag2: game.cardsplayed[game.cardsplayed.count-2])     //need
        }
        
        print(game.clickNum % 2)
        
        //winner case shows at the end of game
        if game.gameOver(){
            for view in self.view.subviews{
                view.removeFromSuperview()
                //here add in code for winner or loser
                let label = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
                label.font = label.font.withSize(60)
                label.textColor = UIColor.green
                label.center = CGPoint(x: 200, y: 285)
                label.textAlignment = .center
                label.text = "YOU WON"
                self.view.addSubview(label)
                
                }
            }
        //loser case shows when run out of moves
        if lblMovesLeft.text == "0"{
            for view in self.view.subviews{
                view.removeFromSuperview()
                //here add in code for winner or loser
                let label = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
                label.font = label.font.withSize(60)
                label.textColor = UIColor.green
                label.center = CGPoint(x: 200, y: 285)
                label.textAlignment = .center
                label.text = "YOU LOSE"
                self.view.addSubview(label)
                
            }
        }
        
        sender.setTitle(newLabel, for: UIControl.State.normal)
        sender.setBackgroundImage(image, for: UIControl.State.normal)
    }
}


