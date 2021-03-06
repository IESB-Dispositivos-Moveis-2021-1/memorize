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
            cardFaceOptions: ["β½οΈ", "π₯", "β·", "π₯", "π΄πΌββοΈ", "ππΌββοΈ", "πββοΈ", "β³οΈ", "π", "π", "βΉοΈββοΈ"],
            details: ["color": Color.red, "cornerRadius": 8]
        ),
        
        Theme<String>(
            name: "Vehicles",
            cardFaceOptions: ["π", "βοΈ", "π", "π", "π", "π", "π", "π", "π¬", "π", "β΅οΈ", "π", "π΅", "π²", "π", "π ", "π", "π"],
            details: ["color": Color.blue, "cornerRadius": 24]
        ),
        
        Theme<String>(
            name: "Fruits",
            cardFaceOptions: ["π", "π", "π", "π", "π", "π₯₯", "π", "π", "π₯", "π", "π", "π", "π₯"],
            details: ["color": Color.orange, "cornerRadius": 0]
        ),
    
    ]
    
    // MARK: - Acesso da View Γ  Model
    
    var themeNames: [String] {
        model.map({$0.name})
    }
    
    func themeFor(name: String) -> Theme<String> {
        return model.first(where: {$0.name == name})!
    }
    
    
    // MARK: - Processamento de IntenΓ§Γ΅es
    
}
