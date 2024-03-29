import XCTest
@testable import AOC2020

final class Day7Tests: XCTestCase {

    func testPart1() {
        let bags = parseBags(Self.testValuesPart1)
        let target = bags["shiny gold"]!

        let count = target.allParents.count
        XCTAssertEqual(count, 4)
    }

    func testResultPart1() {
        let bags = parseBags(Self.valuesPart1)
        let target = bags["shiny gold"]!

        let count = target.allParents.count
        XCTAssert(count < 240)
        XCTAssertNotEqual(count, 26)
        XCTAssertNotEqual(count, 63)
        XCTAssertNotEqual(count, 110)
        XCTAssertEqual(count, 169)
    }

    func testPart2() {
        let bags = parseBags(Self.testValuesPart2)
        let target = bags["shiny gold"]!

        let count = target.totalCount
        XCTAssertEqual(count, 126)
    }

    func testResultPart2() {
        let bags = parseBags(Self.valuesPart1)
        let target = bags["shiny gold"]!

        let count = target.totalCount
        XCTAssertEqual(count, 82372)
    }
}

extension Day7Tests {
    static let testValuesPart1: String = """
        light red bags contain 1 bright white bag, 2 muted yellow bags.
        dark orange bags contain 3 bright white bags, 4 muted yellow bags.
        bright white bags contain 1 shiny gold bag.
        muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
        shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
        dark olive bags contain 3 faded blue bags, 4 dotted black bags.
        vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
        faded blue bags contain no other bags.
        dotted black bags contain no other bags.
        """

