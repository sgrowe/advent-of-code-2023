//
//  Day08.swift
//  adventOfCode2023Core
//
//  Created by Samuel Rowe on 17/12/2023.
//

import Foundation

private enum Step {
    case Left
    case Right
}

public class Day08: AOCDayProtocol {
    public static var num = 8

    private let steps: [Step]
    private let network: [Node: (left: Node, right: Node)]

    public required init(input: String) {
        var isFirst = true

        var _steps: [Step] = []
        var _network: [Node: (left: Node, right: Node)] = [:]

        input.enumerateLines { line, _ in
            if isFirst {
                isFirst = false
                _steps = parseSteps(line)
                return
            }

            if line.isEmpty {
                return
            }

            let (node, connections) = parseNetworkNode(line)

            _network[node] = connections
        }

        self.steps = _steps
        self.network = _network
    }

    public func part_one() -> String {
        var numSteps = 1

        var cur = Node("AAA")
        let end = Node("ZZZ")

        while true {
            for step in steps {
                cur = nextNode(cur, step)

                if cur == end {
                    return numSteps.formatted()
                }

                numSteps += 1
            }
        }
    }

    private func nextNode(_ cur: Node, _ step: Step) -> Node {
        let next = network[cur]!

        switch step {
        case .Left:
            return next.left
        case .Right:
            return next.right
        }
    }

    public func part_two() -> String {
        var numSteps = 1

        var curNodes = network.keys.filter { $0.isStart() }

        while true {
            for step in steps {
                var i = 0
                var endpoint = true

                while i < curNodes.count {
                    let next = nextNode(curNodes[i], step)

                    endpoint = endpoint && next.isEnd()

                    curNodes[i] = next

                    i += 1
                }

                if endpoint {
                    return numSteps.formatted()
                }

                numSteps += 1
            }
        }
    }
}

private func parseSteps(_ line: String) -> [Step] {
    line.map {
        switch $0 {
        case "L":
            return .Left
        case "R":
            return .Right
        default:
            fatalError()
        }
    }
}

private func parseNetworkNode(_ line: String) -> (Node, (left: Node, right: Node)) {
    let match = line.wholeMatch(of: /(\w{3}) = \((\w{3}), (\w{3})\)/)!

    return (
        Node(match.1),
        (left: Node(match.2), right: Node(match.3))
    )
}

struct Node: Equatable, Hashable {
    private let a: Character
    private let b: Character
    private let c: Character

    init(_ s: Substring) {
        let chars = Array(s)

        self.a = chars[0]
        self.b = chars[1]
        self.c = chars[2]
    }

    func isStart() -> Bool {
        c == "A"
    }

    func isEnd() -> Bool {
        c == "Z"
    }
}
