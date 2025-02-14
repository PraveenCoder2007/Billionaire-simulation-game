//
//  StaticLearning.swift
//  Class MoneyController
//
//  Created by praveen on 14/02/25.
//

//import SwiftUI
//
//class Person: ObservableObject {
//    static let shared = Person()
//    
//    @Published var name: String = "Praveen"
//    
//    private init() {} // Private initializer to prevent creating other instances
//}
//
//
//struct StaticLearning: View {
//    @StateObject var person: Person = Person.shared
//   
//    var body: some View {
//        NavigationStack{
//            VStack{
//                Text(CoinFlipGame.flipCoin(userChoice: "Head" ))
//            }
//            }
//    }
//}
//
//#Preview {
//    StaticLearning()
//}
import Foundation
import SwiftUI

enum CoinImage: String, CaseIterable {
    case tail = "tail"
    case head = "head"
}

class CoinFlipGame: ObservableObject {
    @Published var resultText: String = "Press Flip to Start"
    @Published var resultImage: String = "placeholder" // Default image name

    private func getRandomCoinSide() -> String {
        return CoinImage.allCases.randomElement()!.rawValue
    }
    
    func flipCoin(userChoice: String) {
        let randomResult = getRandomCoinSide()
        resultImage = randomResult // Updates the image to match the coin flip result
        
        if userChoice.lowercased() == randomResult {
            resultText = "You Won! It is \(randomResult)"
        } else {
            resultText = "You Lost! It is \(randomResult)"
        }
    }
}

struct CoinFlipView: View {
    @StateObject private var game = CoinFlipGame()
    
    var body: some View {
        VStack(spacing: 20) {
            Image(game.resultImage)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Text(game.resultText)
                .font(.title2)
                .padding()
            
            Button {
                game.flipCoin(userChoice: "head") // Change input dynamically if needed
            } label: {
                Text("Flip Coin")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoinFlipView()
    }
}


