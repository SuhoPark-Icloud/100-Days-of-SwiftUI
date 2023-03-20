//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by 박수호 on 2023/03/19.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        // indices: 배열의 인덱스 목록
                        // warning을 제거하기 위해 id: \.self를 추가
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper(
                        "Number of cakes: \(order.quantity)",
                        value: $order.quantity,
                        in: 3...20
                    )
                }
                
                Section {
                    Toggle(
                        "Any special requests?",
                        isOn: $order.specialRequestEnabled.animation()
                    )
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }

                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
