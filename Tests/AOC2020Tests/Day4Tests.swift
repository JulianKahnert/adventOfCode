import XCTest
@testable import AOC2020

final class Day4Tests: XCTestCase {

    func testPart1() {
        let result = parsePassports(from: Self.testValuesPart1)
            .filter(\.isValid)
        XCTAssertEqual(result.count, 2)
    }

	func testResultPart1() {
        let result = parsePassports(from: Self.valuesPart1)
            .filter(\.isValid)
        XCTAssertEqual(result.count, 256)
	}

	func test1Part2() {
        let invalidData = """
        eyr:1972 cid:100
        hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926

        iyr:2019
        hcl:#602927 eyr:1967 hgt:170cm
        ecl:grn pid:012533040 byr:1946

        hcl:dab227 iyr:2012
        ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277

        hgt:59cm ecl:zzz
        eyr:2038 hcl:74454a iyr:2023
        pid:3556412378 byr:2007
        """
        let result = parsePassports(from: invalidData)
            .filter(\.isValid)
            .filter(\.hasValidValues)
        XCTAssertEqual(result.count, 0)
	}

    func test2Part2() {
        let validData = """
        pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
        hcl:#623a2f

        eyr:2029 ecl:blu cid:129 byr:1989
        iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm

        hcl:#888785
        hgt:164cm byr:2001 iyr:2015 cid:88
        pid:545766238 ecl:hzl
        eyr:2022

        iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719
        """
        let result = parsePassports(from: validData)
            .filter(\.isValid)
            .filter(\.hasValidValues)
        XCTAssertEqual(result.count, 4)
    }

    func testResultPart2() {
        let result = parsePassports(from: Self.valuesPart1)
            .filter(\.isValid)
            .filter(\.hasValidValues)
        XCTAssertEqual(result.count, 198)
    }

    // MARK: - More Tests
    func testValidation1() {
        let data = """
            ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
            byr:1937 iyr:2017 cid:147 hgt:183cm
            """
        let passport = NorthPolePassport(data: data)
        XCTAssertTrue(passport.isValid)
    }

    func testValidation2() {
        let data = """
            iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
            hcl:#cfa07d byr:1929
            """
        let passport = NorthPolePassport(data: data)
        XCTAssertFalse(passport.isValid)
    }
}

extension Day4Tests {
    static let testValuesPart1: String = """
        ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
        byr:1937 iyr:2017 cid:147 hgt:183cm

        iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
        hcl:#cfa07d byr:1929

        hcl:#ae17e1 iyr:2013
        eyr:2024
        ecl:brn pid:760753108 byr:1931
        hgt:179cm

        hcl:#cfa07d eyr:2025 pid:166559648
        iyr:2011 ecl:brn hgt:59in
        """

