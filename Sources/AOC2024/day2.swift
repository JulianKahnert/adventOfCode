
private func isValidReport1(_ report: [Int]) -> Bool {
    let derivation = zip(report.dropFirst(), report).map { $0 - $1 }
    
    let allIncreasing = derivation.allSatisfy { $0 > 0 }
    let allDecreasing = derivation.allSatisfy { $0 < 0 }
    
    let rangeFits = derivation.allSatisfy { (0...3).contains(abs($0)) }

    return (allIncreasing || allDecreasing) && rangeFits
}

private func isValidReport2(_ report: [Int]) -> Bool {
    if isValidReport1(report) {
        return true
    } else {
        for index in 0..<report.count {
            var tmpReport: [Int?] = report
            tmpReport[index] = nil
            let newReport = tmpReport.compactMap { $0 }
            if isValidReport1(newReport) {
                return true
            }
        }
        return false
    }
}

func day2Part1(_ input: String) -> Int {
    let reports = input.split(separator: "\n")
    let validReports = reports.map { report in
        report.split(separator: " ").map { Int($0)! }
    }
        .filter(isValidReport1(_:))

    return validReports.count
}

func day2Part2(_ input: String) -> Int {
    let reports = input.split(separator: "\n")
    let validReports = reports.map { report in
        report.split(separator: " ").map { Int($0)! }
    }
        .filter(isValidReport2(_:))

    return validReports.count
}
