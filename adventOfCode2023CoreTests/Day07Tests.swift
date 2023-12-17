//
//  Day07Tests.swift
//  adventOfCode2023CoreTests
//
//  Created by Samuel Rowe on 16/12/2023.
//

@testable import adventOfCode2023Core
import XCTest

final class Day07Tests: XCTestCase {
    func testPartOneExample() throws {
        let solver = Day07(input: """
        32T3K 765
        T55J5 684
        KK677 28
        KTJJT 220
        QQQJA 483
        """)

        XCTAssertEqual(solver.part_one(), "6,440")
    }

    func testPartOneSolution() throws {
        let solver = try Day07.initFromInput()

        XCTAssertEqual(solver.part_one(), "250,232,501")
    }
    
    func testPartTwoExample() throws {
        let solver = Day07(input: """
        32T3K 765
        T55J5 684
        KK677 28
        KTJJT 220
        QQQJA 483
        """)

        XCTAssertEqual(solver.part_two(), "5,905")
    }
    
    
    func testPartTwoSolution() throws {
        let solver = try Day07.initFromInput()

        XCTAssertEqual(solver.part_two(), "249,138,943")
    }
}
