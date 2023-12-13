//
//  Day05Tests.swift
//  adventOfCode2023CoreTests
//
//  Created by Samuel Rowe on 10/12/2023.
//

@testable import adventOfCode2023Core
import XCTest

final class Day05Tests: XCTestCase {
    func withTestInput() -> DayFive {
        DayFive(input: """
        seeds: 79 14 55 13

        seed-to-soil map:
        50 98 2
        52 50 48

        soil-to-fertilizer map:
        0 15 37
        37 52 2
        39 0 15

        fertilizer-to-water map:
        49 53 8
        0 11 42
        42 0 7
        57 7 4

        water-to-light map:
        88 18 7
        18 25 70

        light-to-temperature map:
        45 77 23
        81 45 19
        68 64 13

        temperature-to-humidity map:
        0 69 1
        1 0 69

        humidity-to-location map:
        60 56 37
        56 93 4
        """)
    }

    func testPartOne() throws {
        let solver = withTestInput()

        XCTAssertEqual(solver.location_for_seed(seed: 79), 82)
        XCTAssertEqual(solver.location_for_seed(seed: 14), 43)
        XCTAssertEqual(solver.location_for_seed(seed: 55), 86)
        XCTAssertEqual(solver.location_for_seed(seed: 13), 35)

        XCTAssertEqual(solver.part_one(), "35")
    }

    func testPartOneSolution() throws {
        let solver = try DayFive(input: DayFive.readInput())

        XCTAssertEqual(solver.part_one(), "379,811,651")
    }

    func testPartTwo() throws {
        let solver = withTestInput()

        XCTAssertEqual(solver.part_two(), "46")
    }

    func testPartTwoSolution() throws {
        let solver = try DayFive(input: DayFive.readInput())

        XCTAssertEqual(solver.part_two(), "27,992,443")
    }
}
