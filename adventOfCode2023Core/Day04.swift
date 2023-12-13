//
//  DayFour.swift
//  adventOfCode2023Core
//
//  Created by Samuel Rowe on 10/12/2023.
//

import Foundation

public class DayFour: AOCDayProtocol {
    public static let num = 4

    let cards: [Game]

    public required init(input: String) {
        var cardsMut: [Game] = []

        input.enumerateLines { line, _ in
            cardsMut.append(parseGame(line))
        }

        cards = cardsMut
    }

    public func part_one() -> String {
        cards.map { card in card.points() }.reduce(0, +).formatted()
    }

    public func part_two() -> String {
        var cardCounts: [Int] = Array(repeating: 1, count: cards.count)

        for (i, card) in cards.enumerated() {
            let matches = card.matches()

            if matches == 0 { continue }

            let countOfThisCard = cardCounts[i]

            for x in i+1 ... i+matches {
                cardCounts[x] += countOfThisCard
            }
        }

        return cardCounts.reduce(0, +).formatted()
    }
}

func parseGame(_ line: String) -> Game {
    let pattern = /Card\s+\d+: ([\d ]+) \| ([\d ]+)/

    let match = line.wholeMatch(of: pattern)!

    return Game(
        a: parseInts(match.1),
        b: parseInts(match.2)
    )
}

func parseInts(_ s: Substring) -> [Int] {
    return s.components(separatedBy: " ").compactMap { x in Int(x) }
}

struct Game {
    let a: [Int]
    let b: [Int]

    func matches() -> Int {
        var count = 0

        for x in b {
            if a.contains(x) {
                count += 1
            }
        }

        return count
    }

    func points() -> Int {
        let c = matches()

        if c == 0 { return 0 }

        return Int(pow(2, Double(c - 1)))
    }
}
