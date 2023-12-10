//
//  AOCDayProtocol.swift
//  adventOfCode2023Core
//
//  Created by Samuel Rowe on 05/12/2023.
//

import Foundation

public protocol AOCDayProtocol: AnyObject {
    init(input: String)

    static var name: String { get }

    func part_one() -> String

    func part_two() -> String
}

public extension AOCDayProtocol {
    static func readInput() throws -> String {
        let resourceName = "day\(Self.name.capitalized)"

        let path = Bundle(for: Self.self)
            .path(forResource: resourceName, ofType: "txt", inDirectory: "inputs")

        return try String(contentsOfFile: path!)
    }
}
