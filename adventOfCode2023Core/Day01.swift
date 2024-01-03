//
//  Day01.swift
//  adventOfCode2023Core
//
//  Created by Samuel Rowe on 03/12/2023.
//

import Foundation

public class Day01: AOCDayProtocol {
    private let input: String
    
    public static let num = 1
    
    public required init(input: String) {
        self.input = input
    }
    
    public func part_one() -> String {
        var total = 0
        
        input.enumerateLines { line, _ in
            total += self.calibrationValue(line: line)
        }
        
        return total.formatted()
    }
    
    func calibrationValue(line: String) -> Int {
        var first_num = 0
        var is_first = true
        var last_num = 0
        
        for char in line {
            if let int = char.wholeNumberValue {
                last_num = int
                
                if is_first {
                    first_num = int
                    is_first = false
                }
            }
        }
        
        return (first_num * 10) + last_num
    }
    
    public func part_two() -> String {
        var total = 0
        
        input.enumerateLines { line, _ in
            total += self.calibrationValue2(line: line)
        }
        
        return total.formatted()
    }
    
    let digits = [
        "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"
    ]
    
    func calibrationValue2(line: String) -> Int {
        var first_num = 0
        var is_first = true
        var last_num = 0
        
        for index in line.indices {
            if let int = intFromSubstring(line[index...]) {
                last_num = int
                
                if is_first {
                    first_num = int
                    is_first = false
                }
            }
        }
        
        return (first_num * 10) + last_num
    }
    
    func intFromSubstring(_ l: String.SubSequence) -> Int? {
        let char = l[l.startIndex]
        
        if let int = char.wholeNumberValue {
            return int
        } else if let index = digits.firstIndex(where: { l.hasPrefix($0) }) {
            return index + 1
        }
        
        return Optional.none
    }
}
