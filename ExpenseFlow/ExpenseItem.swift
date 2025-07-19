//
//  ExpenseItem.swift
//  ExpenseFlow
//
//  Created by Arman on 19/7/25.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id =  UUID()
    let name: String
    let type: String
    let amount: Double
}
