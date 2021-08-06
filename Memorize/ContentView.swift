//
//  ContentView.swift
//  Memorize
//
//  Created by Pedro Henrique on 22/07/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        
        VStack {
            if viewModel.gameHasEnded {
                Spacer()
                Text("Acabou o jogo")
                    .font(.system(size: 60))
                Spacer()
            }else {
                Grid(viewModel.cards) { card in
                    GeometryReader { geometry in
                        Text(card.content)
                            .makeCard(isFaceUp: card.isFaceUp)
                            .padding(4)
                            .font(.system(size: fontSize(for: geometry.size)))
                            .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                            .opacity(card.isMatched ? 0 : 1)
                            .onTapGesture {
                                withAnimation {
                                    viewModel.choose(card: card)
                                }
                            }
                    }
                }
            }
            
            Button("Novo Jogo") {
                withAnimation(.easeInOut) {
                    viewModel.newGame()
                }
            }
        }
        .foregroundColor(Color.red)
    
    }
    
    private func fontSize(for size: CGSize) -> CGFloat {
        return min(size.width, size.height) * 0.7
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
