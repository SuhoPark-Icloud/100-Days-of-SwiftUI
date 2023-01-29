//
//  Expenses.swift
//  iExpense
//
//  Created by 박수호 on 2023/01/29.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
