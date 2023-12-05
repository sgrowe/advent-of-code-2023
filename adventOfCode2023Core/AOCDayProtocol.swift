//
//  AOCDayProtocol.swift
//  adventOfCode2023Core
//
//  Created by Samuel Rowe on 05/12/2023.
//

import Foundation

public protocol AOCDayProtocol {
    init(input: String)

    static var name: String { get }

    func part_one() -> String

    func part_two() -> String
}
