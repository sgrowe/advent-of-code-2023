//
//  DayOne.swift
//  adventOfCode2023Core
//
//  Created by Samuel Rowe on 03/12/2023.
//

import Foundation

class DayOne {
    let input: String
    
    init(input: String) {
        self.input = input
    }
    
    func part_one() -> String {
        var total = 0
        
        input.enumerateLines { line, _ in
            let c = self.calibrationValue(line: line)
            print("\(c)")
            total += c
        }
        
        return total.formatted()
    }
    
    private func calibrationValue(line: String) -> Int {
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
}
