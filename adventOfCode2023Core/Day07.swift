//
//  Day07.swift
//  adventOfCode2023Core
//
//  Created by Samuel Rowe on 16/12/2023.
//

import Foundation

public class Day07: AOCDayProtocol {
    public static var num = 7

    private let hands: [(hand: Substring, bid: Int)]

    public required init(input: String) {
        var data: [(hand: Substring, bid: Int)] = []

        input.enumerateLines { line, _ in
            let l = line.split(separator: " ")
            data.append((hand: l[0], bid: Int(l[1])!))
        }

        hands = data
    }

    public func part_one() -> String {
        winnings(isPartTwo: false).formatted()
    }

    public func part_two() -> String {
        winnings(isPartTwo: true).formatted()
    }

    private func winnings(isPartTwo: Bool) -> Int {
        return hands
            .sorted { a, b in firstHandWeakest(a.hand, b.hand, isPartTwo) }
            .lazy
            .enumerated()
            .map { i, h in
                let rank = i + 1

                return h.bid * rank
            }.reduce(0, +)
    }
}

private func handType(_ a: Substring, _ isPartTwo: Bool = false) -> HandType {
    var chars: [Character: Int] = [:]

    for c in a {
        let n = (chars[c] ?? 0) + 1
        chars[c] = n
    }

    var sortedChars = chars.sorted { a, b in a.value < b.value }

    if isPartTwo {
        sortedChars = sortedChars.filter { $0.key != "J" }
    }

    var n = sortedChars.popLast()?.value ?? 0

    if isPartTwo {
        let jokers = chars["J"] ?? 0
        n += jokers
    }

    switch n {
    case 5:
        return .FiveOfAKind

    case 4:
        return .FourOfAKind

    case 3:
        if sortedChars.popLast()!.value == 2 {
            return .FullHouse
        }
        return .ThreeOfAKind

    case 2:
        if sortedChars.popLast()!.value == 2 {
            return .TwoPair
        }
        return .OnePair

    default:
        return .HighCard
    }
}

private func firstHandWeakest(_ a: Substring, _ b: Substring, _ isPartTwo: Bool) -> Bool {
    let hA = handType(a, isPartTwo)
    let hB = handType(b, isPartTwo)

    if hA == hB {
        let valuesA = a.map { cardValueFromChar($0, isPartTwo) }

        let valuesB = b.map { cardValueFromChar($0, isPartTwo) }

        for (cA, cB) in zip(valuesA, valuesB) {
            if cA == cB {
                continue
            }

            return cA < cB
        }
    }

    return hA > hB
}

private func cardValueFromChar(_ c: Character, _ isPartTwo: Bool) -> Int {
    if let n = c.wholeNumberValue {
        return n
    }

    switch c {
    case "T":
        return 10
    case "J":
        if isPartTwo {
            return 1
        }
        return 11
    case "Q":
        return 12
    case "K":
        return 13
    case "A":
        return 14

    default:
        fatalError("Unknown card char: \(c)")
    }
}

private enum HandType: Comparable {
    case FiveOfAKind
    case FourOfAKind
    case FullHouse
    case ThreeOfAKind
    case TwoPair
    case OnePair
    case HighCard
}
