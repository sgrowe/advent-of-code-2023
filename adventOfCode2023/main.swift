//
//  main.swift
//  adventOfCode2023
//
//  Created by Samuel Rowe on 03/12/2023.
//

import adventOfCode2023Core
import Foundation

let days: [AOCDayProtocol.Type] = [
    Day01.self,
    Day02.self,
    Day03.self,
    Day04.self,
    Day05.self,
    Day06.self,
    Day07.self,
    Day08.self,
]

for day in days {
    try solveDay(day)
}

func solveDay(_ day: AOCDayProtocol.Type) throws {
    let solver = try day.initFromInput()

    print("")
    print("Day \(day.num) part one: \(solver.part_one())")
    print("Day \(day.num) part two: \(solver.part_two())")
    print("------------------")
}
