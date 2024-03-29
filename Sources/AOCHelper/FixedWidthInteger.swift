//
//  FixedWidthInteger.swift
//  
//
//  Created by Julian Kahnert on 05.12.19.
//
// Source: https://github.com/davedelong/AOC

import Foundation

extension FixedWidthInteger {

    public var digits: [Self] {
        var d = [Self]()
        var remainder = self
        if remainder < 0 { remainder *= -1 }

        while remainder > 0 {
            let m = remainder % 10
            d.append(m)
            remainder /= 10
        }
        return Array(d.reversed())
    }

}

public func lcm<I: FixedWidthInteger>(_ values: I ...) -> I {
    return lcm(of: values)
}

public func lcm<C: Collection>(of values: C) -> C.Element where C.Element: FixedWidthInteger {
    let v = values.first!
    let r = values.dropFirst()
    if r.isEmpty { return v }

    let lcmR = lcm(of: r)
    return v / gcd(v, lcmR) * lcmR
}

public func gcd<I: FixedWidthInteger>(_ m: I, _ n: I) -> I {
    var a: I = 0
    var b: I = max(m, n)
    var r: I = min(m, n)
    while r != 0 {
        a = b
        b = r
        r = a % b
    }
    return b
}
