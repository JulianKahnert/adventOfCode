import XCTest
@testable import AOC2020

final class Day1Tests: XCTestCase {

    func testPart1() {
        let result = expenseReportCalculation(Self.testValuesPart1)
        XCTAssertEqual(result, 514579)
    }

	func testResultPart1() {
        let result = expenseReportCalculation(Self.valuesPart1)

        print("Solution of part 1: \(result)")
        XCTAssertEqual(result, 494475)
	}

	func testPart2() {
        let result = expenseReportCalculation(Self.testValuesPart1, numOfAddends: 3)

        XCTAssertEqual(result, 241861950)
	}

    func testResultPart2() {
        let result = expenseReportCalculation(Self.valuesPart1, numOfAddends: 3)

        print("Solution of part 2: \(result))")
        XCTAssertEqual(result, 267520550)
    }
}

extension Day1Tests {
    static let testValuesPart1 = [
        1721,
        979,
        366,
        299,
        675,
        1456
    ]

    static let valuesPart1: [Int] = """
    1511
    1112
    1958
    1778
    1769
    1946
    1800
    1911
    1821
    1886
    285
    1649
    1952
    1428
    1779
    1822
    1793
    1968
    1898
    1497
    1071
    2000
    1902
    1860
    1960
    1282
    1732
    1845
    1917
    1937
    1477
    1471
    1728
    1957
    1558
    1472
    1931
    1864
    967
    1846
    1739
    1852
    1760
    1856
    1568
    503
    1897
    1548
    2009
    1662
    1767
    1899
    1842
    1995
    1885
    1904
    1870
    1881
    1788
    1709
    1980
    1296
    1678
    1985
    1830
    1932
    1961
    1964
    1828
    1458
    209
    1746
    1972
    27
    1491
    1956
    360
    1851
    1994
    1687
    1569
    1910
    1982
    1859
    1858
    1630
    1869
    1818
    1987
    1805
    1816
    1938
    1878
    1004
    1999
    1795
    1974
    1478
    1867
    1990
    1949
    1494
    1831
    1749
    1224
    550
    1951
    1692
    1475
    1810
    1770
    2010
    1266
    1591
    1916
    1735
    1119
    1928
    1719
    1918
    1017
    1935
    2001
    1776
    1484
    1577
    1813
    1888
    1906
    1742
    1078
    1796
    1664
    1656
    2002
    1676
    1505
    1930
    2004
    1806
    1792
    1798
    1883
    1836
    1892
    1699
    1900
    1914
    1988
    1882
    1832
    1874
    1723
    2005
    1977
    1903
    1473
    2003
    1781
    1414
    1921
    1947
    1919
    1814
    1400
    1839
    1824
    1812
    1820
    1756
    1099
    1991
    1850
    1058
    1700
    1753
    1159
    1825
    1997
    1896
    1762
    1872
    1963
    1761
    555
    1865
    1616
    1682
    1975
    1853
    1838
    1981
    1750
    1688
    766
    1474
    14
    1943
    1652
    1901
    """.split(separator: "\n")
        .map(String.init)
        .compactMap(Int.init)
}
