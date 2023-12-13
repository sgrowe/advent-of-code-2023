//
//  DayTow.swift
//  adventOfCode2023Core
//
//  Created by Samuel Rowe on 05/12/2023.
//

import Foundation
import RegexBuilder

public class DayTwo: AOCDayProtocol {
    let input: String

    public static let num = 2

    public required init(input: String) {
        self.input = input
    }

    public func part_one() -> String {
        var total = 0

        input.enumerateLines { line, _ in
            let match = line.firstMatch(of: /Game (\d+): (.+)/)!

            if self.isValidGame(game: match.2) {
                let id = Int(match.1)!

                total += id
            }
        }

        return total.formatted()
    }

    func isValidGame(game: Substring) -> Bool {
        let colours = [
            ("red", 12),
            ("green", 13),
            ("blue", 14),
        ]

        for (colour, maxCount) in colours {
            let anyAboveMax = game.matches(of: colourRegex(colour)).contains { match in
                Int(match.1)! > maxCount
            }

            if anyAboveMax { return false }
        }

        return true
    }

    func colourRegex(_ colour: String) -> Regex<(Substring, Substring)> {
        Regex {
            Capture {
                OneOrMore {
                    .digit
                }
            }
            " "
            colour
        }
    }

    public func part_two() -> String {
        var total = 0

        input.enumerateLines { line, _ in
            let match = line.firstMatch(of: /Game (\d+): (.+)/)!

            total += self.minCubes(game: match.2).values.reduce(1) { x, y in x * y }
        }

        return total.formatted()
    }

    func minCubes(game: Substring) -> [String: Int] {
        var minCubes = [
            "red": 0,
            "green": 0,
            "blue": 0,
        ]

        for colour in minCubes.keys {
            for match in game.matches(of: colourRegex(colour)) {
                minCubes[colour] = max(minCubes[colour]!, Int(match.1)!)
            }
        }

        return minCubes
    }
}
