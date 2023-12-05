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

    public static let name = "two"

    public required init(input: String) {
        self.input = input
    }

    public func part_one() -> String {
        var total = 0

        self.input.enumerateLines { line, _ in
            let match = line.firstMatch(of: /Game (\d+): (.+)/)!

            if self.isValidGame(game: match.2) {
                let id = Int(match.1)!

                total += id
            }
        }

        return total.formatted()
    }

    func isValidGame(game: String.SubSequence) -> Bool {
        let colours = [
            ("red", 12),
            ("green", 13),
            ("blue", 14),
        ]

        for (colour, maxCount) in colours {
            let pattern = Regex {
                Capture {
                    OneOrMore {
                        .digit
                    }
                }
                " "
                colour
            }

            let anyAboveMax = game.matches(of: pattern).contains { match in
                Int(match.1)! > maxCount
            }

            if anyAboveMax { return false }
        }

        return true
    }

    public func part_two() -> String {
        return ""
    }
}
