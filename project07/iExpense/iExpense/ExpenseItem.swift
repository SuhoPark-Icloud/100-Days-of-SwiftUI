//
//  ExpenseItem.swift
//  iExpense
//
//  Created by 박수호 on 2023/01/29.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
