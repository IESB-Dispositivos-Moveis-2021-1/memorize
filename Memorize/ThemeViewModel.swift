//
//  ThemeViewModel.swift
//  Memorize
//
//  Created by Pedro Henrique on 26/08/21.
//

import SwiftUI


class ThemeViewModel: ObservableObject {
    
    @Published
    var model = [
        
        Theme<String>(
            name: "Sports",
            cardFaceOptions: ["⚽️", "🥊", "⛷", "🥎", "🚴🏼‍♀️", "🏄🏼‍♂️", "🏊‍♀️", "⛳️", "🏓", "🏀", "⛹️‍♀️"],
            details: ["color": Color.red, "cornerRadius": 8]
        ),
        
        Theme<String>(
            name: "Vehicles",
            cardFaceOptions: ["🚀", "✈️", "🚗", "🏍", "🚘", "🚍", "🚓", "🚚", "🛬", "🚑", "⛵️", "🚁", "🛵", "🚲", "🚒", "🚠", "🚎", "🚌"],
            details: ["color": Color.blue, "cornerRadius": 24]
        ),
        
        Theme<String>(
            name: "Fruits",
            cardFaceOptions: ["🍑", "🍓", "🍉", "🍋", "🍍", "🥥", "🍎", "🍌", "🥝", "🍅", "🍐", "🍇", "🥑"],
            details: ["color": Color.orange, "cornerRadius": 0]
        ),
    
    ]
    
    // MARK: - Acesso da View à Model
    
    var themeNames: [String] {
        model.map({$0.name})
    }
    
    func themeFor(name: String) -> Theme<String> {
        return model.first(where: {$0.name == name})!
    }
    
    
    // MARK: - Processamento de Intenções
    
}
