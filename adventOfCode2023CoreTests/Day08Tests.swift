//
//  Day08Tests.swift
//  adventOfCode2023CoreTests
//
//  Created by Samuel Rowe on 17/12/2023.
//

@testable import adventOfCode2023Core
import XCTest

final class Day08Tests: XCTestCase {
    func testPartOneExampleOne() throws {
        let solver = Day08(input: """
        RL

        AAA = (BBB, CCC)
        BBB = (DDD, EEE)
        CCC = (ZZZ, GGG)
        DDD = (DDD, DDD)
        EEE = (EEE, EEE)
        GGG = (GGG, GGG)
        ZZZ = (ZZZ, ZZZ)
        """)

        XCTAssertEqual(solver.part_one(), "2")
    }

    func testPartOneExampleTwo() throws {
        let solver = Day08(input: """
        LLR

        AAA = (BBB, BBB)
        BBB = (AAA, ZZZ)
        ZZZ = (ZZZ, ZZZ)
        """)

        XCTAssertEqual(solver.part_one(), "6")
    }

    func testPartOneSolution() throws {
        let solver = try Day08.initFromInput()

        XCTAssertEqual(solver.part_one(), "15,871")
    }

    func testPartTwoExample() throws {
        let solver = Day08(input: """
        LR

        11A = (11B, XXX)
        11B = (XXX, 11Z)
        11Z = (11B, XXX)
        22A = (22B, XXX)
        22B = (22C, 22C)
        22C = (22Z, 22Z)
        22Z = (22B, 22B)
        XXX = (XXX, XXX)
        """)

        XCTAssertEqual(solver.part_two(), "6")
    }
}
