//
//  CustomCollectionView.swift
//  chooseNumber
//
//  Created by Gustavo Barbosa on 17/06/16.
//  Copyright © 2016 Gustavoopb. All rights reserved.
//

import UIKit

class CustomCollectionView: UICollectionView, UICollectionViewDataSource{
    
    var card:Card!
    let reuseIdentifier = "cell"

     @IBOutlet weak var widthLayoutConstraint: NSLayoutConstraint? {
        didSet{
            self.widthLayoutConstraint!.constant = UIScreen.mainScreen().bounds.width*0.9
        }
    }
    @IBOutlet weak var heightLayoutConstraint: NSLayoutConstraint?
    
    
    
//    super.backgroundColor = UIColor.blackColor()
    
    // MARK: - UICollectionViewDataSource protocol
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Card.size
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CustomCollectionViewCell
        cell.defaultConfig()
        cell.cardKeyValue = self.card.getKeyValue()
        cell.labelValue.text = self.card.getCardNumbers()[indexPath.item] as? String
        self.heightLayoutConstraint!.constant = collectionView.contentSize.height;
        return cell
    }
}