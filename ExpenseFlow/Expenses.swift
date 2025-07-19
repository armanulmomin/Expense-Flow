//
//  Expenses.swift
//  ExpenseFlow
//
//  Created by Arman on 19/7/25.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem](){
        didSet{
           if let encoded = try? JSONEncoder().encode(items){
             UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            if let decodeItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems){
                self.items = decodeItems
                return
            }
        }
        items = []
    }
}
