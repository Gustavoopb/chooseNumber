//
//  BoardViewController.swift
//  chooseNumber
//
//  Created by Gustavo Barbosa on 16/06/16.
//  Copyright © 2016 Gustavoopb. All rights reserved.
//

import UIKit
import iAd

class BoardViewController: AbstractViewController {
    
    var cards:[Card]!
    var messageFrame: UIView?
    var activityIndicator: UIActivityIndicatorView?
    var strLabel: UILabel?
    @IBOutlet weak var viewInsideScroll: UIView?
    @IBOutlet weak var activiyView : UIActivityIndicatorView!
    @IBOutlet weak var buttonYes: UIButton!
    @IBOutlet weak var buttonNo : UIButton!
    @IBOutlet weak var topQuestion: UILabel!
    @IBOutlet weak var collectionViewOutlet: CustomCollectionView!{
        didSet{
            self.collectionViewOutlet.dataSource = self.collectionViewOutlet
        }
    }
    
    let cardsTitle: [String] = ["blankCard", "lastCard", "fifthCard", "fourthCard", "thirdCard", "secondCard", "firstCard"]
    
    let cardOne: Card = Card.init(keyValue: 1, cardNumbers: ["1", "3", "5", "7", "9", "11", "13", "15", "17", "19", "21", "23", "25", "27", "29", "31", "33", "35", "37", "39", "41", "43", "45", "47", "49", "51", "53", "55", "57", "59"])
    let cardTwo: Card = Card.init(keyValue: 2, cardNumbers: ["2", "3", "6", "7", "10", "11", "14", "15", "18", "19", "22", "23", "26", "27", "30", "31", "34", "35", "38", "39", "42", "43", "46", "47", "50", "51", "54", "55", "58", "59"])
    let cardThree: Card = Card.init(keyValue: 4, cardNumbers: ["4", "5", "6", "7", "12", "13", "14", "15", "20", "21", "22", "23", "28", "29", "30", "31", "36", "37", "38", "39", "44", "45", "46", "47", "52", "53", "54", "55", "60"])
    let cardFour: Card = Card.init(keyValue: 8, cardNumbers: ["8", "9", "10", "11", "12", "13", "14", "15", "24", "25", "26", "27", "28", "29", "30", "31", "40", "41", "42", "43", "44", "45", "46", "47", "56", "57", "58", "59", "60"])
    let cardFive: Card = Card.init(keyValue: 16, cardNumbers: ["16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60"])
    let cardSix: Card = Card.init(keyValue: 32, cardNumbers: ["32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60"])
    
    override func viewDidLoad() {
        self.topQuestion.text = self.localizedString(self.topQuestion.text!)
        self.buttonConfig(buttonYes)
        self.buttonConfig(buttonNo)
        self.startToPlay()
        
        super.viewDidLoad()
    }

    @IBAction func showedNumber(sender : UIButton){
        let buttonClicked : String = sender.titleForState(UIControlState.Normal)!
        let myAppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        if buttonClicked == super.localizedString(buttonYes.titleLabel!.text!) {
            
            myAppDelegate.choosedNumber += selectCard().getKeyValue()
        }
        if !cards.isEmpty {
            cards.removeLast()
        }
        self.collectionViewOutlet.card=self.selectCard()
        collectionViewOutlet.reloadData()
        if cards.isEmpty{
            self.progressBarDisplayer(super.localizedString("loadMessage"), true)
            dispatch_async(dispatch_get_main_queue()){
                sleep(2)
                self.messageFrame!.removeFromSuperview()
            }
            self.showResult(myAppDelegate.choosedNumber)
        }
    }
    
    @IBAction func startToPlay(){
        self.cards = [cardOne, cardTwo, cardThree, cardFour, cardFive, cardSix].shuffle()
        let myAppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        myAppDelegate.choosedNumber = 0
        self.collectionViewOutlet.card = selectCard()
        self.collectionViewOutlet.reloadData()
    }
    
    @IBAction func returnMenu(){
        self.callStoryboard("Main", viewControllerName: "ViewController")
    }
    
    private func showResult(choosedNumber: Int){
        let alertTitle = super.localizedString("alertTitle")
        let alertMessage = String(format: super.localizedString("alertMessage"), choosedNumber)
        let buttonPlayAgain = super.localizedString("buttonPlayAgain")
        let buttonQuit = super.localizedString("buttonQuit")
        let myActionSheet : UIAlertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let myActionPlayAgain = UIAlertAction(title: buttonPlayAgain, style: UIAlertActionStyle.Default, handler: { (ACTION:UIAlertAction!) in self.startToPlay() })
        
        let myActionReturnMenu = UIAlertAction(title: buttonQuit, style: UIAlertActionStyle.Destructive, handler: { (ACTION:UIAlertAction!) in self.returnMenu() })
        
        myActionSheet.addAction(myActionPlayAgain)
        myActionSheet.addAction(myActionReturnMenu)
        self.presentViewController(myActionSheet, animated: true, completion: nil)
    }
    
    private func buttonConfig(button: UIButton){
        button.setTitle(super.localizedString(button.titleLabel!.text!), forState: UIControlState.Normal)
        layerConfig(button.layer)
        button.sizeToFit()
    }
    
    private func layerConfig(layer: CALayer){
        layer.borderColor = UIColor.lightGrayColor().CGColor
        layer.borderWidth = 2
        layer.cornerRadius = 4
    }
    
    private func selectCard() -> Card{
        if cards.isEmpty{
            return Card.init(keyValue: 0, cardNumbers: [""]).setCardTitle(localizedString(cardsTitle[0]))
        }
        return cards.last!.setCardTitle(localizedString(cardsTitle[(cards.count)]))
    }
    
    private func progressBarDisplayer(msg:String, _ indicator:Bool ) {
        strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 240, height: 50))
        strLabel!.text = msg
        strLabel!.textColor = UIColor.whiteColor()
        messageFrame = UIView(frame: CGRect(x: view.frame.midX - 120, y: view.frame.midY - 25 , width: 240, height: 50))
        messageFrame!.layer.cornerRadius = 15
        messageFrame!.backgroundColor = UIColor(white: 0, alpha: 0.7)
        if indicator {
            activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.White)
            activityIndicator!.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            activityIndicator!.startAnimating()
            messageFrame!.addSubview(activityIndicator!)
        }
        messageFrame!.addSubview(strLabel!)
        viewInsideScroll!.addSubview(messageFrame!)
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        self.collectionViewOutlet.reloadData()
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    }
}