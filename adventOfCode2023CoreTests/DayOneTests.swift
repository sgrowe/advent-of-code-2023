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
        let path = Bundle(for: DayOne.self).path(forResource: "dayOne", ofType: "txt", inDirectory: "inputs")
        
        let input = try String(contentsOfFile: path!)
        
        let solver = DayOne(input: input)
        
        XCTAssertEqual(solver.part_one(), "55,002")
    }
}
