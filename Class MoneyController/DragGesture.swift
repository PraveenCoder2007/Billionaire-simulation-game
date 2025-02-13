//
//  DragGesture.swift
//  Class MoneyController
//
//  Created by praveen on 13/02/25.
//
import SwiftUI

struct DragGestureView: View {
    @State private var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.80
    @State private var currentDragOffsetY: CGFloat = 0
    @State private var endingOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            
            SignUpView()
                .offset(y: startingOffsetY )
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                currentDragOffsetY = value.translation.height
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                if currentDragOffsetY < -150 {
                         
                                    endingOffsetY = -startingOffsetY
                                } else {
                                   
                                    endingOffsetY = 0
                                }
                                currentDragOffsetY = 0
                            }
                        }
                )
            Text("\(currentDragOffsetY)")
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    DragGestureView()
}

struct SignUpView: View {
    var body: some View {
        VStack {
            Image(systemName: "chevron.up")
                .padding(.top)
            Text("Sign up")
                .font(.headline)
                .fontWeight(.bold)
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text("Welcome to the signup page")
                .padding(.bottom)
            
            Text("CREATE AN ACCOUNT")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .padding(.horizontal, 40)
                .background(Color.black)
                .cornerRadius(10)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}


struct ColoredBackgroundView: View {
    @State var count: Int = 0
    @State var color: Color = .yellow
    @State var Animation_color: Color = .yellow

    var body: some View {
        VStack {
                        Text("\(count)")
                            .font(.largeTitle)
                            .foregroundColor(.black)
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black)
                .frame(width: 300, height: 200)
                
                .onTapGesture(count: 2)
            {
                    self.count += 1
                }
            Button {
                
            } label: {
                Text("Tap me")
                    
            }

            
        }
        //        .onAppear{
        //            color = .red
        //        }
        //            .onChange(of: count) { newCount in
        //                // Change the background color based on the count
        //                if newCount % 2 == 0 {
        //                    color = .yellow
        //                } else {
        //                    color = .blue
        //                }
        //            }
        //            .frame(maxWidth: .infinity, maxHeight: .infinity)
        //            .background(color)
        //            .ignoresSafeArea(edges: .all)
    }
    
}

struct preview: PreviewProvider {
    static var previews: some View {
    ColoredBackgroundView()
    }
}
