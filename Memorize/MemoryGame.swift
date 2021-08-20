//
//  MemoryGame.swift
//  Memorize
//
//  Created by Pedro Henrique on 29/07/21.
//

import Foundation


//Model do MVVM
struct MemoryGame<CardContent> where CardContent: Equatable {
    
    var cards: Array<Card> // é a mesma coisa de var cartas: [Card]
    
    private var indexOfPreviousChosenCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.only
        }
        set {
            cards.indices.forEach { cards[$0].isFaceUp = $0 == newValue }
        }
    }
    
    var gameHasEnded: Bool {
        cards.allSatisfy { $0.isMatched }
    }
    
    init(numberOfPairsOfCards: Int, cardFactory: (Int) -> CardContent) {
        
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
        
        print(cards)
        cards.shuffle()
        print(cards)
    }
    
    
    mutating func choose(card: Card) {
        print("Carta escolhida: \(card)")
        
        if let chosenCardIndex = cards.firstIndex(matching: card) { //desencapsulamento de opcional
            
            if let possibleMatch = indexOfPreviousChosenCard {
                if cards[chosenCardIndex].content == cards[possibleMatch].content {
                    cards[chosenCardIndex].isMatched = true
                    cards[possibleMatch].isMatched = true
                }
            }else {
                indexOfPreviousChosenCard = chosenCardIndex
            }
            
            cards[chosenCardIndex].isFaceUp = true
        }
        
    }
    
    
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp: Bool = false {
            didSet {
                if isFaceUp {
                    beginUsingBonusTime()
                }else {
                    stopUsingBonusTime()
                }
            }
        }
        
        var isMatched: Bool = false {
            didSet {
                stopUsingBonusTime()
            }
        }
        
        var content: CardContent
        
        var bonusTime: TimeInterval = 10
        
        
        var lastTimeFacingUp: Date?
        var lastIntervalFacingUp: TimeInterval = 0
        
        private var timeFacingUp: TimeInterval {
            if let lastFlip = lastTimeFacingUp {
                return lastIntervalFacingUp + Date().timeIntervalSince(lastFlip)
            }
            return lastIntervalFacingUp
        }
        
        var bonusTimeRemaining: TimeInterval {
            max(0, bonusTime - timeFacingUp)
        }
        
        var bonusRemaining: Double {
            (bonusTime > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining / bonusTime : 0
        }
        
        var isConsumingBonusTime: Bool {
            isFaceUp && !isMatched && bonusTimeRemaining > 0
        }
        
        private mutating func beginUsingBonusTime() {
            if lastTimeFacingUp == nil {
                lastTimeFacingUp = Date()
            }
        }
        
        private mutating func stopUsingBonusTime() {
            lastIntervalFacingUp = timeFacingUp
            lastTimeFacingUp = nil
        }
        
    }
    
}
