//
//  ContentView.swift
//  Class MoneyController
//
//  Created by praveen on 13/02/25.
//

import Foundation

class Money: ObservableObject {
    @Published private var balance: Float
    
    // Default initializer
    init() {
        self.balance = 0.0
    }
    func getBalance() -> Float {
        return balance
    }
    
    // Method to increment the balance
    func incrementBalance(by amount: Float) -> Void {
        balance += amount
       
    }
    
    // Method to purchase items, reducing the balance
    func purchaseItem(cost: Float) -> Void {
        if balance >= cost {
            balance -= cost
        } else {
            print("Insufficien funds to mak the purchase")
        }
       
    }
    
    // Method to sell items, increasing the balance
    func sellItem(value: Float) -> Void {
        balance += value
      
    }
}


import SwiftUI
struct ContentView: View {
    @StateObject private var money = Money()
    
    var body: some View {
        VStack {
            Text("Balance: \(money.getBalance(), specifier: "%.2f")")
                .font(.largeTitle)
                .padding()
            
            Button("Add $10") {
                money.incrementBalance(by: 10.0)
            }
            .padding()
            
            Button("Buy Item ($5)") {
                money.purchaseItem(cost: 5.0)
            }
            .padding()
            
            Button("Sell Item ($15)") {
                money.sellItem(value: 15.0)
            }
            .padding()
        }
    }
}
#Preview {
    ContentView()
}
