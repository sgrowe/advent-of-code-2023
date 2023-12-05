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
]

for day in days {
    try solveDay(day: day)
}

func solveDay(day: AOCDayProtocol.Type) throws {
    let resourceName = "day\(day.name.capitalized)"

    let path = Bundle(for: DayOne.self)
        .path(forResource: resourceName, ofType: "txt", inDirectory: "inputs")

    let input = try String(contentsOfFile: path!)

    let solver = day.init(input: input)

    print("")
    print("Day \(day.name) part one: \(solver.part_one())")
    print("Day \(day.name) part two: \(solver.part_two())")
    print("------------------")
}
