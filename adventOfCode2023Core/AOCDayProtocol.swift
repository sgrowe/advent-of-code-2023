//
//  AOCDayProtocol.swift
//  adventOfCode2023Core
//
//  Created by Samuel Rowe on 05/12/2023.
//

import Foundation

public protocol AOCDayProtocol: AnyObject {
    init(input: String)

    static var num: Int { get }

    func part_one() -> String

    func part_two() -> String
}

public extension AOCDayProtocol {
    private static func readInput() throws -> String {
        var name = Self.num.formatted()

        if name.count < 2 {
            name = "0" + name
        }

        let resourceName = "day\(name)"

        let path = Bundle(for: Self.self)
            .path(forResource: resourceName, ofType: "txt", inDirectory: "inputs")

        return try String(contentsOfFile: path!)
    }

    static func initFromInput() throws -> Self {
        try Self(input: readInput())
    }
}
