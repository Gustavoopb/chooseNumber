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

    @IBOutlet weak var heightLayoutConstraint: NSLayoutConstraint?
    
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
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "headerBoard", forIndexPath: indexPath) as! CustomCollectionReusableView
            headerView.label.text = self.card.getCardTitle()
            headerView.defaultConfig()
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
}