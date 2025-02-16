

import SwiftUI

struct Tab2: View {
    @ObservedObject var game = AppBackend()
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]),
                           startPoint: .bottomTrailing,
                           endPoint: .topLeading )
            .edgesIgnoringSafeArea(.all)
            
                Text("Coin Flip Game")
                    .font(.system(size: 40 , weight: .black))
                    .padding(.top, -330)
                
                Text("🤑 $\(game.money, specifier: "%.2f")")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.blue)
                    .padding()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(10)
                    .padding(.top , -250)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(width: 200, height: 200)
                .shadow(color : .blue , radius: 10)
            
            Image(game.resultImage)
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
            
            Text(game.resultText)
                .font(.system(size: 30, weight: .black))
                .foregroundColor(.white)
                .offset( y : 140)
            
            HStack(spacing: 30) {
                Button {
                    game.flipCoin(userChoice: 0)
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]),
                                             startPoint: .top,
                                             endPoint: .bottom))
                        .frame(width: 120, height: 100)
                        .offset(x : 0 , y : 20 )
                        .overlay {
                            Image("head1")
                                .frame(width: 120, height: 80)
                                .scaledToFit()
                                .offset(x : 0 , y : 20)
                                
                        }
                    
                }
                Button {
                    game.flipCoin(userChoice: 1)
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]),
                                             startPoint: .top,
                                             endPoint: .bottom))
                        .frame(width: 120, height: 100)
                        .offset(x : 10 , y : 20 )
                        .overlay {
                            Image("tail1")
                                .resizable()
                                .offset(x : 10 , y : 20)
                                
                        }
                    
                }

            }
            .offset( y : 200)
            
        }
    }
}

#Preview {
    Tab2()
}
