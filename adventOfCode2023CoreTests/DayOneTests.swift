//
//  DayOneTests.swift
//  adventOfCode2023CoreTests
//
//  Created by Samuel Rowe on 03/12/2023.
//

@testable import adventOfCode2023Core
import XCTest

final class DayOneTests: XCTestCase {
    var solver: DayOne!

    override func setUpWithError() throws {
        solver = DayOne(input: """
        1abc2
        pqr3stu8vwx
        a1b2c3d4e5f
        treb7uchet
        """)
    }

    override func tearDownWithError() throws {
        solver = nil
    }

    func testPartOne() throws {
        XCTAssertEqual(solver.part_one(), "142")
    }
}
