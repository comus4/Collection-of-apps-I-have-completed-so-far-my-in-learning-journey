//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Comus Hardman following 100 Days of SwiftUI by Paul Hudson.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