    static let valuesPart1: String = """
        wavy green bags contain 1 posh black bag, 1 faded green bag, 4 wavy red bags.
        dotted chartreuse bags contain 1 light beige bag.
        dark white bags contain 2 dotted white bags.
        clear aqua bags contain 4 posh orange bags, 4 pale blue bags.
        faded green bags contain 2 plaid orange bags, 4 drab green bags, 4 pale aqua bags, 4 drab coral bags.
        drab lavender bags contain 2 shiny white bags, 2 muted orange bags, 1 mirrored crimson bag, 1 dotted aqua bag.
        dull maroon bags contain 1 plaid plum bag, 5 plaid orange bags, 4 posh maroon bags.
        pale lavender bags contain no other bags.
        plaid cyan bags contain 2 posh violet bags, 5 dim turquoise bags, 2 dark tomato bags.
        dull plum bags contain 5 muted red bags, 4 dotted salmon bags, 1 dull maroon bag.
        bright turquoise bags contain 2 dotted chartreuse bags, 3 dull tan bags, 4 light gray bags, 3 mirrored red bags.
        posh violet bags contain no other bags.
        faded coral bags contain 1 wavy teal bag, 4 wavy cyan bags.
        striped turquoise bags contain 3 bright gray bags, 4 bright bronze bags.
        muted magenta bags contain 5 light teal bags.
        dull lavender bags contain 3 clear orange bags, 3 pale cyan bags, 4 vibrant orange bags, 1 dim chartreuse bag.
        pale silver bags contain 3 faded olive bags.
        dull turquoise bags contain 4 light gray bags, 4 clear green bags, 2 dull aqua bags, 5 dim white bags.
        dim cyan bags contain 4 pale cyan bags, 2 dotted beige bags, 4 drab lime bags, 2 muted silver bags.
        wavy plum bags contain 2 drab bronze bags, 3 mirrored yellow bags, 3 vibrant beige bags.
        drab lime bags contain 5 muted plum bags.
        striped yellow bags contain 3 dark fuchsia bags, 1 clear lime bag, 5 faded turquoise bags.
        shiny cyan bags contain 4 clear maroon bags, 1 dim yellow bag, 5 drab red bags.
        bright maroon bags contain 2 shiny gray bags, 2 faded indigo bags, 5 muted tan bags.
        striped crimson bags contain 5 posh brown bags.
        pale green bags contain 1 pale red bag.
        shiny blue bags contain 2 clear red bags, 2 dark black bags, 3 dotted silver bags.
        mirrored lime bags contain 2 drab violet bags.
        mirrored maroon bags contain 4 faded salmon bags, 2 shiny blue bags, 1 pale coral bag.
        light bronze bags contain 2 clear red bags, 3 posh lavender bags, 1 clear purple bag, 5 plaid lavender bags.
        bright salmon bags contain 2 faded cyan bags, 1 striped blue bag, 1 faded crimson bag.
        faded red bags contain 4 dotted purple bags, 1 bright brown bag, 1 pale tan bag, 1 drab teal bag.
        pale indigo bags contain 3 pale orange bags, 5 muted bronze bags, 2 pale tan bags, 3 posh fuchsia bags.
        pale orange bags contain 2 dotted magenta bags, 5 clear plum bags, 3 dim olive bags, 1 mirrored yellow bag.
        drab gold bags contain 4 dotted cyan bags, 4 muted plum bags, 1 vibrant white bag, 4 dull green bags.
        mirrored teal bags contain 5 posh turquoise bags, 4 striped purple bags, 5 mirrored blue bags.
        dark chartreuse bags contain 1 striped crimson bag, 3 dull purple bags.
        posh olive bags contain 2 clear brown bags, 1 faded lavender bag.
        muted tan bags contain 1 striped red bag.
        drab olive bags contain 2 dim plum bags, 4 mirrored violet bags.
        faded lime bags contain 3 dark tomato bags.
        dim black bags contain 2 wavy purple bags, 5 mirrored fuchsia bags, 5 drab beige bags.
        dotted plum bags contain 2 shiny gold bags, 4 shiny beige bags, 1 clear red bag.
        striped red bags contain 5 pale tan bags, 5 pale lavender bags.
        drab green bags contain 1 faded silver bag, 3 vibrant plum bags, 2 wavy purple bags, 1 plaid blue bag.
        dull orange bags contain no other bags.
        posh tomato bags contain 5 dim gold bags, 2 drab coral bags, 4 drab maroon bags, 2 pale indigo bags.
        light turquoise bags contain 2 shiny violet bags, 1 dull violet bag.
        muted salmon bags contain 2 mirrored teal bags, 1 mirrored bronze bag.
        bright red bags contain 1 dotted orange bag, 2 faded gray bags, 2 dim white bags, 4 plaid tomato bags.
        dotted tan bags contain 3 clear red bags, 5 pale coral bags, 3 clear turquoise bags, 2 muted beige bags.
        muted gold bags contain 2 drab turquoise bags.
        pale magenta bags contain 3 dotted cyan bags, 4 mirrored lime bags, 2 shiny cyan bags.
        pale brown bags contain 2 dull silver bags, 3 wavy tomato bags.
        shiny lime bags contain 1 mirrored gold bag, 5 dull magenta bags, 5 shiny fuchsia bags.
        dark bronze bags contain 2 light green bags.
        light magenta bags contain 4 pale crimson bags, 3 drab plum bags.
        dark gray bags contain 5 light maroon bags.
        plaid orange bags contain 5 plaid gray bags, 1 dark tomato bag, 2 drab chartreuse bags, 4 clear red bags.
        posh purple bags contain 2 posh blue bags.
        drab turquoise bags contain 3 clear brown bags, 2 mirrored red bags, 2 muted green bags.
        dark fuchsia bags contain 4 light orange bags.
        dim lime bags contain 1 dotted olive bag, 5 posh blue bags, 3 dim gold bags, 2 drab lime bags.
        drab tan bags contain 4 clear violet bags.
        posh fuchsia bags contain 5 drab black bags, 4 plaid purple bags, 3 dim white bags.
        clear orange bags contain 5 muted tomato bags, 1 dotted white bag, 5 bright fuchsia bags.
        posh crimson bags contain 1 mirrored chartreuse bag, 4 pale gray bags.
        plaid tan bags contain 1 light orange bag.
        posh brown bags contain 1 clear lavender bag, 4 clear yellow bags.
        mirrored salmon bags contain 2 dotted plum bags, 5 plaid lavender bags, 4 drab olive bags, 5 shiny violet bags.
        striped bronze bags contain 5 light blue bags.
        dotted black bags contain 4 plaid coral bags, 2 drab maroon bags, 4 dotted red bags.
        light gray bags contain 3 posh magenta bags, 5 wavy coral bags, 2 vibrant red bags, 2 wavy olive bags.
        pale turquoise bags contain 2 light olive bags, 1 dark silver bag, 5 plaid yellow bags.
        striped fuchsia bags contain 3 wavy aqua bags.
        light teal bags contain 5 dotted turquoise bags, 5 muted tomato bags, 1 dotted gray bag, 1 pale lavender bag.
        wavy beige bags contain 5 dim gray bags, 4 bright aqua bags.
        light salmon bags contain 2 clear plum bags.
        shiny magenta bags contain 4 dim fuchsia bags.
        clear white bags contain 4 dim white bags.
        wavy gray bags contain 1 vibrant beige bag.
        plaid bronze bags contain 5 plaid plum bags, 3 drab olive bags, 2 drab green bags.
        drab plum bags contain 5 drab chartreuse bags, 5 plaid purple bags, 2 drab teal bags, 1 drab coral bag.
        dotted salmon bags contain 4 dim fuchsia bags, 4 striped cyan bags, 3 dotted white bags, 4 mirrored violet bags.
        striped magenta bags contain 1 faded teal bag, 1 drab red bag.
        posh magenta bags contain 4 faded green bags, 2 dull magenta bags.
        striped lavender bags contain 1 striped black bag, 4 wavy turquoise bags, 5 dull purple bags, 4 posh violet bags.
        mirrored lavender bags contain 1 wavy turquoise bag.
        dim violet bags contain 3 muted green bags, 1 striped plum bag, 4 dull coral bags, 4 wavy chartreuse bags.
        shiny tomato bags contain 3 bright red bags, 5 wavy beige bags, 5 faded blue bags, 3 muted black bags.
        wavy indigo bags contain 2 dull brown bags.
        dark tomato bags contain 2 drab olive bags.
        vibrant red bags contain 1 plaid tomato bag, 1 muted tomato bag.
        vibrant brown bags contain 4 shiny violet bags, 2 mirrored violet bags, 2 dark salmon bags, 5 faded turquoise bags.
        dim lavender bags contain 4 dim plum bags, 5 drab maroon bags, 3 dark black bags.
        dull lime bags contain 5 bright turquoise bags, 3 vibrant chartreuse bags, 1 pale gray bag.
        muted plum bags contain 4 plaid plum bags, 3 dim beige bags, 5 wavy magenta bags.
        wavy tan bags contain 3 wavy chartreuse bags, 5 clear orange bags, 2 light blue bags, 2 pale yellow bags.
        dim maroon bags contain 2 dull yellow bags, 4 shiny orange bags.
        clear violet bags contain 2 clear red bags, 1 plaid blue bag.
        dim orange bags contain 4 posh red bags, 3 posh plum bags.
        plaid crimson bags contain 5 posh brown bags, 4 vibrant indigo bags, 5 drab teal bags, 1 dotted gray bag.
        clear yellow bags contain 1 plaid gray bag.
        dotted fuchsia bags contain 2 plaid plum bags, 1 drab chartreuse bag.
        dim brown bags contain 1 faded silver bag, 1 faded brown bag, 2 striped cyan bags.
        striped aqua bags contain 2 faded purple bags.
        striped gold bags contain 3 dotted lime bags.
        bright yellow bags contain 2 drab bronze bags, 2 dotted gray bags.
        wavy blue bags contain 5 drab olive bags.
        wavy turquoise bags contain 3 dotted indigo bags, 2 vibrant plum bags.
        dotted purple bags contain 4 light blue bags, 4 wavy gray bags, 5 pale lavender bags.
        mirrored gold bags contain 5 wavy silver bags, 3 clear white bags.
        dull purple bags contain 3 dim fuchsia bags, 3 clear indigo bags, 4 dotted purple bags.
        bright gold bags contain 5 shiny silver bags, 5 dark olive bags, 2 muted yellow bags, 3 vibrant magenta bags.
        faded gray bags contain 3 dotted magenta bags, 5 clear lavender bags, 2 faded tomato bags.
        dark olive bags contain 1 drab tan bag, 2 striped crimson bags.
        light silver bags contain 3 dark teal bags, 4 posh crimson bags, 2 wavy olive bags, 2 dotted fuchsia bags.
        light yellow bags contain 3 wavy silver bags.
        dotted teal bags contain 3 vibrant orange bags, 2 clear maroon bags.
        drab coral bags contain 5 mirrored violet bags.
        dim salmon bags contain 4 faded silver bags, 2 plaid cyan bags.
        dotted coral bags contain 3 faded gray bags.
        vibrant bronze bags contain 4 faded tomato bags, 3 light brown bags, 5 posh lavender bags.
        light blue bags contain 3 clear brown bags, 3 posh violet bags, 3 bright brown bags.
        plaid fuchsia bags contain 4 striped white bags, 1 mirrored cyan bag.
        plaid indigo bags contain 5 bright cyan bags.
        dull magenta bags contain 5 muted tomato bags, 4 plaid tomato bags, 1 faded silver bag.
        shiny orange bags contain 3 dark coral bags.
        wavy white bags contain 2 striped indigo bags, 1 faded orange bag, 2 dull fuchsia bags, 2 vibrant silver bags.
        dotted bronze bags contain 5 shiny fuchsia bags, 5 dotted aqua bags, 1 faded aqua bag.
        light chartreuse bags contain 3 dull chartreuse bags.
        dull salmon bags contain 2 vibrant plum bags.
        clear bronze bags contain 1 shiny tomato bag.
        faded lavender bags contain 5 pale lavender bags, 2 dull maroon bags, 3 drab beige bags.
        dark black bags contain 2 dim fuchsia bags, 3 plaid tomato bags, 3 dull orange bags.
        dull violet bags contain 1 striped red bag.
        mirrored indigo bags contain 3 mirrored violet bags, 4 faded plum bags, 1 pale tan bag, 2 dotted white bags.
        shiny crimson bags contain 2 dim purple bags, 2 dotted purple bags, 2 bright bronze bags.
        plaid aqua bags contain 1 plaid tan bag, 1 mirrored orange bag.
        drab beige bags contain 1 dull yellow bag.
        clear purple bags contain 1 vibrant cyan bag, 2 dim brown bags, 1 dark lavender bag.
        dim olive bags contain 5 light blue bags, 1 dull gold bag, 5 faded red bags, 1 dotted purple bag.
        mirrored green bags contain 4 wavy beige bags.
        dotted silver bags contain 5 wavy fuchsia bags.
        dotted blue bags contain 5 pale blue bags.
        pale crimson bags contain 1 dim tan bag.
        plaid gold bags contain 5 wavy magenta bags, 2 dotted gray bags.
        dim crimson bags contain 4 dark lavender bags.
        pale tomato bags contain 3 muted red bags, 1 clear lavender bag, 1 clear orange bag, 3 pale red bags.
        drab fuchsia bags contain 3 faded red bags, 1 muted silver bag, 2 drab aqua bags.
        pale maroon bags contain 5 vibrant lime bags, 1 light crimson bag, 1 posh white bag.
        wavy lavender bags contain 3 muted red bags, 2 posh violet bags.
        vibrant salmon bags contain 1 dark beige bag.
        dark blue bags contain 5 dim brown bags, 3 dark red bags, 1 light fuchsia bag, 5 shiny gold bags.
        dark plum bags contain 1 muted aqua bag.
        drab crimson bags contain 2 drab turquoise bags, 3 shiny violet bags.
        vibrant tomato bags contain 1 light tomato bag, 5 vibrant gold bags.
        drab maroon bags contain 2 faded tomato bags, 5 clear olive bags, 3 plaid gray bags.
        clear green bags contain 5 striped lavender bags, 4 dim gray bags.
        plaid green bags contain 2 shiny blue bags, 1 drab fuchsia bag, 5 dotted black bags, 1 dim plum bag.
        mirrored yellow bags contain 2 mirrored violet bags, 5 clear brown bags.
        dull aqua bags contain 2 faded tomato bags.
        shiny olive bags contain 4 light teal bags, 2 bright white bags.
        plaid lime bags contain 3 drab red bags, 2 light crimson bags.
        dull green bags contain 5 drab green bags, 4 dotted red bags, 4 shiny olive bags, 4 plaid plum bags.
        dull beige bags contain 2 faded tan bags.
        light indigo bags contain 3 dotted white bags.
        shiny silver bags contain 3 vibrant cyan bags, 1 dim teal bag, 1 striped beige bag, 5 wavy chartreuse bags.
        plaid yellow bags contain 3 light beige bags.
        striped orange bags contain 1 dotted maroon bag, 5 bright red bags, 3 shiny red bags.
        posh indigo bags contain 2 dotted bronze bags.
        drab orange bags contain 1 striped crimson bag, 3 dark yellow bags, 3 light turquoise bags, 3 light silver bags.
        mirrored chartreuse bags contain 2 dotted magenta bags.
        plaid silver bags contain 5 wavy aqua bags, 3 vibrant plum bags, 1 dark black bag.
        striped indigo bags contain 2 dotted salmon bags, 1 vibrant beige bag, 1 wavy cyan bag, 5 striped salmon bags.
        muted coral bags contain 5 vibrant brown bags, 4 light fuchsia bags.
        shiny brown bags contain 2 vibrant violet bags, 3 drab gray bags.
        shiny indigo bags contain 5 muted bronze bags.
        striped cyan bags contain 3 dim fuchsia bags, 3 dark coral bags, 1 faded red bag, 5 plaid brown bags.
        shiny tan bags contain 5 plaid white bags.
        clear gold bags contain 3 plaid purple bags, 4 striped black bags, 5 dim turquoise bags, 1 plaid plum bag.
        vibrant violet bags contain 2 posh violet bags, 2 pale tomato bags.
        muted olive bags contain 2 dark tomato bags.
        mirrored tomato bags contain 5 pale black bags.
        clear crimson bags contain 1 dim crimson bag, 5 striped blue bags.
        drab blue bags contain 1 bright indigo bag.
        drab teal bags contain 1 plaid brown bag.
        striped brown bags contain 4 dotted orange bags, 4 wavy blue bags.
        posh lavender bags contain 4 bright indigo bags, 4 faded bronze bags.
        light fuchsia bags contain 1 shiny crimson bag, 2 clear brown bags, 2 striped crimson bags.
        dotted violet bags contain 4 dull crimson bags.
        vibrant lavender bags contain 2 faded olive bags, 5 shiny tomato bags.
        wavy gold bags contain 5 dotted black bags, 2 drab beige bags, 3 dull gold bags.
        faded brown bags contain 1 wavy gray bag, 3 plaid teal bags.
        bright purple bags contain 1 faded tomato bag.
        shiny plum bags contain 2 dim silver bags.
        posh beige bags contain 3 bright crimson bags.
        posh coral bags contain 4 light chartreuse bags, 5 drab bronze bags, 2 striped aqua bags.
        shiny black bags contain 2 posh black bags, 5 clear white bags.
        posh white bags contain 1 plaid violet bag.
        vibrant chartreuse bags contain 5 clear aqua bags, 4 dotted magenta bags.
        faded olive bags contain 2 mirrored fuchsia bags, 5 plaid brown bags.
        drab purple bags contain 1 dim olive bag, 5 drab lime bags.
        dull yellow bags contain 2 dark coral bags, 3 clear brown bags.
        vibrant turquoise bags contain 5 plaid orange bags.
        wavy tomato bags contain 3 faded olive bags, 3 bright white bags, 5 dull gray bags.
        pale plum bags contain 4 pale coral bags, 4 bright cyan bags, 3 dim brown bags.
        faded indigo bags contain 1 clear beige bag, 2 vibrant beige bags.
        shiny violet bags contain 4 shiny tomato bags, 2 striped lavender bags.
        mirrored purple bags contain 5 dotted red bags, 1 mirrored fuchsia bag, 2 mirrored yellow bags.
        faded cyan bags contain 4 drab red bags, 5 wavy purple bags, 2 dim beige bags, 5 faded red bags.
        shiny salmon bags contain 5 muted tomato bags, 5 striped olive bags.
        clear maroon bags contain 1 dotted magenta bag.
        faded black bags contain 5 wavy fuchsia bags, 2 dim olive bags, 1 dark lavender bag.
        posh green bags contain 3 mirrored coral bags, 2 drab aqua bags, 4 wavy orange bags.
        faded crimson bags contain 1 mirrored cyan bag, 2 dim gray bags, 5 light blue bags, 5 posh maroon bags.
        striped tomato bags contain 4 drab lime bags, 2 wavy teal bags, 4 plaid cyan bags, 2 muted fuchsia bags.
        light olive bags contain 2 dotted red bags, 2 pale coral bags.
        faded gold bags contain 4 shiny green bags, 1 clear beige bag, 2 wavy brown bags, 2 dull tomato bags.
        pale bronze bags contain 1 dim lime bag.
        dotted gray bags contain 5 mirrored yellow bags.
        dark beige bags contain 4 clear turquoise bags, 3 vibrant plum bags, 5 drab maroon bags, 5 clear red bags.
        drab magenta bags contain 1 drab maroon bag, 1 clear magenta bag.
        vibrant beige bags contain 3 bright fuchsia bags, 1 dull gold bag.
        dark teal bags contain 5 clear turquoise bags, 5 dark maroon bags, 4 dotted magenta bags, 3 shiny crimson bags.
        mirrored blue bags contain 5 dark black bags, 5 vibrant brown bags, 5 dark aqua bags.
        wavy cyan bags contain 4 clear aqua bags, 4 dark aqua bags.
        dark turquoise bags contain 1 striped gold bag.
        drab silver bags contain 3 plaid bronze bags.
        faded beige bags contain 5 wavy cyan bags, 3 dull white bags, 5 dim purple bags, 4 faded brown bags.
        faded purple bags contain 3 light white bags, 4 faded brown bags, 4 posh maroon bags.
        dotted magenta bags contain 3 posh violet bags.
        muted green bags contain 2 dim gray bags, 1 vibrant indigo bag, 4 dotted indigo bags.
        bright beige bags contain 1 wavy teal bag, 4 bright cyan bags, 1 clear green bag, 1 posh brown bag.
        bright violet bags contain 2 plaid indigo bags.
        dim purple bags contain 1 posh maroon bag, 2 drab beige bags, 5 clear brown bags.
        clear magenta bags contain 4 pale white bags, 5 dotted chartreuse bags, 2 bright turquoise bags, 4 mirrored red bags.
        faded magenta bags contain 1 dull gray bag.
        mirrored white bags contain 4 dotted purple bags, 2 plaid purple bags, 2 pale tan bags.
        clear salmon bags contain 2 mirrored lavender bags.
        light maroon bags contain 1 plaid tomato bag, 5 pale aqua bags.
        vibrant tan bags contain 3 bright coral bags, 4 striped turquoise bags, 3 wavy aqua bags, 2 shiny gold bags.
        shiny lavender bags contain 2 drab tomato bags, 1 drab plum bag.
        dark crimson bags contain 2 pale purple bags, 2 dotted white bags, 3 shiny orange bags, 1 dotted bronze bag.
        faded aqua bags contain 3 wavy purple bags.
        striped blue bags contain 3 plaid bronze bags, 1 clear yellow bag, 2 clear white bags, 3 wavy teal bags.
        mirrored silver bags contain 5 striped salmon bags, 4 drab blue bags, 1 vibrant green bag, 1 muted cyan bag.
        drab white bags contain 2 wavy salmon bags.
        dull brown bags contain 5 pale plum bags, 3 plaid tomato bags.
        bright cyan bags contain 2 clear lavender bags.
        faded chartreuse bags contain 4 wavy aqua bags, 5 plaid orange bags, 5 dotted indigo bags, 4 clear yellow bags.
        dotted tomato bags contain 4 muted purple bags, 4 dotted black bags.
        dim white bags contain 5 mirrored cyan bags, 2 dim fuchsia bags, 2 dark tomato bags, 1 dotted purple bag.
        posh orange bags contain 5 drab olive bags, 5 vibrant beige bags.
        light coral bags contain 5 light purple bags, 2 wavy tomato bags.
        wavy lime bags contain 4 clear brown bags.
        mirrored magenta bags contain 2 faded silver bags, 2 dark coral bags.
        wavy coral bags contain 4 dull purple bags, 1 dark white bag, 4 posh orange bags.
        vibrant gray bags contain 5 dotted aqua bags, 2 dark salmon bags, 2 bright blue bags, 1 dotted white bag.
        mirrored olive bags contain 3 dark coral bags, 3 wavy gray bags.
        light gold bags contain 2 striped lime bags, 2 dark orange bags.
        light cyan bags contain 2 dim turquoise bags, 3 dotted tan bags, 4 shiny crimson bags.
        shiny gray bags contain 5 plaid cyan bags, 1 wavy purple bag.
        bright plum bags contain 3 muted tomato bags, 1 dim chartreuse bag, 3 dotted indigo bags, 4 shiny olive bags.
        vibrant blue bags contain 2 shiny orange bags.
        clear lavender bags contain 5 faded red bags, 2 wavy gray bags.
        dim yellow bags contain 2 drab aqua bags, 3 dim lavender bags, 1 bright plum bag.
        posh gray bags contain 3 light lavender bags.
        dull tan bags contain 1 dim gold bag, 2 bright bronze bags, 5 dim plum bags.
        plaid brown bags contain 3 dull orange bags, 3 dim plum bags.
        muted purple bags contain 5 dark black bags, 1 vibrant lime bag.
        shiny coral bags contain 4 dim green bags, 4 dim maroon bags, 2 dim chartreuse bags.
        pale gold bags contain 2 dim beige bags.
        dim beige bags contain 2 mirrored yellow bags, 5 clear brown bags.
        dull chartreuse bags contain 2 faded red bags, 5 posh maroon bags, 5 clear lavender bags.
        muted bronze bags contain 5 dim plum bags.
        vibrant coral bags contain 1 faded black bag, 3 light green bags, 1 wavy chartreuse bag.
        clear turquoise bags contain 2 shiny beige bags, 5 mirrored fuchsia bags.
        wavy silver bags contain 5 dim tan bags.
        muted red bags contain 4 dull gold bags, 1 plaid brown bag, 1 wavy gray bag.
        light tan bags contain 4 dotted yellow bags, 1 dull maroon bag, 1 light beige bag.
        bright tomato bags contain 1 muted beige bag.
        striped coral bags contain 3 bright coral bags.
        dotted lime bags contain 2 dull salmon bags.
        mirrored plum bags contain 1 bright fuchsia bag, 1 drab yellow bag, 2 dark plum bags, 2 posh purple bags.
        plaid blue bags contain 5 dull gold bags, 4 wavy gray bags, 5 mirrored violet bags.
        plaid salmon bags contain 4 dim salmon bags, 1 dotted lavender bag.
        clear chartreuse bags contain 5 muted teal bags, 4 clear gold bags, 2 plaid tomato bags.
        muted blue bags contain 3 faded tomato bags, 5 striped chartreuse bags.
        dim tan bags contain 4 clear lavender bags, 2 clear violet bags, 1 wavy plum bag, 4 pale gold bags.
        bright chartreuse bags contain 2 posh silver bags, 1 vibrant plum bag.
        plaid white bags contain 1 striped red bag, 3 dim beige bags, 3 plaid bronze bags, 2 dim turquoise bags.
        bright coral bags contain 3 shiny gold bags, 2 striped chartreuse bags, 4 light salmon bags, 2 vibrant aqua bags.
        clear indigo bags contain 4 posh orange bags, 4 dull gold bags.
        bright aqua bags contain 1 shiny orange bag.
        faded bronze bags contain 2 pale gray bags, 3 dull gold bags.
        shiny green bags contain 1 drab chartreuse bag, 4 light salmon bags, 4 striped gold bags.
        drab black bags contain 4 dark black bags, 1 dotted turquoise bag, 3 wavy gray bags, 3 shiny fuchsia bags.
        pale yellow bags contain 2 dim green bags, 3 vibrant aqua bags.
        dull indigo bags contain 2 striped aqua bags, 4 clear chartreuse bags, 4 dark orange bags, 3 posh magenta bags.
        mirrored cyan bags contain 2 dotted purple bags, 5 mirrored violet bags, 2 dotted white bags, 3 bright brown bags.
        dark yellow bags contain 4 faded tan bags, 3 dim turquoise bags, 5 muted fuchsia bags, 5 clear salmon bags.
        wavy yellow bags contain 2 dim bronze bags, 4 drab bronze bags.
        muted white bags contain 1 dotted black bag, 5 bright plum bags, 1 striped cyan bag, 2 clear turquoise bags.
        dotted gold bags contain 3 shiny fuchsia bags, 5 muted tan bags, 2 clear fuchsia bags.
        light aqua bags contain 5 faded brown bags, 3 pale blue bags, 2 mirrored green bags.
        plaid violet bags contain 3 bright yellow bags.
        bright silver bags contain 1 drab violet bag, 4 light teal bags.
        wavy red bags contain 3 dotted gray bags, 5 drab fuchsia bags, 1 posh blue bag.
        mirrored tan bags contain 5 light green bags, 2 plaid gray bags, 4 pale orange bags, 1 shiny violet bag.
        muted tomato bags contain 1 wavy purple bag.
        faded blue bags contain 3 shiny crimson bags, 1 clear indigo bag.
        shiny purple bags contain 5 clear blue bags, 1 vibrant red bag.
        posh aqua bags contain 4 striped olive bags, 3 pale maroon bags, 1 dim yellow bag, 1 clear red bag.
        striped white bags contain 1 bright cyan bag, 3 dotted orange bags.
        striped lime bags contain 1 striped brown bag, 3 dotted chartreuse bags, 3 wavy fuchsia bags, 4 faded magenta bags.
        striped tan bags contain 1 pale gray bag, 1 light indigo bag, 2 dark coral bags.
        shiny red bags contain 4 dotted gray bags, 1 drab bronze bag, 4 shiny fuchsia bags.
        shiny beige bags contain 3 vibrant beige bags, 2 vibrant indigo bags, 3 plaid blue bags.
        dim fuchsia bags contain 5 pale tan bags.
        plaid tomato bags contain 4 clear red bags.
        dull blue bags contain 4 pale turquoise bags.
        dull red bags contain 5 posh brown bags, 2 dotted tomato bags, 2 striped gold bags.
        pale red bags contain 3 plaid brown bags.
        striped maroon bags contain 3 pale cyan bags, 1 dotted cyan bag, 1 dim tomato bag.
        light lime bags contain 3 light cyan bags, 4 light olive bags, 4 bright salmon bags, 3 shiny orange bags.
        drab brown bags contain 3 dim tomato bags, 2 dark gray bags.
        faded yellow bags contain 3 dotted beige bags, 2 muted blue bags, 2 wavy fuchsia bags, 1 dark magenta bag.
        bright green bags contain 2 pale cyan bags, 5 plaid bronze bags, 5 wavy orange bags.
        wavy bronze bags contain 3 wavy red bags.
        dull gold bags contain no other bags.
        plaid olive bags contain 4 muted white bags, 4 plaid red bags, 5 wavy red bags, 3 posh indigo bags.
        dotted aqua bags contain 3 dim indigo bags, 3 drab coral bags.
        pale purple bags contain 1 dotted magenta bag, 3 clear indigo bags, 1 dim turquoise bag, 3 pale blue bags.
        faded teal bags contain 3 drab maroon bags, 3 clear tan bags, 1 pale gray bag, 4 bright tomato bags.
        drab chartreuse bags contain 2 drab aqua bags, 4 clear indigo bags.
        light lavender bags contain 4 faded bronze bags, 1 plaid chartreuse bag.
        dim tomato bags contain 2 dull orange bags, 5 shiny cyan bags, 2 muted purple bags, 2 dotted black bags.
        faded maroon bags contain 2 faded white bags, 3 dim maroon bags.
        pale cyan bags contain 2 plaid brown bags.
        muted indigo bags contain 4 mirrored red bags, 1 dotted indigo bag, 4 mirrored maroon bags.
        wavy orange bags contain 3 plaid bronze bags.
        dull teal bags contain 5 drab red bags, 4 dim green bags, 3 dotted olive bags, 5 pale maroon bags.
        dull gray bags contain 5 dark tomato bags, 4 dull magenta bags, 4 dotted red bags, 5 faded brown bags.
        vibrant gold bags contain 3 striped beige bags, 5 clear bronze bags.
        posh bronze bags contain 3 pale turquoise bags, 4 posh blue bags.
        striped plum bags contain 3 pale orange bags, 5 clear tomato bags, 1 light salmon bag.
        shiny chartreuse bags contain 4 dim yellow bags, 4 mirrored yellow bags, 2 clear orange bags, 2 bright red bags.
        vibrant yellow bags contain 4 clear yellow bags, 2 vibrant olive bags, 5 drab salmon bags, 5 light tomato bags.
        dark coral bags contain 1 pale tan bag, 3 dull orange bags, 4 clear brown bags.
        dotted cyan bags contain 5 faded aqua bags, 2 dotted lime bags, 1 dim gray bag.
        light purple bags contain 5 dotted indigo bags, 2 pale violet bags.
        bright bronze bags contain 1 dim turquoise bag.
        wavy brown bags contain 5 dotted silver bags.
        plaid black bags contain 1 clear magenta bag, 2 faded plum bags.
        posh cyan bags contain 5 muted beige bags, 1 clear brown bag, 3 wavy beige bags.
        dotted green bags contain 4 faded lavender bags, 2 muted blue bags.
        vibrant orange bags contain 1 dark aqua bag.
        dark violet bags contain 1 striped fuchsia bag.
        dark green bags contain 2 dark white bags, 3 vibrant chartreuse bags, 3 mirrored maroon bags.
        shiny aqua bags contain 2 light salmon bags, 5 pale turquoise bags, 1 pale silver bag.
        mirrored gray bags contain 2 dim salmon bags, 4 striped chartreuse bags, 5 dull gray bags, 2 bright white bags.
        bright black bags contain 1 dark aqua bag, 5 dark red bags, 4 faded tomato bags.
        dark purple bags contain 3 striped brown bags.
        vibrant plum bags contain 5 dim fuchsia bags, 1 posh orange bag, 1 dotted purple bag, 1 light blue bag.
        pale gray bags contain 1 plaid cyan bag, 2 dim white bags, 1 dotted magenta bag, 4 shiny gold bags.
        striped green bags contain 2 pale crimson bags, 3 dotted lime bags, 5 posh turquoise bags.
        shiny bronze bags contain 5 dark olive bags, 2 vibrant magenta bags, 4 striped silver bags.
        muted fuchsia bags contain 5 drab fuchsia bags.
        bright olive bags contain 4 pale blue bags, 5 shiny crimson bags.
        posh lime bags contain 1 dim plum bag, 3 dim magenta bags, 1 mirrored tomato bag, 2 light lavender bags.
        light crimson bags contain 3 clear turquoise bags, 5 dim brown bags, 3 bright cyan bags, 4 plaid tomato bags.
        dull silver bags contain 5 wavy silver bags.
        clear coral bags contain 5 muted aqua bags.
        pale salmon bags contain 3 dark gold bags, 5 wavy orange bags.
        pale lime bags contain 3 dim cyan bags, 4 striped turquoise bags, 2 muted aqua bags.
        wavy fuchsia bags contain 2 drab beige bags, 1 faded olive bag, 1 dim beige bag, 3 pale orange bags.
        clear blue bags contain 1 pale black bag, 2 plaid fuchsia bags, 2 mirrored chartreuse bags, 2 bright brown bags.
        muted teal bags contain 5 pale black bags.
        muted orange bags contain 4 dim olive bags.
        dotted indigo bags contain 3 drab lime bags.
        drab yellow bags contain 1 dim beige bag.
        muted brown bags contain 2 striped red bags, 4 muted green bags, 3 drab chartreuse bags, 4 dark aqua bags.
        posh red bags contain 1 wavy beige bag, 1 wavy tomato bag, 1 faded bronze bag, 1 clear coral bag.
        posh gold bags contain 1 dim chartreuse bag, 1 clear lavender bag, 1 bright fuchsia bag, 3 bright magenta bags.
        posh salmon bags contain 5 plaid red bags, 1 dim purple bag, 1 bright yellow bag.
        wavy black bags contain 5 faded white bags, 3 faded chartreuse bags.
        mirrored crimson bags contain 2 plaid gray bags, 2 vibrant tomato bags, 1 dim bronze bag.
        light white bags contain 4 dim turquoise bags.
        pale violet bags contain 5 dim beige bags.
        dim magenta bags contain 4 striped teal bags.
        striped teal bags contain 5 drab lime bags, 5 mirrored yellow bags.
        dotted brown bags contain 4 shiny gold bags, 3 wavy brown bags, 4 clear brown bags, 1 clear teal bag.
        bright orange bags contain 2 plaid violet bags, 3 posh aqua bags, 1 clear tan bag.
        shiny gold bags contain 3 dotted magenta bags, 2 shiny beige bags, 3 plaid brown bags, 5 clear indigo bags.
        clear olive bags contain 4 drab red bags.
        plaid purple bags contain 3 plaid gray bags, 3 dim olive bags, 4 dotted purple bags.
        pale teal bags contain 4 wavy cyan bags, 4 posh bronze bags.
        muted cyan bags contain 2 light blue bags, 3 shiny purple bags, 3 dotted white bags.
        plaid chartreuse bags contain 4 clear lime bags, 4 pale red bags.
        wavy crimson bags contain 1 pale gray bag, 3 striped tan bags, 5 muted purple bags.
        bright tan bags contain 1 posh purple bag, 1 light chartreuse bag, 3 dark white bags.
        dark lavender bags contain 1 dotted beige bag, 2 dark tomato bags.
        plaid coral bags contain 5 dotted red bags, 1 dim white bag.
        faded plum bags contain no other bags.
        dark indigo bags contain 4 drab beige bags, 5 clear red bags, 5 pale red bags, 4 pale blue bags.
        striped gray bags contain 5 drab teal bags, 4 muted red bags.
        light red bags contain 2 light gray bags, 3 vibrant aqua bags, 1 dotted aqua bag.
        clear tan bags contain 5 dull gold bags, 3 dim gray bags, 3 dim white bags, 2 light green bags.
        pale aqua bags contain 5 dotted purple bags, 1 drab lime bag, 2 clear orange bags.
        vibrant fuchsia bags contain 5 clear turquoise bags, 3 clear red bags, 5 faded green bags.
        clear lime bags contain 3 striped red bags, 1 dull maroon bag.
        muted gray bags contain 4 muted yellow bags, 4 dotted silver bags, 4 clear orange bags, 5 faded turquoise bags.
        dull fuchsia bags contain 1 dark aqua bag.
        wavy purple bags contain 4 drab teal bags, 3 light blue bags, 3 mirrored violet bags.
        vibrant teal bags contain 2 striped white bags, 4 dull red bags, 3 plaid chartreuse bags, 5 dotted salmon bags.
        dotted lavender bags contain 4 dim purple bags, 4 clear orange bags, 4 vibrant beige bags.
        clear gray bags contain 4 dotted tan bags, 1 dull gold bag, 4 dull gray bags.
        wavy violet bags contain 3 bright blue bags, 3 shiny purple bags, 2 bright fuchsia bags.
        dull cyan bags contain 4 clear green bags.
        dim blue bags contain 1 light brown bag, 3 faded indigo bags.
        bright magenta bags contain 1 dim brown bag, 4 wavy purple bags, 3 dotted red bags.
        dark cyan bags contain 4 vibrant maroon bags, 2 wavy salmon bags.
        vibrant magenta bags contain 4 plaid orange bags, 1 faded red bag.
        bright gray bags contain 5 dotted magenta bags, 3 clear olive bags, 1 bright fuchsia bag, 2 muted silver bags.
        wavy maroon bags contain 5 mirrored violet bags, 4 clear orange bags, 5 drab olive bags.
        dotted maroon bags contain 5 pale purple bags, 5 faded silver bags, 5 dotted lime bags.
        drab indigo bags contain 5 light chartreuse bags.
        dark brown bags contain 4 bright red bags.
        bright blue bags contain 2 shiny cyan bags.
        bright brown bags contain 5 dark coral bags, 5 dim fuchsia bags.
        dotted orange bags contain 5 bright fuchsia bags, 2 dull gold bags.
        mirrored red bags contain 4 dotted salmon bags, 3 dark red bags, 3 drab teal bags, 4 pale blue bags.
        plaid red bags contain 2 light maroon bags, 3 drab tomato bags.
        drab violet bags contain 2 vibrant cyan bags.
        vibrant olive bags contain 1 clear maroon bag, 3 clear green bags, 5 drab aqua bags.
        plaid plum bags contain 3 vibrant plum bags.
        dim coral bags contain 2 dull aqua bags, 3 vibrant tan bags, 5 muted fuchsia bags, 1 plaid silver bag.
        vibrant green bags contain 4 pale gray bags, 4 posh fuchsia bags, 3 bright lime bags, 5 faded blue bags.
        muted beige bags contain 5 drab fuchsia bags.
        vibrant maroon bags contain 1 faded aqua bag.
        muted yellow bags contain 3 clear maroon bags, 2 striped crimson bags, 4 mirrored maroon bags, 3 vibrant olive bags.
        faded salmon bags contain 4 faded olive bags, 1 muted purple bag, 3 dotted yellow bags, 3 dim silver bags.
        pale beige bags contain 3 mirrored tan bags.
        plaid lavender bags contain 2 bright magenta bags, 4 bright indigo bags, 1 posh tomato bag.
        drab aqua bags contain 4 wavy magenta bags, 3 mirrored olive bags, 1 muted tomato bag, 3 posh orange bags.
        bright indigo bags contain 3 pale violet bags, 3 dark lavender bags, 4 muted plum bags, 3 striped crimson bags.
        clear black bags contain 4 wavy aqua bags, 3 light yellow bags.
        drab gray bags contain 1 muted aqua bag, 3 plaid fuchsia bags.
        striped beige bags contain 1 vibrant blue bag, 5 dotted tomato bags.
        faded orange bags contain 2 mirrored maroon bags.
        dark orange bags contain 1 muted maroon bag, 5 drab indigo bags.
        mirrored coral bags contain 3 faded aqua bags, 2 drab lime bags.
        dim red bags contain 5 muted fuchsia bags.
        dark aqua bags contain 3 shiny gold bags, 4 pale blue bags, 3 dull magenta bags.
        dim gold bags contain 1 plaid blue bag, 1 posh fuchsia bag.
        striped black bags contain 2 shiny gold bags.
        shiny turquoise bags contain 4 pale purple bags, 5 faded blue bags.
        dim chartreuse bags contain 2 pale coral bags.
        drab red bags contain 5 mirrored olive bags, 5 vibrant beige bags.
        posh chartreuse bags contain 3 pale violet bags, 3 muted beige bags.
        light black bags contain 3 mirrored maroon bags, 5 dull tan bags, 5 posh crimson bags, 3 dark gray bags.
        vibrant aqua bags contain 2 plaid coral bags.
        pale olive bags contain 5 wavy lavender bags, 2 posh olive bags, 4 dim black bags, 3 drab cyan bags.
        mirrored aqua bags contain 3 mirrored violet bags.
        muted lime bags contain 4 mirrored cyan bags, 1 drab turquoise bag, 5 wavy fuchsia bags.
        dull coral bags contain 4 muted lime bags, 4 dim white bags.
        faded tomato bags contain 3 pale violet bags, 4 faded brown bags.
        mirrored fuchsia bags contain 3 dotted purple bags, 4 pale lavender bags.
        plaid magenta bags contain 3 light plum bags, 3 striped orange bags.
        clear teal bags contain 4 plaid blue bags.
        faded fuchsia bags contain 1 dull purple bag, 2 bright brown bags.
        mirrored brown bags contain 4 faded bronze bags, 5 faded beige bags.
        muted silver bags contain 2 dull gold bags, 4 clear orange bags, 2 dotted purple bags, 5 dim olive bags.
        dull bronze bags contain 4 shiny cyan bags, 1 posh cyan bag.
        dark silver bags contain 1 shiny olive bag, 2 drab aqua bags, 2 striped fuchsia bags, 4 mirrored tan bags.
        bright white bags contain 4 dark aqua bags, 5 plaid tomato bags, 5 drab green bags, 4 muted red bags.
        dark gold bags contain 2 dim teal bags, 4 shiny fuchsia bags.
        dull olive bags contain 5 mirrored orange bags, 3 drab gray bags, 1 shiny turquoise bag, 5 dull cyan bags.
        wavy olive bags contain 1 wavy cyan bag.
        dotted white bags contain no other bags.
        plaid gray bags contain 3 dim beige bags, 2 dotted magenta bags, 5 vibrant indigo bags.
        dim bronze bags contain 5 dark aqua bags.
        dotted yellow bags contain 2 wavy blue bags.
        muted lavender bags contain 2 faded aqua bags.
        dim teal bags contain 5 pale gold bags.
        posh teal bags contain 1 muted plum bag, 5 clear tomato bags, 1 clear white bag.
        faded turquoise bags contain 1 wavy teal bag, 1 plaid red bag.
        vibrant lime bags contain 4 vibrant beige bags, 5 drab lime bags.
        clear plum bags contain 1 vibrant beige bag.
        mirrored black bags contain 5 wavy white bags.
        mirrored orange bags contain 1 wavy turquoise bag.
        vibrant purple bags contain 2 faded crimson bags, 2 dull red bags, 3 plaid blue bags.
        posh maroon bags contain 5 clear orange bags, 5 vibrant indigo bags, 2 drab lime bags, 5 posh orange bags.
        plaid maroon bags contain 2 pale silver bags, 5 dotted salmon bags, 1 dotted plum bag, 3 bright olive bags.
        posh blue bags contain 1 dark coral bag, 2 vibrant lime bags, 4 pale orange bags, 1 plaid blue bag.
        muted black bags contain 2 dim gold bags.
        clear red bags contain 5 pale lavender bags, 1 bright brown bag, 5 muted red bags, 4 dull orange bags.
        plaid teal bags contain 1 dark coral bag, 3 dull orange bags.
        light tomato bags contain 4 dotted white bags, 1 pale blue bag, 1 dull coral bag.
        mirrored turquoise bags contain 1 shiny green bag, 1 wavy plum bag, 1 dull orange bag.
        pale coral bags contain 2 shiny fuchsia bags, 1 dull gold bag, 5 dim plum bags, 5 dark black bags.
        muted aqua bags contain 5 posh maroon bags, 4 dim gray bags, 3 pale aqua bags, 1 light crimson bag.
        shiny yellow bags contain 2 faded plum bags.
        faded tan bags contain 2 dark maroon bags.
        clear fuchsia bags contain 4 light white bags, 5 posh maroon bags.
        light brown bags contain 4 dim olive bags, 5 drab chartreuse bags, 5 posh maroon bags, 3 pale violet bags.
        muted maroon bags contain 2 wavy silver bags.
        wavy aqua bags contain 4 pale purple bags.
        mirrored beige bags contain 4 posh brown bags.
        drab salmon bags contain 3 striped red bags, 1 dull gray bag, 3 posh white bags.
        dotted crimson bags contain 2 light teal bags, 4 bright black bags, 3 drab teal bags.
        muted violet bags contain 3 bright coral bags.
        dim green bags contain 1 drab violet bag, 5 dotted beige bags.
        striped salmon bags contain 4 dull chartreuse bags, 2 dark indigo bags.
        dull black bags contain 3 dotted silver bags.
        shiny maroon bags contain 3 vibrant lavender bags, 3 clear lavender bags, 4 dull teal bags, 5 wavy maroon bags.
        faded white bags contain 1 plaid silver bag, 3 pale gold bags.
        light orange bags contain 3 pale red bags, 3 dull purple bags, 3 bright cyan bags, 4 dim lavender bags.
        posh plum bags contain 1 clear silver bag, 2 clear maroon bags.
        vibrant indigo bags contain 3 pale lavender bags, 5 dotted purple bags, 5 dotted white bags, 2 wavy magenta bags.
        dotted beige bags contain 3 muted tomato bags, 3 clear brown bags, 1 plaid gray bag, 2 faded olive bags.
        dim plum bags contain no other bags.
        pale white bags contain 3 vibrant beige bags.
        wavy salmon bags contain 1 dim black bag, 4 faded gray bags, 5 dim maroon bags.
        pale chartreuse bags contain 5 mirrored white bags, 4 posh teal bags, 2 muted plum bags.
        pale tan bags contain no other bags.
        vibrant black bags contain 4 vibrant tan bags.
        mirrored bronze bags contain 5 pale aqua bags, 2 wavy olive bags, 1 posh olive bag.
        bright teal bags contain 2 dark lavender bags, 5 muted fuchsia bags.
        striped silver bags contain 5 dull cyan bags, 5 striped teal bags, 2 posh blue bags.
        shiny white bags contain 3 shiny violet bags, 3 dotted cyan bags, 3 dotted purple bags.
        dark salmon bags contain 5 dotted lime bags, 1 pale orange bag, 1 vibrant red bag, 5 wavy purple bags.
        vibrant crimson bags contain 4 clear red bags, 4 faded gray bags.
        pale blue bags contain 5 striped cyan bags.
        drab bronze bags contain 1 drab teal bag.
        wavy magenta bags contain 4 vibrant beige bags, 4 bright fuchsia bags, 1 mirrored yellow bag, 4 dim fuchsia bags.
        faded violet bags contain 4 wavy gray bags.
        drab cyan bags contain 1 light gray bag, 5 plaid bronze bags, 5 dull aqua bags, 2 vibrant gray bags.
        dotted turquoise bags contain 2 mirrored indigo bags, 4 plaid plum bags, 4 faded red bags, 3 dim gray bags.
        dotted olive bags contain 4 vibrant beige bags.
        posh turquoise bags contain 1 light fuchsia bag, 5 plaid red bags, 5 bright coral bags.
        dull tomato bags contain 5 light blue bags, 2 plaid plum bags, 3 dotted lime bags.
        pale fuchsia bags contain 3 drab orange bags, 4 bright lime bags, 3 pale tan bags.
        drab tomato bags contain 2 posh magenta bags, 3 vibrant fuchsia bags, 3 dim fuchsia bags.
        vibrant silver bags contain 1 posh turquoise bag.
        pale black bags contain 3 dark coral bags, 3 dim plum bags, 4 shiny beige bags.
        wavy chartreuse bags contain 3 drab violet bags, 1 vibrant orange bag, 2 dim gray bags.
        dull crimson bags contain 3 mirrored plum bags, 2 dotted orange bags, 3 faded brown bags.
        clear beige bags contain 4 wavy tomato bags, 1 muted lavender bag, 5 bright magenta bags, 3 dotted indigo bags.
        shiny teal bags contain 3 drab red bags.
        bright lavender bags contain 4 drab fuchsia bags, 4 vibrant olive bags, 2 clear olive bags.
        posh tan bags contain 5 drab crimson bags, 5 bright lavender bags.
        dim turquoise bags contain 2 dim fuchsia bags.
        light violet bags contain 4 wavy tomato bags, 5 dark green bags, 1 vibrant violet bag.
        bright crimson bags contain 2 posh white bags.
        striped olive bags contain 3 light indigo bags.
        muted crimson bags contain 1 wavy magenta bag, 1 mirrored fuchsia bag.
        muted chartreuse bags contain 5 faded tan bags.
        dull white bags contain 5 faded red bags, 5 dim plum bags.
        bright lime bags contain 5 posh blue bags, 2 pale aqua bags, 3 light red bags.
        shiny fuchsia bags contain 4 faded olive bags, 2 dim turquoise bags, 1 plaid blue bag.
        faded silver bags contain 2 muted red bags, 5 pale purple bags.
        light plum bags contain 1 vibrant aqua bag.
        dark magenta bags contain 4 striped purple bags, 5 bright lime bags, 2 dull magenta bags, 2 dim black bags.
        clear cyan bags contain 3 bright brown bags, 3 mirrored gold bags, 2 faded plum bags, 5 shiny purple bags.
        plaid turquoise bags contain 5 posh orange bags, 4 light gray bags.
        clear brown bags contain 1 plaid brown bag, 5 posh violet bags.
        posh black bags contain 3 dark coral bags, 1 pale cyan bag, 2 faded gray bags.
        mirrored violet bags contain no other bags.
        bright fuchsia bags contain no other bags.
        striped chartreuse bags contain 4 pale lavender bags, 2 wavy gray bags, 2 pale violet bags.
        dark tan bags contain 3 dotted white bags.
        dim gray bags contain 5 dim beige bags.
        plaid beige bags contain 4 wavy lavender bags, 4 clear lime bags, 3 posh magenta bags, 3 dotted crimson bags.
        dim aqua bags contain 3 wavy cyan bags.
        wavy teal bags contain 5 drab aqua bags, 5 vibrant beige bags, 1 plaid tomato bag.
        dark red bags contain 1 drab fuchsia bag, 1 pale gold bag, 5 dark tomato bags, 5 shiny beige bags.
        vibrant white bags contain 5 wavy aqua bags, 2 muted cyan bags.
        muted turquoise bags contain 2 faded crimson bags.
        dark maroon bags contain 4 vibrant orange bags.
        dotted red bags contain 4 dark coral bags.
        striped violet bags contain 4 drab teal bags, 1 pale gray bag.
        light green bags contain 1 pale orange bag, 3 dim fuchsia bags.
        striped purple bags contain 4 pale black bags.
        clear tomato bags contain 4 dark white bags.
        dim indigo bags contain 3 pale tan bags, 2 mirrored cyan bags, 5 dotted crimson bags, 4 wavy lavender bags.
        posh silver bags contain 4 mirrored orange bags, 5 dotted lavender bags.
        dim silver bags contain 5 faded purple bags, 5 striped olive bags, 5 striped tan bags.
        light beige bags contain 2 bright plum bags, 2 dull salmon bags.
        posh yellow bags contain 4 dotted crimson bags, 5 dark salmon bags, 4 pale yellow bags.
        dark lime bags contain 3 posh crimson bags, 5 posh purple bags, 1 light black bag.
        clear silver bags contain 3 faded olive bags, 3 drab turquoise bags, 4 drab purple bags.
        vibrant cyan bags contain 5 vibrant plum bags.
        """

    static let testValuesPart2 = """
        shiny gold bags contain 2 dark red bags.
        dark red bags contain 2 dark orange bags.
        dark orange bags contain 2 dark yellow bags.
        dark yellow bags contain 2 dark green bags.
        dark green bags contain 2 dark blue bags.
        dark blue bags contain 2 dark violet bags.
        dark violet bags contain no other bags.
        """
}
