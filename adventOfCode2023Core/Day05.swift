//
//  Day05.swift
//  adventOfCode2023Core
//
//  Created by Samuel Rowe on 10/12/2023.
//

import Foundation

public class DayFive: AOCDayProtocol {
    var seeds: [Int] = []
    var mappings: [[Mapping]] = []

    public static let num = 5

    public required init(input: String) {
        input.enumerateLines { line, _ in
            if line.isEmpty { return }

            if let match = line.wholeMatch(of: /seeds: ([\d ]+)/) {
                self.seeds = match.1.split(separator: " ").compactMap { Int($0) }
                return
            }

            if let match = line.wholeMatch(of: /(\d+) (\d+) (\d+)/) {
                let i = self.mappings.count - 1
                var mapping = self.mappings[i]

                mapping.append(Mapping(toStart: Int(match.1)!, fromStart: Int(match.2)!, range: Int(match.3)!))

                self.mappings[i] = mapping

                return
            }

            if line.wholeMatch(of: /[\w-]+ map:/) != nil {
                self.mappings.append([])
                return
            }

            fatalError("Unhandled line: \(line)")
        }
    }

    public func part_one() -> String {
        seeds.lazy.map { self.location_for_seed(seed: $0) }.min()!.formatted()
    }

    func location_for_seed(seed: Int) -> Int {
        var x = seed

        for m in mappings {
            x = mapToOutput(map: m, value: x)
        }

        return x
    }

    func location_for_seed_optimised(seed: Int, upperBound: Int) -> (Int, Int) {
        var x = seed
        var maxDiff = upperBound - seed

        for m in mappings {
            let (output, upper) = mapToOutputWithUpperBound(map: m, value: x)

            maxDiff = min(maxDiff, upper - x)

            x = output
        }

        return (x, maxDiff)
    }

    public func part_two() -> String {
        var minLocation = Int.max

        for range in seedRanges() {
            var i = range.lowerBound

            while range.contains(i) {
                let (location, maxDiff) = location_for_seed_optimised(seed: i, upperBound: range.upperBound)

                minLocation = min(minLocation, location)

                i += max(maxDiff, 1)
            }
        }

        return minLocation.formatted()
    }

    func seedRanges() -> [ClosedRange<Int>] {
        var ranges: [ClosedRange<Int>] = []

        var i = 0

        while i < seeds.count {
            let lower = seeds[i]
            let range = seeds[i + 1]
            ranges.append(lower ... lower + range)

            i += 2
        }

        return ranges
    }
}

func mapToOutput(map: [Mapping], value: Int) -> Int {
    for r in map {
        if let output = r.toOutput(value) {
            return output
        }
    }

    return value
}

func mapToOutputWithUpperBound(map: [Mapping], value: Int) -> (Int, Int) {
    for r in map {
        if let output = r.toOutput(value) {
            return (output, r.from.upperBound)
        }
    }

    let next = map.lazy.map { $0.from.lowerBound }.filter { $0 > value }.min() ?? value

    return (value, next)
}

struct Mapping {
    let from: ClosedRange<Int>
    let toStart: Int

    init(toStart: Int, fromStart: Int, range: Int) {
        from = fromStart ... (fromStart + range)
        self.toStart = toStart
    }

    public func toOutput(_ x: Int) -> Int? {
        if from.contains(x) {
            return x - from.lowerBound + toStart
        }

        return nil
    }
}
