//
//  ContentView.swift
//  iExpense
//
//  Created by 박수호 on 2023/01/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(expenses.items.filter { $0.type == "Personal" }) { item in
                        HStack {
                            VStack (alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .foregroundColor(self.getTextColor(amount: item.amount))
                        }
                    }
                    .onDelete(perform: removePersonalExpenses)
                } header: {
                    Text("Personal")
                }
                
                Section {
                    ForEach(expenses.items.filter { $0.type == "Business" }) { item in
                        HStack {
                            VStack (alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .foregroundColor(self.getTextColor(amount: item.amount))
                        }
                    }
                    .onDelete(perform: removeBusinessExpenses)
                } header: {
                    Text("Business")
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removePersonalExpenses(at offsets: IndexSet) {
        let personalExpenses = expenses.items.filter{ $0.type == "Personal" }
        let values = offsets.map { personalExpenses[$0] }
        
        for value in values {
            expenses.items.removeAll {
                $0.id == value.id
            }
        }
    }
    
    func removeBusinessExpenses(at offsets: IndexSet) {
        let businessExpenses = expenses.items.filter{ $0.type == "Business" }
        let values = offsets.map { businessExpenses[$0] }
        
        for value in values {
            expenses.items.removeAll {
                $0.id == value.id
            }
        }
    }
    
    func getTextColor(amount: Double) -> Color {
        if amount < 1000 {
            return Color.yellow
        } else if 1000 <= amount && amount < 10000  {
            return Color.orange
        } else {
            return Color.red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
