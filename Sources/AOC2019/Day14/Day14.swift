import Foundation
import AOCHelper

struct NanoFactory {

    struct Chemical: Hashable, CustomDebugStringConvertible {

        static func create(from raw: String) -> Chemical {
            let components = raw.trimmingCharacters(in: .whitespacesAndNewlines)
                .components(separatedBy: " ")
            assert(components.count == 2)
            return Chemical(count: Int(components[0])!, art: components[1])
        }

        let count: Int
        let art: String

        var isBase: Bool {
            art == "ORE"
        }

        var isFuel: Bool {
            art == "FUEL"
        }

        var debugDescription: String {
            "\(count) \(art)"
        }
    }

    struct Reaction: CustomDebugStringConvertible {
        let inputs: [Chemical]
        let output: Chemical
        var debugDescription: String {
            let tmp = self.inputs.map({ $0.debugDescription }).joined(separator: ", ")
            return "\(tmp) => \(output)"
        }

        static func create(from raw: String) -> Reaction {
            let tmp = raw.components(separatedBy: "=>")
            assert(tmp.count == 2)
            let rawInput = tmp[0]
            let rawOutput = tmp[1]

            let inputs = rawInput.components(separatedBy: ",")
                .map { Chemical.create(from: $0) }
            let output = Chemical.create(from: rawOutput)

            return Reaction(inputs: inputs, output: output)
        }
    }

    let input: String
    var reactions = [Reaction]()

    mutating func parse() {
        reactions =  input.split(separator: "\n")
            .map { Reaction.create(from: String($0)) }
    }

    func getNumInputs() -> Int {
        let lastReaction = reactions.first { $0.output.art == "FUEL" }
        var depot = [Chemical: Int]()
        return count(of: lastReaction!, count: 1)
    }

    func count(of reaction: Reaction, count: Int) -> Int {
        var depot = [Chemical: Int]()
        var count = count / reaction.output.count
        print(reaction)
        for input in reaction.inputs {
            print(input)
//            count *= input.count
            if input.isBase {
//                count += input.count
                return count
            }
            let newReaction = reactions.first { $0.output.art == input.art }
            print(count)
            print()

            var store = depot[input, default: 0]
            store -= input.count
            while store < 0 {
                count += self.count(of: newReaction!, count: count)
                store += newReaction!.output.count
            }
            depot[input] = store
        }
        return count
    }
}
