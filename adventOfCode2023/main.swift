//
//  main.swift
//  adventOfCode2023
//
//  Created by Samuel Rowe on 03/12/2023.
//

import adventOfCode2023Core
import Foundation

let days: [AOCDayProtocol.Type] = [
    DayOne.self,
    DayTwo.self,
    DayThree.self,
    DayFour.self,
    DayFive.self,
    Day06.self,
]

for day in days {
    try solveDay(day)
}

func solveDay(_ day: AOCDayProtocol.Type) throws {
    let solver = try day.init(input: day.readInput())

    print("")
    print("Day \(day.num) part one: \(solver.part_one())")
    print("Day \(day.num) part two: \(solver.part_two())")
    print("------------------")
}
