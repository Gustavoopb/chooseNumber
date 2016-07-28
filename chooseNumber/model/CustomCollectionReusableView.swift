//
//  CustomCollectionReusableView.swift
//  chooseNumber
//
//  Created by Gustavo Barbosa on 20/06/16.
//  Copyright © 2016 Gustavoopb. All rights reserved.
//
import UIKit

class CustomCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var label: UILabel!
    
    func defaultConfig(){
        self.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 4
    }
}