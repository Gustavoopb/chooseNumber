//
//  Card.swift
//  chooseNumber
//
//  Created by Gustavo Barbosa on 16/06/16.
//  Copyright © 2016 Gustavoopb. All rights reserved.
//
import Foundation
class Card: NSObject {
    private var keyValue:Int!
    private var cardNumbers:NSMutableArray!
    internal static let size: Int = 30
   
    init(keyValue: Int, cardNumbers: [String]){
        self.cardNumbers = NSMutableArray(array: cardNumbers.shuffle())
        while self.cardNumbers.count < Card.size {
            self.cardNumbers.addObject("")
        }
        self.keyValue = keyValue
    }
    
    func getCardNumbers() -> NSMutableArray{
        return self.cardNumbers
    }
    
    func getKeyValue() -> Int{
        return self.keyValue
    }
}