//
//  main.swift
//  adventOfCode2023
//
//  Created by Samuel Rowe on 03/12/2023.
//

import adventOfCode2023Core
import Foundation

let path = Bundle(for: DayOne.self).path(forResource: "dayOne", ofType: "txt", inDirectory: "inputs")

let input = try String(contentsOfFile: path!)

let dayOne = DayOne(input: input)

print("Day one part one: \(dayOne.part_one())")
