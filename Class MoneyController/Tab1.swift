//
//  Flip.swift
//  coinFlip
//
//  Created by Jeevith on 16/02/25.
//

import SwiftUI
import Foundation

class AppBackend: ObservableObject {
    @Published var money: Float = 1000.0
    @Published var resultText: String = "Place Your Bet!"
    @Published var resultImage: String = "QuestionMark"
    @Published var betAmount: Int = 10
    let betAmounts: [Int] = [10, 50, 100, 500, 1000]
    
    private func generateRandomOutcome() -> Int {
        return Int.random(in: 0...1)
    }
    
    private func checkAmount() -> Bool {
        return money >= Float(betAmount)
    }
    
    func flipCoin(userChoice: Int) {
        
        let outcome = generateRandomOutcome()
        if userChoice == outcome {
            resultText = "You Win!"
            money += Float(betAmount) + (Float(betAmount) / 2 )
        } else {
            resultText = "You Lose!"
            money -= Float(betAmount)
        }
        
        resultImage = outcome == 0 ? "head" : "tail"
    }
}

struct BetAmountPicker: View {
    @ObservedObject var game = AppBackend()
    @State var a = 0
    @State var inputText: Int = 10
    @State private var navigateToGame = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 30) {
                    Text("Coin Flip Game")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                        
                    
                    Text("🤑 $\(game.money, specifier: "%.2f")")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(10)
                    
                    Text("Bet Amounts Range")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.white)
                    
                    Picker("Bet Amount", selection: $inputText) {
                        ForEach(game.betAmounts, id: \.self) { amount in
                            Text("$\(amount)")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.black)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 20)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]),
                                             startPoint: .top,
                                             endPoint: .bottom))
                        .frame(width: 250, height: 100)
                        .shadow(color: .white, radius: 5)
                        .overlay(
                            VStack {
                                Text("Enter Your Bet Amount")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .bold))
                                
                                TextField("", value: $inputText , formatter: NumberFormatter())
                                    .font(.system(size: 40, weight: .bold))
                                    .frame(width: 150, height: 50)
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.numberPad)
                                    .foregroundColor(.black)
                            }
                        )
                    
                    HStack(spacing: 40) {
                        Button(action: {
                            if inputText < 1000 {
                                inputText = inputText + 1
                            }
                        }) {
                            Text("+")
                                .font(.system(size: 50, weight: .bold))
                                .foregroundColor(.white)
                        }
                        
                        Button(action: {
                            if inputText >= 10 {
                                inputText = inputText - 1
                            }
                        }) {
                            Text("-")
                                .font(.system(size: 50, weight: .bold))
                                .foregroundColor(.white)
                        }
                    }
                    
                    Button {
                        if inputText >= 10 , inputText <= 1000 {
                            game.betAmount = inputText
                            navigateToGame = true
                            print(game.betAmount)
                        }
                    } label: {
                        Text("Set Amount")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                            .frame(width: 180, height: 50)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]),
                                                       startPoint: .bottom,
                                                       endPoint: .top))
                            .cornerRadius(20)
                            .shadow(radius: 5)
                    }
                    
                    NavigationLink(destination: Tab2(), isActive: $navigateToGame) {
                        EmptyView()
                    }
                }
                .padding()
            }
        }
    }
}

struct Flip: View {
    var body: some View {
        Text("Welcome to the Coin Flip Game!")
            .font(.system(size: 30, weight: .bold))
            .padding()
    }
}

#Preview {
    BetAmountPicker()
}
