//
//  DayThree.swift
//  adventOfCode2023Core
//
//  Created by Samuel Rowe on 10/12/2023.
//

import Foundation

public class DayThree: AOCDayProtocol {
    let lines: [[Character]]
    
    public static let num = 3
    
    public required init(input: String) {
        var linesMut: [[Character]] = []
        
        input.enumerateLines { line, _ in
            linesMut.append(Array(line))
        }
        
        lines = linesMut
    }
    
    func isNextToSymbol(_ line: Int, _ range: ClosedRange<Int>) -> Bool {
        let lower = max(range.lowerBound - 1, 0)
        let upper = min(range.upperBound + 1, lines[0].count - 1)
        
        let symbolsRange = lower ... upper
        
        for lineIndex in linesRange(line) {
            let line = lines[lineIndex]
            
            for i in symbolsRange {
                let c = line[i]
                
                if c != "." && !c.isNumber {
                    return true
                }
            }
        }
        
        return false
    }
    
    func linesRange(_ line: Int) -> ClosedRange<Int> {
        let lineLower = max(line - 1, 0)
        let lineUpper = min(line + 1, lines.count - 1)
        
        return lineLower ... lineUpper
    }
    
    public func part_one() -> String {
        var total = 0
        
        for lineIndex in 0 ..< lines.count {
            let l = lines[lineIndex]
            
            var charIndex = 0
            
            while charIndex < l.count {
                if l[charIndex].isNumber {
                    var nextIndex = charIndex + 1
                    
                    while nextIndex < l.count && l[nextIndex].isNumber {
                        nextIndex += 1
                    }
                    
                    let charsRange = charIndex ... nextIndex - 1
                    
                    if isNextToSymbol(lineIndex, charsRange) {
                        let number = Int(String(l[charsRange]))!
                        
                        total += number
                    }
                    
                    charIndex = nextIndex
                }
                
                charIndex += 1
            }
        }
        
        return total.formatted()
    }
    
    public func part_two() -> String {
        var total = 0
        
        for lineIndex in 0 ..< lines.count {
            let l = lines[lineIndex]
            
            var charIndex = 0
            
            while charIndex < l.count {
                if let (a, b) = isGear(lineIndex, charIndex) {
                    total += a * b
                }
                
                charIndex += 1
            }
        }
        
        return total.formatted()
    }
    
    func isGear(_ lineIndex: Int, _ charIndex: Int) -> (Int, Int)? {
        if lines[lineIndex][charIndex] != "*" {
            return nil
        }
        
        var adjacentParts: [Int] = []
        
        for i in linesRange(lineIndex) {
            let line = lines[i]
            
            let lower = max(charIndex - 1, 0)
            let upper = min(charIndex + 1, line.count - 1)
            
            let charRange = lower ... upper
            
            var j = charRange.lowerBound
            
            while charRange.contains(j) {
                if let range = getNumberCharsRange(i, j) {
                    let n = Int(String(line[range]))!
                    
                    j = range.upperBound + 1
                    
                    adjacentParts.append(n)
                }
                
                j += 1
            }
        }
        
        if adjacentParts.count == 2 {
            return (adjacentParts[0], adjacentParts[1])
        }
        
        return nil
    }
    
    func getNumberCharsRange(_ lineIndex: Int, _ charIndex: Int) -> ClosedRange<Int>? {
        let line = lines[lineIndex]
        
        if !line[charIndex].isNumber { return nil }
        
        var start = charIndex
        var end = charIndex
        
        while start - 1 >= 0 && line[start - 1].isNumber {
            start -= 1
        }
        
        while (end + 1) < line.count && line[end + 1].isNumber {
            end += 1
        }
        
        return start ... end
    }
}
