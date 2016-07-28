//
//  SimpleCollectionViewCell.swift
//  chooseNumber
//
//  Created by Gustavo Barbosa on 16/06/16.
//  Copyright © 2016 Gustavoopb. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var labelValue: UILabel!
    var cardKeyValue: Int!
    
    func defaultConfig(){
        self.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 4
    }
}
