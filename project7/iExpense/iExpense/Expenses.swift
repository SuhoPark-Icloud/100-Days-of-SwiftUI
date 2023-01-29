//
//  Expenses.swift
//  iExpense
//
//  Created by 박수호 on 2023/01/29.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        // didSet: 해당 프로퍼티의 값이 변한 뒤 수행할 내용
        didSet {
            let encoder = JSONEncoder()
            
            // items 전체를 인코딩하고, 성공한다면 UserDefaults "Items" 키에 저장하라
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        // "Items" 키에 값이 있는지 확인하고
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            // 값이 있다면 디코딩해라.
            // [ExpenseItem] 배열의 인스턴스를 만들려고 하는 것이 아니기 때문에 혼한을 주지 않기 위해
            // 그 타입 자체를 찹조한다는 의미의 .self를 붙인다.
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        // 만약 키에 값이 없다면 빈 배열로 설정하라
        items = []
    }
}
