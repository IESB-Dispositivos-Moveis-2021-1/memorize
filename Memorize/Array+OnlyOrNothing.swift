//
//  Array+OnlyOrNothing.swift
//  Memorize
//
//  Created by Pedro Henrique on 05/08/21.
//

import Foundation

extension Array {
    
    var only: Element? {
        count == 1 ? first : nil
    }
    
}
