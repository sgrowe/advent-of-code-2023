//
//  Day03Tests.swift
//  adventOfCode2023CoreTests
//
//  Created by Samuel Rowe on 10/12/2023.
//

@testable import adventOfCode2023Core
import XCTest

final class Day03Tests: XCTestCase {
    func testIsNextToSymbol() {
        let solver = Day03(input: """
        467..114..
        ...*......
        ..35..633.
        ......#...
        617*......
        .....+.58.
        ..592.....
        ......755.
        ...$.*....
        .664.598..
        """)
        
        XCTAssertFalse(solver.isNextToSymbol(0, 0 ... 1))
        XCTAssert(solver.isNextToSymbol(0, 0 ... 2))
        XCTAssert(solver.isNextToSymbol(6, 2 ... 5))
        XCTAssertFalse(solver.isNextToSymbol(5, 7 ... 8))
        XCTAssertFalse(solver.isNextToSymbol(0, 5 ... 7))
    }
    
    func testPartOne() throws {
        let solver = Day03(input: """
        467..114..
        ...*......
        ..35..633.
        ......#...
        617*......
        .....+.58.
        ..592.....
        ......755.
        ...$.*....
        .664.598..
        """)
        
        XCTAssertEqual(solver.part_one(), "4,361")
    }
    
    func testPartOneSolution() throws {
        let solver = try Day03.initFromInput()
        
        XCTAssertEqual(solver.part_one(), "553,825")
    }
    
    func testIsGear() throws {
        let solver = Day03(input: """
        467..114..
        ...*......
        ..35..633.
        ......#...
        617*......
        .....+.58.
        ..592.....
        ......755.
        ...$.*....
        .664.598..
        """)
        
        XCTAssertNil(solver.isGear(4, 3))
        
        XCTAssertEqual(solver.isGear(1, 3)?.0, 467)
        XCTAssertEqual(solver.isGear(1, 3)?.1, 35)
        
        XCTAssertEqual(solver.isGear(8, 5)?.0, 755)
        XCTAssertEqual(solver.isGear(8, 5)?.1, 598)
    }
    
    func testPartTwo() throws {
        let solver = Day03(input: """
        467..114..
        ...*......
        ..35..633.
        ......#...
        617*......
        .....+.58.
        ..592.....
        ......755.
        ...$.*....
        .664.598..
        """)
        
        XCTAssertEqual(solver.part_two(), "467,835")
    }
    
    func testPartSolution() throws {
        let solver = try Day03.initFromInput()
        
        XCTAssertEqual(solver.part_two(), "93,994,191")
    }
}
