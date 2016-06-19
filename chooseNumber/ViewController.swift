//
//  ViewController.swift
//  chooseNumber
//
//  Created by Gustavo Barbosa on 11/06/16.
//  Copyright © 2016 Gustavoopb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    @IBOutlet weak var buttonVerticalLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var button: UIButton?

    override func viewDidLoad() {
        button!.layer.borderColor = UIColor.lightGrayColor().CGColor
        button!.layer.borderWidth = 2
        button!.layer.cornerRadius = 4
        button!.sizeToFit()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startToPlay(){
        let storyboard = UIStoryboard(name: "BoardViewController", bundle: nil)
        let board = storyboard.instantiateViewControllerWithIdentifier("BoardViewController") as UIViewController
        self.presentViewController(board, animated: true, completion: nil)
    }

}

