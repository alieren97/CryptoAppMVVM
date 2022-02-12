//
//  Statistic.swift
//  CryptoApp
//
//  Created by Ali Eren on 8.02.2022.
//

import Foundation

struct Statistic:Identifiable,Codable {
    let id = UUID().uuidString
    let title :String
    let value : String
    let percenteageChange :Double?
    
    
    init(title:String,value:String,percenteageChange:Double? = nil){
        self.title = title
        self.value = value
        self.percenteageChange = percenteageChange
    }
}



