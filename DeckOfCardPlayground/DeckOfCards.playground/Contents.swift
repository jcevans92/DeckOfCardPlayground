//: Playground - noun: a place where people can play
import UIKit
import Foundation


var ranks = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]

class Rank {
    
    public static func getRank(rankIndex: Int) -> String? {
        return ranks[rankIndex]
    }
}

class Suit {
    public static let Spades = "spades"
    public static let Clubs = "clubs"
    public static let Diamonds = "Diamonds"
    public static let Hearts = "Hearts"
}

class Card {
    var rank: String!
    var suit: String!
    
    init(rank: String, suit: String) {
        self.rank = rank
        self.suit = suit
    }
}

var deck = [Card]()

class Deck {
    
    // Init new deck
    public static func NewDeck () {
        //var deck = [Card]()
        // Loop Through Combination
        for suit in [Suit.Clubs, Suit.Diamonds, Suit.Hearts, Suit.Spades] {
            for rank in 0...12 {
                if let szRank = Rank.getRank(rankIndex: rank) {
                    deck.append(Card(rank: szRank, suit: suit))
                }
                
            }
        }
    }
    // Shuffle Deck
    public static func ShuffleDeck() {
        var iCardsRemaining = 52
        var newDeck = [Card]()
        var currentDeck = deck
        
        for i in 0...51 {
            let index = Int(arc4random_uniform(UInt32(deck.count)))//Int(arc4random_uniform(UInt32(iCardsRemaining)))
            //print(index)
            let tempCard = currentDeck[i]
            currentDeck[i] = currentDeck[index]
            currentDeck[index] = tempCard
            iCardsRemaining -= 1
        }
        newDeck = currentDeck
        deck = newDeck
    }
    // Deal one Card
    public static func deal_one_card() -> String {
        if(deck.count > 0) {
            let dealtCard = deck[0]
            deck.removeFirst()
            return "rank: \(dealtCard.rank!) suit: \(dealtCard.suit!)"
        } else {
            return "There are no more cards in this deck."
        }
    }
}

Deck.NewDeck();
Deck.ShuffleDeck()
//Deck.ShuffleDeck()

for i in 0...52{
    print(Deck.deal_one_card())
}

/*for card in deck {
    print(card)
}*/



