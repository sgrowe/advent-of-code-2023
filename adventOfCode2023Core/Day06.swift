//
//  Day06.swift
//  adventOfCode2023Core
//
//  Created by Samuel Rowe on 13/12/2023.
//

import Foundation

typealias Race = (duration: Int, record: Int)

public class Day06: AOCDayProtocol {
    public static var num = 6

    private let races: [Race]

    private let part_two_race: Race

    public required init(input: String) {
        var times: [Int] = []
        var records: [Int] = []
        var part_two_duration = 0
        var part_two_record = 0

        input.enumerateLines { line, _ in
            if line.starts(with: "Time:") {
                let parts = line.trimmingPrefix("Time:").split(separator: /\s+/)

                times = parts.compactMap { Int($0) }

                part_two_duration = Int(parts.joined())!
            }

            if line.starts(with: "Distance:") {
                let parts = line.trimmingPrefix("Distance:").split(separator: /\s+/)

                records = parts.compactMap { Int($0) }

                part_two_record = Int(parts.joined())!
            }
        }

        races = zip(times, records).map { a, b in (duration: a, record: b) }

        part_two_race = (
            duration: part_two_duration,
            record: part_two_record
        )
    }

    public func part_one() -> String {
        var total = 1

        for race in races {
            total *= winning_options(race: race)
        }

        return total.formatted()
    }

    public func part_two() -> String {
        winning_options(race: part_two_race).formatted()
    }
}

private func distance_travelled(hold_button_for: Int, race_duration: Int) -> Int {
    let travel_time = race_duration - hold_button_for

    return hold_button_for * travel_time
}

private func winning_options(race: Race) -> Int {
    var options = 0

    for x in 1 ..< race.duration {
        if distance_travelled(hold_button_for: x, race_duration: race.duration) > race.record {
            options += 1
        }
    }

    return options
}
