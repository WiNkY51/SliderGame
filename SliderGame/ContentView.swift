//
//  ContentView.swift
//  SliderGame
//
//  Created by Winky51 on 01.11.2024.
//

import SwiftUI

struct ContentView: View {
    @State var contentViewVM = ContentViewViewModel()
    @State var alertPresented = false
    
    
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 380, height: 270)
                .foregroundStyle(.cyan)
                .shadow(radius: 30)
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke( lineWidth: 2)
                }
            
            VStack {
                
                Text("Передвинь бегунок как можно ближе к: \(contentViewVM.targetText)")
                    .bold()
                    .foregroundStyle(.black)
                    .onAppear {
                        contentViewVM.setAlpha()
                    }
                    .onAppear {
                        contentViewVM.setTargetValue()
                    }
                HStack{
                    Text("0")
                    
                    UIKitSliderView(value: $contentViewVM.currentValue, alpha: $contentViewVM.alpha)
                        .onChange(of: contentViewVM.currentValue) {
                            contentViewVM.setAlpha()
                            
                        }
                    Text("100")
                }
                .padding()
                Button(action: {
                    contentViewVM.checkValue()
                    alertPresented.toggle()
                }) {
                    Text("Проверить меня").textModifiere()
                }.buttonModifiere(.gray)
                    .alert("Вы набралим \(contentViewVM.result) балов!", isPresented: $alertPresented , actions: {})
            
            
            
            Button(action: contentViewVM.setTargetValue) {
                Text("Сменить значение").textModifiere()
            }.buttonModifiere(.gray)
            
        }
            
            
            
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

struct TextModifiere: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundStyle(.black)
            
    }
}
struct ButtonModifiere: ViewModifier {
    let backgroundColor: Color
    func body(content: Content) -> some View {
        content
            .frame(width: 270, height: 60)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 15)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
            }
    }
}

extension Button {
    public func buttonModifiere(_ backgroundColor: Color) -> some View {
        modifier(ButtonModifiere(backgroundColor: backgroundColor))
    }
}

extension Text {
    public func textModifiere() -> some View {
        modifier(TextModifiere())
    }
}
