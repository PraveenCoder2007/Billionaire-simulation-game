//
//  StaticLearning.swift
//  Class MoneyController
//
//  Created by praveen on 14/02/25.
//

import SwiftUI

class Person: ObservableObject {
    static let shared = Person()
    
    @Published var name: String = "Praveen"
    
    private init() {} // Private initializer to prevent creating other instances
}


struct StaticLearning: View {
    @StateObject var person: Person = Person.shared
   
    var body: some View {
        NavigationStack{
            VStack{
                Text(CoinFlipGame.flipCoin(userChoice: "Head" ))
            }
            }
    }
}

#Preview {
    StaticLearning()
}

import Foundation

class CoinFlipGame {
    
    private static let coinSides: [String] = ["Head", "Tail"]
    
    private static func getRandomCoinSide() -> String {
        return coinSides.randomElement()!
    }
    
    static func flipCoin(userChoice: String) -> String {
        let randomResult = getRandomCoinSide()
        
        if userChoice == randomResult {
            return "You Won! It is a \(userChoice)"
        } else {
            return "You Lost! It is a \(randomResult)"
        }
    }
    
   
}

//let game = CoinFlipGame()
//print("Press Enter To Flip The Coin")
//_ = readLine()
//game.flipCoin(userChoice: "Head")
