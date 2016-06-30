//
//  ViewController.swift
//  chooseNumber
//
//  Created by Gustavo Barbosa on 11/06/16.
//  Copyright © 2016 Gustavoopb. All rights reserved.
//

import UIKit
import iAd

class ViewController: AbstractViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var gameTittle: UILabel!
    @IBOutlet weak var ruleOne: UITextView!
    @IBOutlet weak var ruleTwo: UITextView!
    
    override func viewDidLoad() {
        button.setTitle(self.localizedString(button.titleLabel!.text!), forState: UIControlState.Normal)
        ruleOne.text = self.localizedString(ruleOne.text)
        ruleTwo.text = self.localizedString(ruleTwo.text)
        gameTittle.text = self.localizedString(gameTittle.text!)
        button!.layer.borderColor = UIColor.lightGrayColor().CGColor
        button!.layer.borderWidth = 2
        button!.layer.cornerRadius = 4
        button!.sizeToFit()
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func startToPlay(){
        self.callStoryboard("BoardViewController", viewControllerName: "BoardViewController")
    }

}

