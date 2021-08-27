//
//  Theme.swift
//  Memorize
//
//  Created by Pedro Henrique on 26/08/21.
//

import SwiftUI


struct Theme<CardContent>: Identifiable where CardContent: Equatable {
    
    var id = UUID()
    
    let name: String
    let cardFaceOptions: [CardContent]
    let details: [String:Any]
    
}
