//
//  ThemeView.swift
//  Memorize
//
//  Created by Pedro Henrique on 26/08/21.
//

import SwiftUI

struct ThemeView: View {
    
    
    @ObservedObject
    var viewModel: ThemeViewModel
    
    
    var body: some View {
        NavigationView {
            
            List(viewModel.themeNames) { themeName in
                NavigationLink(destination: EmojiMemoryGameView(viewModel: EmojiMemoryGame(theme: viewModel.themeFor(name: themeName)), theme: themeName)) {
                    Text(themeName)
                }
            }
            .navigationTitle("Tema do Jogo")
        }
    }
}

extension String: Identifiable {
    public var id: String {
        return self
    }
}
