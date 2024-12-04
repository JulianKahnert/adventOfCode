
func day1Part1(_ input: String) -> Int {
    let lists = input.split(separator: "\n")
        .reduce(into: [[Int]](), { partialResult, line in
            let parts = line.split(separator: "   ")
            let part1 = parts[0]
            let part2 = parts[1]
            
            partialResult.append([Int(part1)!, Int(part2)!])
        })

    let sortedList1 = lists.compactMap(\.first).sorted()
    let sortedList2 = lists.compactMap(\.last).sorted()
    
    var value = 0
    for (list1item, list2item) in zip(sortedList1, sortedList2) {
        let valueToAdd = abs(list1item - list2item)
        print(valueToAdd)
        value += valueToAdd
    }
    
    return value
}

func day1Part2(_ input: String) -> Int {
    let lists = input.split(separator: "\n")
        .reduce(into: [[Int]](), { partialResult, line in
            let parts = line.split(separator: "   ")
            let part1 = parts[0]
            let part2 = parts[1]
            
            partialResult.append([Int(part1)!, Int(part2)!])
        })

    let list1 = lists.compactMap(\.first)
    let list2Dict = Dictionary(grouping: lists.compactMap(\.last), by: { $0 })
    
    
    
    var value = 0
    for item in list1 {
        let itemCount = list2Dict[item]?.count ?? 0
        let valueToAdd = item * itemCount
        print(valueToAdd)
        value += valueToAdd
    }
    
    return value
}
