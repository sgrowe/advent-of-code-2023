//
//  Day06Tests.swift
//  adventOfCode2023CoreTests
//
//  Created by Samuel Rowe on 13/12/2023.
//

@testable import adventOfCode2023Core
import XCTest

final class Day06Tests: XCTestCase {
    func testPartOneExample() throws {
        let solver = Day06(input: """
        Time:      7  15   30
        Distance:  9  40  200
        """)

        XCTAssertEqual(solver.part_one(), "288")
    }

    func testPartOneSolution() throws {
        let solver = try Day06.initFromInput()

        XCTAssertEqual(solver.part_one(), "170,000")
    }

    func testPartTwoExample() throws {
        let solver = Day06(input: """
        Time:      7  15   30
        Distance:  9  40  200
        """)

        XCTAssertEqual(solver.part_two(), "71,503")
    }

    func testPartTwoSolution() throws {
        let solver = try Day06.initFromInput()

        XCTAssertEqual(solver.part_two(), "20,537,782")
    }
}
