import Foundation

func calcFuel(of weight: Double) -> Double {
    (floor(weight / 3.0)) - 2.0
}

func part1() -> Double {
	var sum = 0.0
    for value in values {
        sum += calcFuel(of: Double(value))
    }
    return sum
}

func part2() -> Double {
	var sum2 = 0.0
    for value in values {
        var tmp = calcFuel(of: Double(value))
        while tmp > 0 {
            sum2 += tmp
            tmp = calcFuel(of: tmp)
        }
    }
    return sum2
}
