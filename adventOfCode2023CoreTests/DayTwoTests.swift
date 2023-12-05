//
//  DayTwoTests.swift
//  adventOfCode2023CoreTests
//
//  Created by Samuel Rowe on 05/12/2023.
//

@testable import adventOfCode2023Core
import XCTest

final class DayTwoTests: XCTestCase {
    func input() throws -> String {
        let path = Bundle(for: DayTwo.self).path(forResource: "dayTwo", ofType: "txt", inDirectory: "inputs")

        return try String(contentsOfFile: path!)
    }

    func testPartOne() throws {
        let solver = DayTwo(input: """
        Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
        Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
        Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
        Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
        Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
        """)
        
        XCTAssertEqual(solver.part_one(), "8")
    }
    
    func testPartOneSolution() throws {
        let solver = DayTwo(input: try input())
        
        XCTAssertEqual(solver.part_one(), "3,035")
    }
    
    func testPartTwo() throws {
        let solver = DayTwo(input: """
        Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
        Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
        Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
        Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
        Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
        """)
        
        XCTAssertEqual(solver.part_two(), "2,286")
    }
}
