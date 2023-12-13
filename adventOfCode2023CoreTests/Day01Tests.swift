//
//  DayOneTests.swift
//  adventOfCode2023CoreTests
//
//  Created by Samuel Rowe on 03/12/2023.
//

@testable import adventOfCode2023Core
import XCTest

final class DayOneTests: XCTestCase {
    func testPartOne() throws {
        let solver = DayOne(input: """
        1abc2
        pqr3stu8vwx
        a1b2c3d4e5f
        treb7uchet
        """)
        
        XCTAssertEqual(solver.part_one(), "142")
    }
    
    func testPartOneSolution() throws {
        let solver = try DayOne(input: DayOne.readInput())
        
        XCTAssertEqual(solver.part_one(), "55,002")
    }
    
    func testPartTwo() throws {
        let solver = DayOne(input: """
        two1nine
        eightwothree
        abcone2threexyz
        xtwone3four
        4nineeightseven2
        zoneight234
        7pqrstsixteen
        """)
        
        XCTAssertEqual(solver.calibrationValue2(line: "two1nine"), 29)
        XCTAssertEqual(solver.calibrationValue2(line: "eightwothree"), 83)
        XCTAssertEqual(solver.calibrationValue2(line: "zoneight234"), 14)
        
        XCTAssertEqual(solver.part_two(), "281")
    }
    
    func testPartTwoSolution() throws {
        let solver = try DayOne(input: DayOne.readInput())
        
        XCTAssertEqual(solver.part_two(), "55,093")
    }
}
