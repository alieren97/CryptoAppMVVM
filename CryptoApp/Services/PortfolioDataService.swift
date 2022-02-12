//
//  PortfolioDataService.swift
//  CryptoApp
//
//  Created by Ali Eren on 9.02.2022.
//

import Foundation
import CoreData


class PortfolioDataService{
    private let container : NSPersistentContainer
    private let containerName : String = "PortfolioContainer"
    private let entityName : String = "Portfolio"
    @Published var savedEntities :[Portfolio] = []
    init(){
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, err in
            if let err = err {
                print("Error loading CORE Data \(err)")
            }
        }
        self.getPortfolio()
    }
    
    func updatePortfolio(coin:Coin,amount:Double){
        if let entity = savedEntities.first(where:{$0.coinID == coin.id}){
            if amount > 0 {
                update(entity: entity, amount: amount)
            }
            else {
                remove(entity:entity)
            }
        }
        else{
            add(coin: coin, amount: amount)
        }
      
    }
    
    
    private func getPortfolio(){
        let req = NSFetchRequest<Portfolio>(entityName: entityName)
        do {
            savedEntities = try container.viewContext.fetch(req)
        } catch let err {
            print("Error fetching Portfolio Entities \(err)")
        }
    }
    
    private func add(coin:Coin,amount:Double){
        let entity = Portfolio(context: container.viewContext)
        entity.coinID = coin.id
        entity.amount = amount
        applyChanges()
    }
    
    private func update(entity:Portfolio,amount:Double){
        entity.amount = amount
        applyChanges()
    }
    
    private func remove(entity:Portfolio){
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    private func save(){
        do {
            try container.viewContext.save()
        } catch let err {
            print("Error saving to Core Data. \(err)")
        }
    }
    
    private func applyChanges(){
        save()
        getPortfolio()
    }
}