    static let valuesPart1: String = """
        eyr:2028 iyr:2016 byr:1995 ecl:oth
        pid:543685203 hcl:#c0946f
        hgt:152cm
        cid:252

        hcl:#733820 hgt:155cm
        iyr:2013 byr:1989 pid:728471979
        ecl:grn eyr:2022

        hgt:171cm
        iyr:2013 pid:214368857 hcl:#cfa07d byr:1986 eyr:2028 ecl:grn

        hgt:167cm cid:210 ecl:brn pid:429131951 hcl:#cfa07d eyr:2029 iyr:2010
        byr:1945

        hcl:#888785 iyr:2015
        hgt:170cm pid:893805464 ecl:amb byr:1966 eyr:2028

        hgt:170cm ecl:amb
        hcl:#c0946f eyr:2020 iyr:2016 pid:725010548
        byr:1928

        byr:1999 hcl:#888785
        eyr:2026
        ecl:hzl
        iyr:2016 hgt:193cm pid:170608679

        eyr:2024 iyr:2016 hcl:#cfa07d ecl:grn byr:2001 pid:391942873 cid:104 hgt:164cm

        iyr:2019
        eyr:2025 pid:138912840 byr:1996
        hgt:166cm
        hcl:#888785 ecl:grn

        iyr:2023 hcl:a58381 pid:#401a29 eyr:1940
        byr:1920
        ecl:utc hgt:183cm

        pid:493510244 ecl:gry hgt:153cm byr:1950 cid:181 eyr:2028
        hcl:#ceb3a1
        iyr:2020

        iyr:2018 pid:074340974 hgt:182cm
        hcl:#866857 byr:1988 ecl:hzl eyr:2023

        hcl:#866857 ecl:oth byr:1977 iyr:2014 hgt:180cm pid:860745884
        eyr:2023

        eyr:2026 pid:815594641
        ecl:gry iyr:2012 byr:1992 hgt:161cm hcl:#b6652a

        ecl:gry cid:338 eyr:2021 pid:777099878 hgt:193cm hcl:#efcc98
        byr:1945
        iyr:2015

        iyr:2016 byr:1934 hcl:#b6652a
        hgt:162cm ecl:hzl
        cid:296
        pid:742610207
        eyr:2022

        ecl:#ba3242
        hgt:80 byr:1931
        pid:550004054 iyr:1949 eyr:1944 hcl:fb3859

        ecl:amb eyr:2024
        byr:1965 iyr:2010 pid:094059049
        hcl:#fffffd
        hgt:168cm

        pid:159cm
        iyr:1923 eyr:2032 hcl:701107 cid:343 ecl:gmt byr:2010
        hgt:177cm

        eyr:2021
        ecl:grn byr:1991
        hcl:#fffffd hgt:167cm pid:243218792 iyr:2019

        hgt:157cm byr:2017 ecl:grn iyr:2012
        eyr:2030 hcl:#18171d pid:173cm

        pid:260101979 hgt:187cm eyr:2033 ecl:lzr
        byr:2020 hcl:1058ce cid:133 iyr:2012

        hcl:#7d3b0c
        pid:307828343 byr:2001
        cid:317 iyr:2013
        eyr:2029

        pid:472940417 eyr:1960
        hgt:181cm hcl:#c0946f cid:269
        byr:2014
        iyr:1956

        hcl:#18171d eyr:2021 byr:2001 pid:421443124
        ecl:brn iyr:2020 hgt:156cm

        cid:347 hgt:60in pid:359783692 byr:1932
        ecl:hzl
        eyr:2023
        hcl:#888785 iyr:2019

        pid:230915137
        byr:1999
        iyr:2011 eyr:2020 hcl:#7d3b0c ecl:hzl
        hgt:164cm

        iyr:1989
        byr:2008
        hgt:154cm
        eyr:2028 pid:280298169
        cid:208
        ecl:oth

        byr:1954 iyr:2017
        ecl:hzl
        eyr:2026
        pid:966957581 hgt:175cm hcl:#18171d

        pid:308053355 hgt:192cm eyr:2022 ecl:amb cid:146 iyr:2015
        byr:1991 hcl:#c0946f

        hcl:#a97842 pid:244441133 iyr:2019
        hgt:182cm
        ecl:amb cid:172 byr:1973 eyr:2029

        iyr:2017
        byr:1985 cid:215
        ecl:blu hcl:#623a2f hgt:160cm pid:157856689 eyr:2030

        eyr:2027 ecl:#d72f9b hgt:162cm
        iyr:2018 hcl:#a97842
        byr:1945
        pid:131243258

        hcl:#b3f2f0 pid:204254353 cid:169 eyr:2020
        iyr:2013 hgt:172cm ecl:blu byr:1950

        byr:1957 hcl:#c0946f hgt:152cm ecl:blu eyr:2027 pid:325917033
        iyr:2010

        ecl:oth byr:1950 hgt:166cm pid:007352351
        hcl:#b6652a
        iyr:2020
        eyr:2024

        hgt:165 eyr:2030 iyr:2027
        ecl:#1a34f1 pid:2894591864 byr:2024 hcl:z

        byr:1971 ecl:oth
        hgt:163cm eyr:2021 pid:040443396

        hgt:177cm
        byr:1955 pid:585735590 iyr:2010 ecl:grn eyr:2024
        hcl:#602927

        cid:74
        iyr:2010
        pid:014378493 hgt:174cm eyr:2020
        ecl:grn byr:1944

        pid:404141049
        byr:1947 ecl:blu hgt:170cm iyr:2011
        eyr:2028
        hcl:#cfa07d

        ecl:hzl byr:1938 pid:235085606 cid:180 hcl:8fb74c eyr:2021 hgt:73 iyr:2015

        pid:860077423 ecl:gry
        hcl:#3e845b
        hgt:167cm byr:1933 iyr:2016 eyr:2021

        hcl:#733820 hgt:66in eyr:1920
        ecl:oth byr:1941 pid:979460474 iyr:2010
        cid:247

        hcl:#cfa07d ecl:#13bd36 hgt:193cm eyr:2027 pid:181cm byr:1952 iyr:1951

        ecl:brn hcl:#602927
        hgt:161cm
        eyr:2027 pid:822749462 byr:1946
        iyr:2014

        byr:2013
        iyr:2021 ecl:zzz eyr:2032 hgt:193in hcl:#a97842 pid:163cm

        eyr:2029 cid:140
        byr:1984
        iyr:2018 hgt:187cm hcl:#b6652a pid:910674579

        ecl:hzl hgt:173cm pid:096026282
        iyr:2014 byr:1956
        eyr:2029 hcl:#866857

        eyr:2024 iyr:2019 pid:301205967
        cid:276 byr:1957 hcl:#3fec29 ecl:gry hgt:165cm

        iyr:2013 ecl:oth hgt:177cm hcl:#6b5442 eyr:2021 byr:1962 pid:006347857

        ecl:grt byr:1983 hcl:#cfa07d
        hgt:163cm
        eyr:1979
        iyr:1958 pid:796395720

        iyr:2011 pid:415403544 hcl:#c0946f byr:1990 ecl:oth eyr:2023 hgt:73in
        cid:107

        hgt:166cm eyr:2029 iyr:2015
        hcl:#c0946f ecl:brn
        byr:1964
        pid:469449137

        eyr:2023
        byr:1969 iyr:2010 hgt:163cm hcl:#a97842 pid:570942274
        ecl:blu

        hcl:#623a2f
        ecl:brn hgt:183cm pid:524675399
        eyr:2020 iyr:2012 byr:1981

        iyr:2017 hcl:#fffffd eyr:2026
        ecl:gry byr:1979 hgt:152cm pid:505790864

        hgt:68in
        hcl:#c0946f iyr:2012
        eyr:2023 pid:933562997 byr:1993
        ecl:grn

        pid:267705171
        hgt:166cm byr:1970 iyr:2019 hcl:#341e13 ecl:oth
        eyr:2030

        ecl:brn byr:1972 eyr:2026 pid:774637408 hgt:189cm iyr:2015 hcl:#341e13

        hgt:175cm eyr:2026 byr:2001 iyr:2020
        hcl:#733820 ecl:blu pid:686996160

        hgt:190cm hcl:#c0946f pid:228444464 byr:1987
        iyr:2020 eyr:2030
        ecl:blu

        byr:1990 hgt:179cm
        pid:885359438 eyr:2028 iyr:2010 ecl:amb
        hcl:#67067e

        byr:1945 hcl:#866857 eyr:2022 iyr:2019
        pid:708146656 cid:65
        hgt:172cm ecl:brn

        ecl:hzl hgt:191cm
        cid:260 pid:010716679 iyr:2011 eyr:2029 byr:1920 hcl:#efcc98

        iyr:2012
        cid:313 pid:264894705 byr:1951 hcl:#733820 eyr:2030 ecl:blu
        hgt:178cm

        eyr:2027 pid:790510379
        iyr:2013
        ecl:amb
        hgt:186cm
        hcl:#866857
        byr:1926

        pid:535750794 hgt:191cm iyr:2016 hcl:#a97842 eyr:2029
        ecl:hzl byr:1923

        byr:2023 pid:#eb4c2a iyr:1939 ecl:grn hcl:06d729 hgt:73 eyr:2038

        pid:792365221 iyr:2013 ecl:oth
        byr:1997
        hgt:170cm hcl:#efcc98
        eyr:2022

        hgt:192cm pid:874141668
        byr:1957 iyr:2015
        ecl:gry

        hcl:#b6652a pid:770238761 eyr:2029 byr:1934 iyr:2013
        ecl:blu cid:177
        hgt:184cm

        ecl:hzl eyr:2024 hgt:72in pid:546439165
        iyr:2013
        hcl:#c0946f cid:223 byr:1989

        byr:1985
        ecl:utc pid:#ff1cbf
        iyr:2018 hcl:#866857 hgt:169cm eyr:2026 cid:194

        hgt:189cm
        eyr:2026 pid:120642045 ecl:blu
        hcl:#602927 cid:177
        byr:1954 iyr:2012

        pid:314624973
        byr:1959 iyr:2015 hcl:#c0946f ecl:grn
        eyr:2027 cid:349 hgt:156cm

        byr:1978
        iyr:2020 hgt:150cm cid:266 eyr:2026
        pid:443912835 hcl:#b6652a

        hgt:174cm byr:1974 pid:729198828
        ecl:brn iyr:2014
        hcl:#18171d eyr:2027

        pid:472891001 ecl:xry
        hgt:96 hcl:1b816a iyr:1954
        byr:2015 eyr:2037

        byr:1966 eyr:2022
        iyr:2014
        pid:848187688 hcl:#602927 ecl:gry hgt:152cm

        hgt:129 eyr:2037 cid:61 iyr:2009 byr:2027 hcl:#c0946f
        pid:3569865
        ecl:#4e3d72

        ecl:gry
        eyr:2021 pid:234525998 byr:1964 hgt:168cm cid:140
        hcl:#7d3b0c iyr:2013

        ecl:xry
        cid:86
        hgt:172in
        byr:1972
        iyr:2015 hcl:#7d3b0c pid:833809421 eyr:2030

        pid:444365280 hgt:72in
        ecl:brn
        hcl:#b6652a byr:1985 eyr:2027 iyr:2012

        iyr:2010 byr:2013 hgt:181cm eyr:2021
        pid:072317444
        ecl:oth hcl:#866857
        cid:118

        pid:4354408888 iyr:2012
        hcl:#b6652a cid:104
        hgt:96 eyr:2020
        byr:1933 ecl:amb

        eyr:2023 ecl:gry hcl:#a97842 pid:287719484 byr:1994
        iyr:2011 hgt:163cm cid:299

        byr:1932
        hgt:170cm
        iyr:2014 pid:777844412 eyr:2040 hcl:#cfa07d ecl:brn

        cid:160 hgt:191cm eyr:2020 iyr:2012
        ecl:brn byr:1981 pid:077027782

        cid:182 hgt:176cm hcl:#7d3b0c
        eyr:2030 ecl:blu pid:096742425 iyr:2010 byr:1963

        byr:2010 cid:337 hcl:z pid:525126586 iyr:2010 hgt:73cm eyr:2040 ecl:blu

        ecl:gry
        iyr:2017
        hgt:185cm hcl:#6b5442 byr:1993
        eyr:2029 pid:366083139 cid:343

        eyr:2028 ecl:amb
        pid:878658841 byr:1960 hgt:179cm hcl:#18171d iyr:2010

        pid:537309261 iyr:2015 hgt:187cm
        hcl:#4fe831 eyr:2026
        ecl:blu byr:1982

        ecl:brn hgt:163cm
        eyr:2021 hcl:#6b5442 byr:1979 iyr:2013 pid:924759517

        pid:683651053 hcl:#179c55
        ecl:blu byr:1989 hgt:190cm
        iyr:2016
        eyr:2030

        ecl:grn
        iyr:2016 hcl:#b6652a
        byr:1994 eyr:2020 pid:448424292 hgt:174cm

        hgt:157cm
        ecl:grn
        byr:2000
        pid:734707993 hcl:#341e13 iyr:2020

        hcl:#341e13 hgt:156cm iyr:2020 pid:299213638
        byr:1947 ecl:hzl eyr:2023

        hgt:193cm hcl:#b6652a iyr:2014 ecl:hzl byr:1947 eyr:2025
        pid:044486467

        byr:1975
        hgt:159cm
        ecl:grn pid:318489576 eyr:2029 hcl:#6b5442
        iyr:2020

        iyr:2018 pid:512971930
        hcl:#888785 byr:1966 eyr:2024 hgt:158cm
        cid:100 ecl:gry

        ecl:amb eyr:2030 hgt:171cm hcl:#efcc98 pid:800921581 cid:339 byr:1980 iyr:2017

        iyr:2019 cid:172
        hgt:152cm
        eyr:2022 ecl:oth hcl:#602927 byr:1960

        iyr:2019 pid:762312913
        eyr:2029
        ecl:hzl
        hcl:#6b5442
        byr:1940
        hgt:169cm cid:289

        eyr:2022 ecl:gry byr:1976
        iyr:2020 hcl:#733820 hgt:172cm pid:040331561

        hgt:171cm ecl:brn iyr:2013 eyr:2027 byr:1940 hcl:#a6e32a pid:223986941

        hcl:#341e13
        eyr:2028 ecl:amb byr:1942
        hgt:166cm pid:435382099 iyr:2020

        cid:298 pid:641326891
        hgt:155cm hcl:#623a2f ecl:grn byr:1981 eyr:2025
        iyr:2010

        iyr:2015 pid:472000322 eyr:2021 byr:1977
        ecl:gry hgt:165cm cid:270

        eyr:2027 byr:1956
        pid:193087729 hcl:#ceb3a1
        cid:213 hgt:193cm ecl:oth

        iyr:2014
        byr:1971 cid:96
        hgt:74in
        pid:136003336
        eyr:2020 ecl:hzl hcl:#efcc98

        hcl:z pid:097595072 ecl:amb
        iyr:2015 byr:2021
        eyr:2039 hgt:188cm

        pid:74823273
        hcl:#341e13
        cid:166 hgt:182cm byr:2026 iyr:2027 ecl:amb
        eyr:2032

        byr:1932 eyr:2022 pid:367248062 hgt:182cm ecl:oth hcl:#c0946f
        iyr:2020

        hgt:72cm
        iyr:2015 cid:234 byr:2013
        ecl:brn pid:9401866358

        pid:022399779 iyr:2010 byr:1969 hcl:#6b5442
        ecl:grn eyr:2020
        hgt:189cm

        byr:1971 iyr:2011 cid:161 ecl:brn hgt:153cm
        eyr:2028 pid:819137905 hcl:#cfa07d

        cid:161 hgt:159cm iyr:2011 pid:815860793 hcl:#a97842 ecl:grn byr:1972 eyr:2027

        ecl:amb
        hgt:118 byr:1981 iyr:2019
        hcl:#a97842 eyr:2021 pid:270790642

        hcl:#b6652a pid:732272914 eyr:2030 hgt:183cm ecl:hzl
        byr:1934
        iyr:2018

        eyr:2027
        pid:877388498 hcl:#ceb3a1
        byr:1925 cid:236 ecl:grn
        iyr:2019 hgt:191cm

        eyr:2020 ecl:brn hcl:#fffffd hgt:181cm pid:801311341 byr:1986 iyr:2010

        byr:1925 cid:179 ecl:hzl pid:360641953 eyr:2030
        hgt:171in iyr:2015
        hcl:#602927

        cid:83 hgt:181cm
        eyr:2028 byr:1941 pid:165937945 hcl:#888785 iyr:2014
        ecl:grn

        hcl:#a97842 byr:1928
        iyr:2013
        pid:870072019 hgt:76in
        ecl:oth cid:127 eyr:2026

        cid:169
        hgt:187cm pid:008180128 iyr:2013 byr:1991 hcl:#7d3b0c ecl:hzl eyr:2026

        ecl:amb
        eyr:2027 hgt:155cm pid:586151564 iyr:2010
        byr:1949
        hcl:#18171d

        hgt:167cm
        iyr:2010 byr:1982 ecl:amb
        cid:235 pid:557737957 eyr:2020
        hcl:#ceb3a1

        ecl:grn byr:1939 hcl:#733820
        eyr:2026 pid:993218958 iyr:2010
        hgt:150cm

        hgt:68in ecl:blu
        byr:1965 iyr:2017 pid:854858050 eyr:2021

        ecl:gry pid:347763159 eyr:2024 iyr:2017 byr:1961
        hgt:151cm
        hcl:#623a2f

        ecl:utc hcl:#602927
        pid:#1408ff byr:1941
        cid:82
        iyr:2015 hgt:185cm eyr:2028

        iyr:2020 hgt:151cm eyr:2025
        byr:1934 hcl:#888785
        pid:396545094 ecl:oth

        hgt:153cm
        eyr:2028 hcl:#733820 ecl:gry iyr:2019
        pid:081352630 byr:1943

        eyr:2030
        iyr:2011
        ecl:grn pid:313741119
        hgt:161cm byr:1946
        hcl:#a97842

        byr:1968 ecl:gry
        pid:742357550
        eyr:2024 hcl:#18171d iyr:2018
        hgt:157cm

        pid:387505919
        ecl:oth byr:1945
        iyr:2014
        hgt:190cm hcl:#888785
        eyr:2028

        iyr:2017 hgt:175cm
        byr:1989 eyr:2022
        hcl:#b6652a pid:499016802 ecl:gry cid:136

        pid:490807331 iyr:2016
        hcl:#ceb3a1
        hgt:150cm eyr:2026
        ecl:amb byr:1967

        iyr:2011
        hgt:155in
        hcl:#ceb3a1 pid:118497416
        eyr:2029 byr:2011 ecl:oth

        hcl:03a888 byr:2029
        ecl:#6f7292 eyr:1969 iyr:2028 hgt:162cm pid:73551266

        iyr:2016 hgt:182cm
        byr:1966 ecl:grn eyr:2022
        hcl:#fffffd pid:061720787

        byr:1971 hcl:z
        eyr:2035 pid:158cm
        ecl:#d3ec19

        hcl:#623a2f hgt:156cm eyr:2028
        ecl:brn iyr:2013
        byr:1980 pid:112283719

        eyr:2020
        byr:1956 iyr:2013
        hcl:#6b5442
        ecl:grn pid:876589775 hgt:179cm

        hgt:138
        byr:2013 eyr:2040 iyr:2028 cid:197 ecl:#8844fd pid:8524414485
        hcl:z

        eyr:2040
        hgt:173in hcl:z pid:#654654 byr:2016 iyr:2022 ecl:#452d22

        iyr:2012 cid:265 eyr:2021 hgt:192cm
        byr:1993 ecl:brn

        eyr:2026 hcl:#888785
        hgt:158cm byr:1942
        iyr:2015
        ecl:amb pid:546984106

        iyr:2019
        ecl:hzl
        byr:1922 eyr:2028 hgt:172cm
        pid:465052232 hcl:#602927

        pid:710362693 eyr:2023
        hcl:#c0946f byr:1951 ecl:grn
        iyr:2019 hgt:190cm

        iyr:2024 pid:#a08e69
        hcl:z byr:1966 ecl:#7b9978 eyr:2035
        hgt:69cm

        hcl:#efcc98
        pid:164cm
        iyr:2010 cid:194 hgt:71cm byr:1923 eyr:2026

        hgt:65in
        iyr:2019 byr:1969 pid:466669360 eyr:2022 ecl:brn hcl:#b6652a

        pid:42472559 hcl:#6f5763
        eyr:2035
        iyr:2014 hgt:154in byr:1939 ecl:grt cid:323

        pid:715680334 hgt:166cm cid:283
        byr:1982
        iyr:2015 eyr:2030 hcl:#ceb3a1 ecl:grn

        eyr:2018 iyr:2029
        ecl:brn
        byr:2022 pid:#ff6df1
        hcl:z
        hgt:68cm

        pid:094541122
        eyr:2024 byr:1940
        ecl:amb iyr:2019 hgt:64in hcl:#733820

        hgt:163in
        eyr:2022 ecl:utc hcl:#ceb3a1 iyr:2028

        ecl:gry pid:53552934
        hgt:193 byr:2021
        eyr:2028
        iyr:2011 cid:98 hcl:90c63f

        eyr:2024 hcl:#cfa07d ecl:brn
        iyr:2019 byr:1993 hgt:156cm pid:449484188

        iyr:2020
        hgt:164cm hcl:#623a2f
        pid:820731743 eyr:2025
        byr:1997 ecl:hzl

        hcl:47242b ecl:utc hgt:156
        pid:#9a9903 eyr:2030 iyr:1990
        byr:2011

        hcl:#602927
        hgt:189cm
        pid:949021883 iyr:2014 ecl:oth cid:327
        eyr:2027 byr:1953

        hgt:189cm cid:301
        byr:1982
        ecl:grn
        eyr:2028 hcl:#733820 pid:796040143 iyr:2015

        cid:169 iyr:2013 pid:355177646 byr:1988
        ecl:oth
        hcl:#cfa07d
        hgt:185cm eyr:2022

        pid:563150261 eyr:2020 ecl:brn byr:1996 hcl:#7d3b0c iyr:2018 hgt:189cm cid:84

        cid:188 eyr:2027
        byr:1944
        pid:486184923
        iyr:2010 hgt:193cm hcl:#341e13 ecl:oth

        iyr:2019
        byr:1969 hgt:152cm pid:430698432 ecl:gry hcl:#888785 eyr:2026 cid:293

        ecl:gry
        cid:270 hcl:#602927 iyr:2017 hgt:151cm eyr:2029 pid:051398739 byr:1954

        ecl:oth eyr:2030 pid:024655030
        hgt:184cm byr:1969
        hcl:#18171d

        eyr:2030
        pid:899973263 hgt:178cm byr:1987 hcl:#cfa07d iyr:2012
        ecl:amb

        iyr:1958 hgt:165cm pid:377677319
        ecl:grt eyr:2032 byr:2025
        hcl:bbfbe2

        ecl:blu
        iyr:2016
        hgt:152cm byr:1964
        hcl:#c4f777
        eyr:2021
        pid:044307549 cid:80

        ecl:brn pid:330836320
        byr:1963 cid:217 hgt:169cm
        eyr:2024
        iyr:2019 hcl:#ceb3a1

        byr:1976 eyr:2027
        pid:452662874 hgt:192cm ecl:oth iyr:2018 hcl:#602927

        eyr:2027 hgt:183cm ecl:brn iyr:2017 hcl:#341e13 pid:827463598

        ecl:brn pid:930667228 cid:310 iyr:2020
        eyr:2027 hgt:160cm byr:1932 hcl:#c0946f

        pid:955804028 byr:1983
        hcl:#fffffd
        hgt:178cm iyr:2013
        eyr:2021 ecl:gry

        hgt:189cm eyr:2021 pid:430243363 iyr:2015 hcl:#ceb3a1
        byr:2000 ecl:oth cid:284

        pid:436671537 hcl:#cfa07d iyr:2011 cid:106 hgt:171cm
        ecl:blu eyr:2021 byr:1943

        eyr:2028 hgt:169cm
        iyr:2015 pid:177443573 byr:1945
        hcl:#c0946f ecl:gry

        hcl:#fffffd byr:1995 eyr:2021
        ecl:grn
        hgt:192cm iyr:2010 pid:754912745

        pid:330882171 iyr:2015 cid:211 ecl:grn byr:1961 eyr:2021 hcl:z
        hgt:169cm

        byr:1926 eyr:2029 pid:178633665 cid:141 iyr:2017 hcl:#b99eb9
        hgt:178cm ecl:brn

        eyr:2022 ecl:hzl hcl:#cfa07d hgt:168cm iyr:2015
        byr:1982 pid:645675448

        ecl:blu byr:1980 hgt:186cm iyr:2010 cid:94 hcl:#c0946f eyr:2027 pid:384440210

        cid:309 hcl:#602927 hgt:192cm eyr:2027 ecl:amb
        pid:527932745 iyr:2012 byr:1982

        cid:132
        ecl:blu iyr:2016
        eyr:2027 byr:1940 hcl:#341e13 hgt:166cm pid:613386501

        pid:360563823 eyr:2028 byr:1990 iyr:2016
        ecl:blu cid:287 hgt:162cm hcl:#888785

        hgt:161cm
        byr:2002
        hcl:#623a2f pid:535361632
        ecl:gry eyr:2021 iyr:2013

        hgt:67in
        byr:1967
        cid:333 hcl:#cfa07d
        iyr:2012 eyr:2024 ecl:hzl pid:538161833

        ecl:#2bc145 eyr:1963 iyr:2030
        cid:241 hcl:2fc384 hgt:156in pid:2899917140
        byr:2005

        eyr:2021 pid:021590229 ecl:gry
        hgt:164cm iyr:2013 hcl:#efcc98 byr:1985

        ecl:hzl byr:1943
        cid:279 pid:979130395
        iyr:2011
        hgt:165cm
        eyr:2021
        hcl:#f331b3

        hgt:161cm
        hcl:#888785 byr:1981 pid:835477382 eyr:2025 iyr:2012
        cid:348
        ecl:blu

        hgt:159cm hcl:b4ce6a cid:319 eyr:2035 iyr:1965 ecl:oth
        byr:2010 pid:158cm

        iyr:2020
        eyr:2026 ecl:grn hcl:#a97842 pid:126915503
        hgt:178cm byr:1986

        hgt:184cm ecl:hzl
        cid:67 iyr:2020 eyr:2026 pid:168775568 byr:1944 hcl:#a97842

        hcl:#fffffd iyr:2016 pid:379463363
        ecl:oth
        hgt:179cm byr:1988
        eyr:2028

        hcl:#cfa07d ecl:amb eyr:2030 pid:320360020
        iyr:2016 hgt:172cm byr:1961

        cid:221 hcl:#cfa07d byr:1946 eyr:2024 ecl:oth pid:066950409 hgt:173cm
        iyr:2020

        hcl:#602927 eyr:2028 ecl:gry iyr:2019 pid:583204134 byr:1966 hgt:178cm

        byr:1930
        iyr:2020 ecl:hzl
        hcl:#ceb3a1 pid:285751767 cid:287 eyr:2023 hgt:192cm

        eyr:2024
        ecl:hzl cid:87 iyr:2015
        hgt:152cm hcl:#18171d pid:959574669
        byr:1990

        pid:45938863
        hcl:49c7ce cid:349 hgt:181cm
        eyr:2023 ecl:grn iyr:2015 byr:1948

        hcl:#866857 iyr:2012 ecl:amb cid:132 byr:1955 hgt:162cm pid:597748286 eyr:2023

        pid:293364535 byr:2024
        hgt:177cm eyr:2039
        iyr:2020 hcl:#dae928 ecl:hzl

        pid:212659709 iyr:2018
        hgt:188cm
        hcl:#efcc98 byr:1974 eyr:2029 ecl:oth cid:244

        cid:140
        ecl:amb
        eyr:2022 hgt:181cm hcl:#efcc98
        byr:1943
        iyr:2016

        cid:71 hgt:151cm pid:5063555219 eyr:2023 ecl:hzl
        byr:2019
        hcl:#7d3b0c iyr:2023

        hgt:157in pid:#298b06 iyr:2030 ecl:#66a631 eyr:2035 hcl:z byr:2019

        hgt:190cm iyr:1943
        pid:644021656 hcl:#6b621c
        ecl:oth eyr:2021 byr:1923

        ecl:hzl iyr:2012 eyr:2023 pid:881271720 hcl:#ceb3a1 hgt:172cm
        byr:1957

        iyr:2017 hcl:#888785
        ecl:amb hgt:170cm byr:1967 pid:198856675 eyr:2027

        eyr:2026
        ecl:gry
        pid:834980363 hcl:#733820 byr:1930
        hgt:175cm iyr:2018
        cid:214

        hcl:#efcc98 eyr:2029 iyr:2010 pid:980087545
        ecl:brn hgt:157cm

        pid:57513658 iyr:2011 byr:1993 ecl:brn eyr:2027 hcl:#6b5442 hgt:165cm

        ecl:hzl
        eyr:2025
        hcl:#733820
        hgt:169cm iyr:2018 cid:328 byr:1999 pid:694719489

        eyr:2023
        cid:125 byr:1925
        hgt:185cm pid:806769540 iyr:2013 ecl:hzl
        hcl:#866857

        iyr:2010 cid:225
        ecl:hzl eyr:2027 pid:615545523
        hcl:#733820
        byr:1994
        hgt:166cm

        byr:1941 ecl:gry iyr:2019 eyr:2026 hgt:73cm hcl:#602927
        pid:352996721

        pid:140250433
        eyr:2030 ecl:grn
        hcl:#fffffd iyr:2011 byr:1937 hgt:185cm

        ecl:gry byr:2002 iyr:2017 hcl:#b6652a cid:261 pid:178cm eyr:2022 hgt:166cm

        ecl:grn iyr:2010 eyr:2022 byr:1924
        pid:214641920 hcl:#ceb3a1
        hgt:155cm

        hcl:z pid:150cm ecl:utc iyr:1981
        eyr:2034
        hgt:156in cid:260 byr:2027

        byr:1987 hgt:66in
        eyr:2021 pid:876757018 iyr:2015 hcl:d596e4 ecl:hzl

        cid:116 ecl:oth hgt:180cm
        iyr:2020 byr:1942 hcl:#2fc31f
        eyr:2027
        pid:253569416

        pid:509387921
        eyr:2022
        hcl:#888785 ecl:oth hgt:193cm
        iyr:2012 cid:97
        byr:1975

        hcl:#18171d hgt:190cm pid:062827417 byr:1939
        iyr:2019 eyr:2022
        ecl:hzl

        iyr:2025
        byr:2028
        hgt:165in eyr:2027 pid:6259332452
        hcl:#478251

        iyr:2018 eyr:2026 pid:523863237
        hgt:187cm
        ecl:oth
        byr:1944
        hcl:#a97842

        hgt:181cm hcl:#733820 pid:923996316
        cid:110
        iyr:2011 byr:1949 ecl:blu eyr:2023

        pid:304792392 hcl:487823 eyr:2020
        hgt:70cm byr:2024
        iyr:1953
        ecl:blu

        pid:142200694
        ecl:oth hcl:#888785 eyr:2028
        hgt:152cm byr:1954 iyr:2018

        ecl:utc
        iyr:2015 byr:1932 hcl:#623a2f
        eyr:2027 hgt:183cm pid:036300444

        iyr:2014 ecl:hzl byr:1935 hgt:190cm hcl:#efcc98 pid:945893288
        eyr:2025

        hcl:#efcc98 pid:252639104 hgt:188cm
        byr:1998 iyr:2019 ecl:grn
        eyr:2023

        hcl:58aa4a byr:1930 hgt:193cm
        iyr:1998 cid:196 ecl:brn
        eyr:2032

        iyr:2015 ecl:hzl
        hgt:193cm pid:653794674 eyr:2024
        hcl:#fffffd byr:1921

        pid:980680460 byr:1962 ecl:blu
        iyr:2013
        hcl:#72cace
        eyr:2030
        hgt:180cm

        eyr:2025
        hgt:182cm hcl:#ceb3a1 iyr:2010 byr:1945 cid:314 pid:597769706 ecl:amb

        pid:761757504
        hcl:#888785 hgt:161cm iyr:2015
        byr:1939 eyr:2025
        cid:326 ecl:blu

        ecl:gry
        hgt:163cm byr:1981
        pid:330818500 iyr:2017 eyr:2024
        cid:71 hcl:#888785

        pid:190cm cid:267 iyr:2015 ecl:brn
        hcl:869252
        byr:1935 hgt:142 eyr:2033

        cid:239
        eyr:2038 ecl:lzr hcl:z iyr:1987 pid:4632768239
        hgt:162in

        pid:158038227 ecl:brn byr:1995 eyr:2028 hcl:#efcc98
        cid:252 iyr:2021
        hgt:184cm

        eyr:2027
        cid:124 ecl:amb hgt:165cm byr:1949
        pid:727126101 iyr:2010 hcl:#602927

        ecl:grn
        byr:1966 pid:184245393 hgt:164cm
        eyr:2022
        iyr:2014 hcl:#866857

        cid:62 hgt:180cm eyr:2027 hcl:#18171d
        iyr:2017 ecl:blu byr:1942 pid:930210027

        ecl:grn hgt:171cm iyr:2017 hcl:#fffffd eyr:2029 byr:1946 pid:863414762
        cid:95

        eyr:2025 ecl:grn iyr:2019 cid:226 hcl:#b6652a
        byr:1932 pid:715708549
        hgt:156cm

        pid:505158338 iyr:2019 byr:1981 hgt:193cm
        hcl:#696a5c cid:57 ecl:hzl eyr:2023

        byr:1987
        hgt:155cm cid:99 ecl:grn iyr:2010
        hcl:#c0946f eyr:2023
        pid:431067921

        hgt:190in
        hcl:z eyr:2029 pid:74228790
        iyr:2016 byr:2018 ecl:brn

        eyr:2022
        ecl:xry hgt:154cm pid:62205162
        iyr:2014 byr:1936
        cid:61

        ecl:amb eyr:2026
        byr:1966 cid:95 hcl:#733820 pid:957767251 iyr:2013 hgt:157cm

        byr:1969
        hgt:156cm iyr:2013 ecl:blu hcl:#a97842
        cid:183
        pid:960672229 eyr:2020

        iyr:2013
        cid:243 eyr:2028 hgt:192cm hcl:#efcc98
        ecl:grn pid:222407433 byr:1978

        iyr:2014 byr:1935
        eyr:2021 cid:235 pid:#1b34e1
        hcl:#89313f hgt:164cm ecl:blu

        ecl:hzl iyr:2016 cid:327
        byr:1923 pid:695935353 hgt:184cm
        hcl:#a97842
        eyr:2028

        pid:6010745668
        byr:1934 ecl:oth eyr:2020 hgt:164cm
        hcl:#733820
        iyr:2016

        ecl:blu pid:071991002 eyr:2021 byr:1978 cid:321
        hcl:#efcc98
        iyr:2013 hgt:68in

        ecl:grn iyr:2015 pid:137792524 cid:156
        hcl:#efcc98
        eyr:2029 byr:1955
        hgt:165cm

        byr:1949
        hgt:176cm pid:531868428
        hcl:#cfa07d ecl:brn iyr:2014 eyr:2024

        iyr:1955 cid:108 pid:712137140 byr:2019 eyr:2040 hgt:184cm hcl:220cfe ecl:#551592

        iyr:2016 eyr:2030
        hgt:177cm cid:137 ecl:brn
        hcl:#efcc98 pid:712202745 byr:1938

        pid:357180007 iyr:2010 ecl:grn
        byr:1991
        hcl:#341e13
        eyr:2020 hgt:159cm

        eyr:2023 ecl:grn
        hcl:#733820 iyr:2020 byr:1927 hgt:151cm
        pid:165936826

        ecl:gry
        pid:794227261 iyr:2014 eyr:2030
        hcl:#18171d
        byr:1994
        hgt:162cm

        iyr:2017 eyr:2024
        hcl:#7d3b0c cid:279
        ecl:gry byr:1981 hgt:176cm pid:973822115

        eyr:2029
        hgt:152cm hcl:#fffffd ecl:amb byr:1946 iyr:2013
        cid:62 pid:005240023

        iyr:2010
        ecl:amb hcl:#341e13 hgt:184cm
        eyr:2027
        pid:976217816 byr:1950

        ecl:grn hgt:178cm cid:192 hcl:#602927 pid:684333017 eyr:2022
        iyr:2011 byr:1987

        pid:306960973 ecl:hzl hgt:168cm
        byr:1954 iyr:2015 eyr:2029 hcl:#602927

        hcl:#18171d
        byr:1973 ecl:hzl hgt:174cm pid:922891164
        iyr:2013
        eyr:2023

        byr:1998 hgt:189cm pid:472066200 ecl:gry iyr:2012 eyr:2021 hcl:#c0946f cid:299

        iyr:2014
        eyr:2028 byr:1922 pid:594856217 hgt:158cm
        ecl:oth
        hcl:#623a2f

        pid:215206381 byr:1928
        hgt:163cm
        hcl:#b6652a ecl:oth iyr:2011

        cid:145 iyr:2013
        ecl:#38a290
        eyr:2034
        hcl:#602927 hgt:186cm pid:517498756
        byr:1945

        hcl:#5637d2 eyr:2030 byr:1955
        hgt:187cm
        pid:862655087 iyr:2014 ecl:grn

        hcl:#7d3b0c hgt:176cm iyr:2019
        eyr:2029 byr:1980 ecl:hzl
        cid:346 pid:703908707

        hgt:185cm
        iyr:2017
        cid:120 eyr:2020 hcl:#733820 ecl:blu pid:458522542 byr:1966

        pid:#725759
        hcl:#602927 iyr:2013 byr:2003 eyr:2023 cid:100
        """
}
