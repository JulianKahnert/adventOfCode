import XCTest
@testable import AOC2020

final class Day2Tests: XCTestCase {

    func testPart1() {
        let result = validPasswordCalculation(Self.testValuesPart1)
        XCTAssertEqual(result, 2)
    }

	func testResultPart1() {
        let result = validPasswordCalculation(Self.valuesPart1)

        print("Solution of part 1: \(result)")
        XCTAssertEqual(result, 556)
	}

	func testPart2() {
        let result = validPasswordCalculation2(Self.testValuesPart1)

        XCTAssertEqual(result, 1)
	}

    func testResultPart2() {
        let result = validPasswordCalculation2(Self.valuesPart1)

        print("Solution of part 2: \(result))")
        XCTAssertEqual(result, 605)
    }
}

extension Day2Tests {
    static let testValuesPart1: [String] = """
        1-3 a: abcde
        1-3 b: cdefg
        2-9 c: ccccccccc
        """
        .split(separator: "\n")
        .map(String.init)

    static let valuesPart1: [String] = """
        1-2 x: xpxc
        1-5 b: bwlbbbbcq
        3-5 v: qvjjdhvl
        9-12 t: ttfjvvtgxtctrntnhtt
        3-4 r: rqjw
        3-7 p: ppfpppppp
        5-6 q: qqqqgq
        7-10 v: gpvgmqkvxgbvs
        4-12 b: kkdnrhwzbbbb
        3-7 r: rrkwrshls
        3-4 l: ldltwzclnrllhkb
        4-6 m: mfcmmdvmmmm
        6-16 c: ccccczcccccccccgcc
        5-7 k: kkppkrr
        2-5 p: bpppmpcjrgwp
        8-14 c: dcwklzcckccwdw
        4-7 j: qhjjjhsj
        2-5 c: jcdclznbzb
        7-8 x: xxxxxxxsxxxxlxxxxxx
        6-7 s: rhsstssmvssss
        8-16 j: rhsxwjrtpjjjjxhcjhx
        13-14 q: lqmqqqzsvqqjqq
        5-7 g: gggsfggj
        15-16 s: ssssssssssssssxd
        3-5 d: dmwsm
        4-5 v: vbvvvg
        5-6 f: jfzbgfp
        1-4 k: qkkkk
        11-15 l: lllllllllllllln
        12-16 n: nfpnnnnnnhncnjnnls
        6-8 l: llllllllll
        13-15 p: pppppppppppphppp
        4-9 k: bkvqvwkgk
        1-3 j: jsrg
        10-14 r: rrvfrvrrrrtrrmsr
        2-4 r: tcfnd
        5-6 t: ttwtjk
        7-18 h: wjjfhphhbqlvqkhjwhk
        6-9 p: phkkzvppppjpcpnfpsxt
        5-6 f: ffffmfffffff
        9-16 p: gbwsmxplndwmrpps
        1-6 s: sczssw
        5-14 t: ctxlqhrlvvdttwlnt
        2-5 n: nndkqnnft
        7-8 c: zclccrwc
        4-11 q: pqrqdkpqbjshn
        5-6 m: nmcmrbmfcgmfw
        16-17 h: hhhhhhhxhhrhhhhhlh
        5-6 v: vvvvvv
        2-11 m: wpsmlpznxdkhs
        3-4 s: sswf
        2-3 s: hsbczzspqkwjr
        4-7 s: zsjrrsvssss
        11-16 j: hpjdcwpjjnjfgkjlxt
        5-7 b: rcbbbbg
        13-15 w: wwwwwwwwwwwwwwww
        1-6 c: cccmgc
        2-4 v: vvgv
        4-5 m: mfmmhms
        1-3 t: mntqgkdfjsxzptk
        2-7 v: nvnqmvv
        19-20 c: ccccccccccccccpcccfc
        11-12 t: wttmnqtbkttc
        3-5 p: ptpvp
        1-11 l: lglwgtlqlnxl
        4-8 m: mprmmmmwmmfmm
        9-10 d: ddddddddxdd
        16-20 r: rrrrrrrrrrrrrrrlrrrt
        1-4 g: gggg
        2-12 b: bczgbbbfbwbprbbbtb
        2-7 n: nnnmnxkntwwxnr
        14-18 z: tzzzqzzzlnpqzpzzkz
        5-7 p: ppppmkp
        9-14 c: vvcgvrxlccxvlpfml
        2-3 l: jlzpf
        3-5 p: pbpbp
        9-13 j: jjjjjjjjjjjjj
        5-7 k: fmckjkkklkxpf
        5-6 d: ddddrd
        9-10 s: sssnsgssbs
        9-10 p: ppwvppbpptpp
        1-8 z: kmfszzrx
        9-10 v: vvjjvsklvdkrkvs
        2-17 k: kkctmcfzhtvskxlkq
        10-12 n: vjnndvnlgnhmfc
        5-6 n: hnnnnntn
        1-6 f: fptffkhhkktfbtst
        4-6 k: kqnkjhhwqhpzb
        6-12 r: rrrrrrrrrrrv
        8-13 l: llllllllwlllllll
        4-6 p: qxprzs
        2-10 w: wswpdwwwrcth
        4-6 n: gnnfnnnnnnn
        10-14 s: ssssssprbfssssw
        3-4 f: ftfk
        6-16 x: cqxxqwrdxxxxsxbxxxxt
        4-8 f: ffsqvfpm
        8-11 t: ttztttttttnttt
        13-15 q: qqnqqqqqqqqqqqq
        2-3 w: wwww
        2-8 n: ntnnnnnrnn
        2-3 k: jkzkk
        3-4 s: sscscp
        14-19 g: gzggggggggggfgfgggqg
        5-6 n: nnnnwlnn
        11-12 b: bbmbbbbbbbxbbn
        5-6 t: zntzfk
        4-5 j: ljphjl
        3-12 d: zndtlvdvvdzzn
        7-8 h: hhhhhhhwhh
        12-13 s: sssssshssxssss
        4-5 h: nhsxxmh
        7-9 f: fzfkffffsfxn
        1-8 c: cccfcpccmhcch
        1-2 d: kfdwwm
        13-14 l: llllllllllllcll
        2-5 p: jpxdpkg
        2-4 h: hvhbmhhhhhnh
        5-9 g: ngqgtqtggdgg
        15-17 b: brhlrjflddssrrjxb
        10-15 v: vkfvvqtcxvvvtvcbvv
        1-3 g: pvkqsgzggg
        7-8 j: jjjjjjbjj
        3-4 w: jwrw
        4-7 c: mhcmkcjrpncxmcrccbc
        9-12 q: qqqqqqqqqqqs
        13-16 n: nwngndnnnnnnnnnnnn
        3-4 b: fjbbb
        8-9 d: jdfdsqnmdwfdnddkd
        1-4 f: ggfwgbfhvs
        4-5 g: gggvg
        8-12 x: gxhxxxxkxzmfxxx
        1-5 q: dqqhq
        3-9 m: mmdmmmzmmp
        1-2 l: llll
        6-8 q: qjwhqqhpkbzppc
        3-10 m: mmcjgrtzmmdmmm
        2-4 q: cxvq
        11-13 v: fvvvvvvvvvvvv
        7-13 b: bbbgbnbkbkbrldbbtc
        14-16 m: wmmmmmzxrmmjmwmh
        6-10 b: bwvwbbvshbgtbsrlwbzt
        6-8 q: qdwhcgpqxw
        16-17 l: llllbjlrllllcbdhllpl
        3-4 m: mmmrv
        7-8 m: mhjnnchg
        12-13 p: ppppppppppppt
        1-4 s: sssx
        1-2 d: xmpdq
        10-11 x: xxxxxxxxxbbx
        2-4 s: lxds
        1-4 b: jbsxbbmbbj
        6-8 q: qqqqqqblqq
        15-16 q: qqqqqwzqqqqqnqqqqfq
        5-7 s: fzvsssr
        6-7 l: lncbgqr
        7-8 s: ssssssvs
        3-5 r: rbrjt
        3-8 j: ksjjtvnjbjppjjjl
        6-10 s: sszlkrsssss
        1-4 z: znzfpz
        7-11 m: dfkcbxmxmnmmtvmtdn
        6-9 h: hlhhkhhhq
        8-9 p: ppppppppvp
        6-9 c: cccgccccmcch
        5-8 g: bgkggjgtvggn
        3-4 x: xxhk
        10-12 h: hhhhhhhhhlhhhhdnh
        5-6 j: zjjsjn
        9-14 s: ksclwttsmpjtds
        6-7 l: gtdcblql
        1-4 d: dkndjkcd
        1-6 k: kkkkkckmc
        10-12 x: xxxxxxxxxrxl
        2-5 v: fxdjtv
        3-5 q: pjmkqdmqnzqppr
        5-8 t: xtgtgtcht
        6-11 j: nftjzjmfljqjrc
        6-9 g: rskgggmgmwjggggvgb
        11-12 v: vkvdmvdvvvdv
        15-16 z: zzzzzzzzzzzzzzgxz
        13-17 v: vvvvvvvvvvvvvvvvnv
        9-14 j: clrfkrwhjtvzvqqj
        1-12 l: lljljznslllffhblz
        4-7 c: cccgcxclc
        6-11 z: tbxqrzzbwbr
        18-19 m: jmbmmqmshmczlphfgmf
        1-5 s: ssvsq
        4-5 k: kkkkw
        4-7 f: fcqffxff
        3-8 f: fffzthzf
        9-12 v: vvvvvvvvvvvmvv
        14-17 f: ftflcfffjtjrvfkffmvf
        4-7 n: pnmnxnqqjp
        6-7 r: rrrkrmr
        4-13 k: drckdzxrsmzrkqckn
        5-14 t: dttttttttttttt
        13-14 v: vvvvfvvvvvvvvvv
        7-12 j: jrljwnctjqjjxj
        6-7 v: wchfzvm
        1-8 d: dddddddzd
        10-12 g: gvvzrglgrgggggggggg
        3-4 n: ngtnnn
        2-4 b: fzbb
        1-15 x: cxxfxxxckxxhxlxxxxxx
        7-19 f: ffkzcglddffcfvfhffv
        9-12 s: sssssssmssss
        13-20 t: ttttmttttttthtttddtt
        2-15 v: vvqvcwvvvvsvvqvwm
        5-10 w: wxcstswwwwnc
        3-4 v: tjvvnvvtzfdcjjwb
        1-2 l: lbclr
        2-13 d: dkdlddcddddddd
        2-7 n: npnngnnn
        4-12 g: kmvvmfngwmlg
        1-2 w: wwwww
        5-11 t: ttttjtttttttttttt
        4-5 r: srlrrr
        5-8 q: qhqfpjqsnqqkq
        8-15 s: hvtnslpsfbsssrw
        11-16 n: gnwnfndrnnhnnknsnnc
        2-7 r: tdrrshrrhsxrr
        16-18 m: mmbmmmjmmmmmmmmmmbm
        6-7 n: nnnnnxt
        4-6 k: dpxzklksk
        1-9 g: ggkxhgggggggggggqg
        1-8 l: lllglllh
        1-4 c: cwtc
        5-6 h: vhhhvshh
        10-11 x: xxxxxxxxxxc
        2-3 q: qhqqgqmt
        3-6 k: hkqqshgjnxmlkrjdzg
        9-11 l: llprlllllllll
        5-7 l: lknflmrv
        8-9 h: hhhhhhhhh
        7-8 z: zzzzzgvzzzzz
        18-20 v: vvvvvvvhbvqvgvlvjbrv
        13-15 k: xkfcvkrnfkkkvcpt
        3-5 l: llnnglmgtz
        15-19 t: tmtsfttxtctdtgtmpttt
        6-8 f: gmffwvffff
        10-13 d: dndsddddddpdjndddd
        7-10 r: rjzqrpgrrrcmrrg
        1-4 m: hlmm
        9-15 d: pdddlrwdzddddddd
        6-13 q: qqqhnvqqqqqqfbqq
        1-11 z: wzsqmnrzwzzhzxczzzzd
        6-11 t: tptnjttkttttvtttr
        3-5 n: nnznnn
        5-6 t: trtttslv
        5-6 g: gggggt
        15-19 s: sssssssssssxsswsssss
        1-13 q: wzqjljdqqqqnqq
        6-7 k: kkkkkgkkk
        4-5 k: zkxvk
        7-14 t: thsstltbvmsctqkfhdzc
        2-5 n: hnnnn
        2-16 t: gsvkhmhktcxkfqbtd
        8-9 q: qqtzznrqg
        17-18 v: vvzvvvvvvvvvvvvvlk
        3-4 v: vvvl
        3-4 b: bbvb
        10-12 w: wwwcwwwwwwkzwhw
        1-3 d: ntps
        8-9 j: mqcjcjjfjjhjbjj
        1-7 j: mjjjjjjj
        13-14 f: bzffglvfcfsfjb
        2-3 k: kqkq
        7-15 c: fccpccshcccccccc
        12-13 k: kkkkkkpkktksqk
        12-13 w: rwwwwwkwwwwswwwhw
        5-12 k: nlkthkkklkkktchmhb
        15-16 f: fffffffdffffffbf
        3-4 k: kqkprkkp
        4-5 p: dcpdppzpppjqm
        4-7 b: qbbkgbgz
        10-11 n: nnnnnnnnnnw
        9-12 h: hhhchbhhvhrhhh
        3-5 h: hrhnbcl
        6-10 v: nvlvhvrpvvvvvvv
        3-6 d: dddddjd
        4-5 r: rrcvr
        7-12 l: llllllllllllltll
        3-6 b: zbbbbt
        6-10 z: zznzzzzzbzbhzz
        2-5 h: rfwbmkhmhhhmjhmh
        11-13 q: wkkzzqxvqqsqx
        2-15 p: hbpjpppppptppppzb
        9-10 b: bbmbbbbbsb
        3-10 t: cqmtttjtttttf
        8-11 v: tvgcvvvvvkv
        6-9 g: tggnggtggkg
        3-6 w: dfwnht
        8-14 c: pncwqccsfgctpccxc
        6-9 p: bpppjtzprggp
        15-18 j: sjjjjjjdjmjbjjpvjj
        1-6 m: mhmkrhxn
        10-11 d: xcjtpdwdcfvhqdksfhd
        16-17 t: txtlrttctwtztttnx
        13-14 j: jjtjjmjjnjjjjjjj
        10-12 m: ldqmmmgmmxrmfwrbv
        4-6 p: psmpnpkfq
        13-14 t: tltttsttmtttjttt
        7-9 g: ggggggbgv
        8-9 q: qqqqqqqqd
        4-5 d: ddddl
        14-16 g: gggggggwggpgfpgm
        4-5 v: vvvvl
        5-8 v: gtjpvvdv
        5-11 s: dsslsvqpwsss
        4-6 h: hhhghh
        16-17 k: hkkkkkkkkkkkkkkqj
        5-10 d: dddtddddjd
        6-7 v: vclfvvzvj
        6-8 m: dtkbcblppzx
        1-4 g: hggggg
        9-11 q: qdqvdqkdfqvqzqkq
        2-6 s: ssgsbswhs
        3-8 j: jjpjjjjv
        3-8 d: dddddddqdddd
        6-8 v: vvvvhcvn
        6-12 z: gzzzzzzzzzzkzzzzz
        5-12 k: nrkzklbxcwbc
        10-14 p: clxjpnhsvttnjp
        6-17 w: vztxwwwgwlwcwwwtw
        8-11 c: cctzcccqcjc
        1-3 b: zdqx
        3-5 x: dvxxxx
        6-13 b: gvbbbbbbbbvpkbb
        7-12 k: hkbkkqkvkmpkrhk
        3-6 c: ccrbcdccc
        4-6 m: znhphh
        4-11 x: xmmgbxxgdxxtbwg
        15-16 m: nmmbmmbjmrbvmmbm
        11-12 j: jdcjjtsjjdjj
        1-4 c: cccfcc
        6-15 n: ssvnnnnnnwnggzmp
        4-6 l: qwfllpx
        6-9 b: bbbbbsbbmb
        3-6 j: ljjgfh
        5-9 t: tttttphtwtvtf
        8-12 x: xtdxxxdjghxxpxhkbxx
        5-9 r: rrprrmrrrjvszrrtp
        15-16 r: lrrrrrrrrrrrkrrrr
        2-5 q: ltfgqcqmt
        7-13 k: zkkkkkkkkkkkhkkkkk
        5-6 z: zzzzzszz
        2-7 g: tnjqnsgkdtc
        3-4 j: njjjgkxcgckj
        4-7 j: rxmjlxzhjjjsgjcj
        7-10 f: rmfbffhffcf
        11-12 h: hdhhhhhhhhhsh
        7-8 v: nwrvvvvdv
        8-9 l: llllllllf
        4-5 r: rmxrrrrx
        2-3 c: ccgdcc
        13-15 r: rrwrrrnrrrrrdrslr
        4-16 x: cnlxmtpxdzxblfxxjd
        4-5 m: mmmmtm
        9-13 x: gxxxxxxlxxqxxxxx
        1-3 d: ddhd
        11-14 f: tffffffffqlfff
        2-4 r: xrrf
        1-11 m: mtdmsmmmmdmmmmmsmtmr
        1-8 g: pggtggggdgmgggn
        7-8 f: ffvfffpff
        2-7 k: khqgfzk
        11-12 s: ssssssssssbsss
        7-14 h: hthpwhhxhglzqtmhh
        2-4 z: zzpmz
        16-18 x: xxxqxxmlgbxxxxxxxx
        9-11 v: dblhzhvvvnfvptvmf
        4-11 n: nxsddnsnnngsdnghngk
        8-11 x: xxxxxxxwxxxxxxxxx
        1-4 s: swst
        13-14 m: mgmmghmmmmmmrmmfmmmg
        4-5 c: dcccc
        4-5 r: jzrrc
        13-19 b: bbbbbbbbbbbcbcbbbbb
        11-14 c: ccccncfclccccfcccm
        3-4 t: tstl
        1-20 v: vzrzgsvsfgxjqkxgdpwv
        14-15 h: hhvkbhhhhhhhhmhhsh
        9-13 b: bbbbbbbbtbbbbbb
        2-3 b: zbbb
        17-18 s: smsssssrsssssssssfss
        5-10 v: vfvvvfvdvjvlltv
        9-10 n: nnnqnnnnxtn
        6-7 w: pwtwwwfkwvk
        11-14 z: wzzzzzjzzzlzzkz
        5-6 l: lxlllv
        5-8 v: vvvvvvthhv
        1-9 r: rrrrjkzrdqmr
        6-8 s: sssssssg
        2-4 f: frfff
        1-16 r: pzbdrgnpndnrrwkczmr
        8-9 b: sbbbbbbblkwb
        2-5 z: zzjzz
        3-6 q: qqwqqr
        2-13 v: vbvvbvvjvvnvcdnvc
        12-15 p: pppppppppppppppp
        2-7 m: mmmmmmd
        6-11 f: ffffffffffz
        5-6 r: drrthrzrrrp
        2-7 q: fntqnbqqzb
        5-14 w: wlfwstdfzvwvqw
        4-7 s: mgsssslfjzsssv
        7-8 g: tgtgjrggggsggtg
        11-19 z: fkzzzvzzvzdzzzzzfzz
        3-7 w: kwcwwww
        6-14 s: sssssssssssswjss
        7-8 v: vvmbxvxv
        2-6 n: nnnnnp
        7-8 b: bbbbbbbb
        3-6 z: zzzzhz
        11-17 t: bltttdttttttttttzt
        1-9 l: llllllvll
        10-11 n: tznsxfhdpnn
        6-8 t: tttttnttt
        4-10 p: pppppppbppppppnc
        4-11 j: rhvjjjjjjwjnrcp
        3-4 j: cjjj
        7-12 v: kmctjvksqzvv
        16-17 w: wwwwwwwwcwwwwwwwwww
        12-16 f: fffffjbfffwffwffff
        9-10 p: ppntppppjppkpdp
        3-4 l: lllcf
        5-6 b: dbbbbsbtb
        2-3 p: pvpz
        5-6 f: pqffdf
        1-3 l: lnlpxl
        8-10 n: nnnjttnxmmns
        1-10 j: xjjwtjtjjjjjjj
        2-8 m: smwmcmzrfqbmmwdmm
        1-6 k: jxpsfkkkgm
        5-9 f: zjfffjjwknqh
        1-6 c: rcccczcccccc
        13-17 g: zsgpfppggwshgbtggxzh
        12-14 n: qmknbfcgnnnhwn
        1-6 k: vdklkkzkkkkfkm
        1-3 h: hhlhhhl
        16-18 p: qggnxmswcppklptgsp
        1-4 m: vmmqmmmmmmm
        8-10 l: lllllxlllvllg
        4-12 g: gjgghggwctzvgggggg
        8-11 x: jxhxxxxxxxx
        4-16 n: xnrnbkrkdvntnjkc
        2-4 m: mdmmj
        6-7 n: nnnnnngnnnntn
        1-13 j: jjjgjjjfgjjmj
        8-10 z: zzzzzzpjtz
        1-18 f: ffkwvfgcrnffgnffmf
        4-5 j: jjtjvb
        6-11 s: ssscsnslsssssssshsss
        11-12 n: nnnnnnnnnnmd
        2-10 n: cpnhnrnbknnkwnbnlb
        2-4 d: dddnh
        9-12 f: fffffffffffldfff
        1-9 d: ddddddvdlddddd
        1-8 w: wnwwwdwww
        3-4 h: bhgv
        1-4 x: vxxj
        3-4 g: gmgbg
        7-8 j: nzwgbtnj
        3-6 z: zzpzzhzw
        8-10 h: hmhhhhszgz
        1-5 m: dnqgnxjm
        11-12 z: zkzpbjxszzzhwgdz
        10-11 r: rlrrrrrrrrr
        1-2 v: vvvvtsvvvvvvvvqvvvn
        13-14 n: nrfzqlxxxsxqhnkhrmws
        1-4 z: znftzjjwzc
        6-15 v: fvvvlvvhvvvvvzhvv
        5-10 x: mtxprgbqxxkfnssvq
        8-9 f: lffffffwf
        1-4 g: grxgvlhflrbghj
        3-5 c: fcxcl
        6-7 s: ssssdds
        10-13 l: llllllllllllxl
        12-15 j: jjvjjbjcjjjjsjjj
        1-2 c: ctggc
        2-4 w: wbwwwwr
        8-20 v: phvvvvvrbvvfvvvvvvhv
        5-8 v: cvvnvjbl
        4-19 x: xhvxflxpkxxcfvwxxhl
        1-2 m: mgqj
        5-6 q: wpxdbq
        19-20 d: ddddddbxddddddddddpd
        5-11 d: dhhwddjddkdd
        6-7 g: ggggggn
        1-7 h: zhphhhhhgn
        7-11 s: ssssssssssksssss
        2-3 n: hnwn
        8-9 h: hhsshhhhh
        1-2 c: ccwcc
        2-5 s: cdsmmfqfcrsh
        3-5 m: mwmjt
        1-4 n: ndntnnnnnnnnnn
        4-6 s: ssslsssshsssmq
        5-16 r: rrrrcrrrjrrrrrrrrr
        1-6 v: bvvvvvvv
        9-10 t: tsttttztxtttttb
        8-12 d: tvrbvwxdddxmhfsd
        3-9 w: wbwwwwwwww
        3-5 g: bgglcqg
        8-12 f: fqffvdzslhksrv
        1-4 h: hsqh
        6-12 b: hbwhxbfppkbb
        12-15 l: llllllllllllllplv
        16-17 m: mmmmmzmvmmmmmmkmhmmm
        2-8 p: mpnnnpwpv
        9-10 x: xxpxxxxlcxj
        10-14 c: mccclvcccfcckwcbczc
        2-3 v: vvsrg
        13-15 h: hhhhrlhfhhhhvhhhshh
        3-8 z: vsbkqlzzzzzsmzw
        9-11 h: qhhhhhhhddnh
        4-5 h: hhhkxhh
        7-12 t: dtcvttttbhnntft
        1-5 z: kksnxzzxz
        1-3 j: cjjjjjjjfjj
        12-15 s: sslssstssssssszss
        2-4 c: mntc
        5-8 v: mvbsvfvvvlsrv
        5-6 z: zmhfjq
        10-15 r: rrrrrrrjrbrmrjr
        9-11 j: jjjjjjjjjjxjjj
        1-2 d: jwhdd
        4-5 m: mmmkm
        1-7 j: rprmjbxjj
        13-14 g: ggggggpqggggqgg
        1-5 l: llxzlkpptdzg
        1-2 z: zzzzzzzzzzzzjzzz
        3-4 h: qhhwtz
        2-5 t: tptttt
        1-14 c: cccccccccccccxcccc
        8-9 t: tgtpttwtqttvt
        1-16 m: mhmtpmmpmmtmzmmcqj
        3-4 q: qqvq
        10-11 h: hxhhhhhhhbhh
        5-6 n: xlchhnljrlnfrlwzs
        1-9 x: mxxxxxxxtxxxfxx
        2-7 n: bbnnrqmnnnnnl
        2-7 p: rgpqnqp
        3-4 f: fndf
        10-11 c: cccccccccqc
        3-10 l: lpzxlhpslfh
        3-5 k: kkkkkkk
        14-17 b: bbbbbbbtbbbbbfbbbb
        1-2 f: gfff
        10-14 j: jjjjjjhjjjdjrjc
        1-9 s: wszsswssspsss
        4-6 k: dckkkkkk
        3-13 h: hhvkvhhhhhhdhh
        15-16 g: ggggggggggggggngg
        2-11 m: nzdsmbqtmmmmxskcmmv
        3-11 m: mmmkmhxmwmcmqdlpmf
        1-8 n: snnnbnwn
        1-13 j: pjjjjjgjjjjjxjj
        3-18 m: mmvvmqmlmmmmzcmkwqlw
        1-4 d: dbdx
        12-15 r: rrrrrrmrrrrrrrr
        4-18 s: sssvsssssszsssssscss
        2-5 q: nqbmmbqds
        3-12 d: hrdvzzcrbjwdkgddbrpq
        2-3 r: rsrghkrmdsfm
        5-9 k: twfwkkkswqkkkkwv
        4-6 p: tppxpstmxcw
        12-13 k: kkkktkkkkrkksk
        1-2 m: lmmm
        3-5 s: shsss
        6-7 c: ccccclc
        10-17 s: ssssshsssssssssshs
        6-15 n: nnnxnrtfnnnnnnnnn
        3-18 s: jsfcdsscssmnsgssnj
        7-8 x: xxcxxxxr
        3-5 l: lvlllll
        11-12 h: hmhhhhhhhcxjhhfdh
        3-4 d: wdfdd
        3-4 r: qrvr
        10-18 j: mvwlxblnhjddlzkhqjfj
        6-20 b: bhbbbbbbbbbtbbkbbbbc
        8-9 c: cclccmnrr
        3-6 w: wwwwwww
        5-9 k: dlgkjnqxk
        12-18 f: fqfffbfffffcfffhfkf
        1-3 w: fwwgjsclwpw
        6-7 z: zwzzzzl
        14-16 r: jrrrrrrrrrrrrfrrrr
        11-14 b: bbbbbbbbbbbbbw
        9-11 h: hhhzhhhfxhhhh
        3-4 p: pplnp
        2-3 f: ffff
        5-8 p: lppppppsppppppp
        17-18 w: wwwwwwwwwwwwwwwwzcww
        11-13 n: nnnnnnnqnnnnfn
        7-12 f: fxmfpdfjrffjgtffzlfg
        4-16 w: bctwmwtxvwqzrwwwwhw
        2-7 m: gmmmmmjmmmm
        1-15 q: tqqqqqqqqqqqqqqq
        3-4 q: gqwq
        3-12 s: ssssssssssrhpsg
        6-8 m: mrmlmhcrsm
        4-9 q: gdbffcqbqt
        1-17 k: kkkkkkkkkkkkkkkkkmk
        15-16 h: hghhhhhhhhhhhhrhh
        4-5 p: pkpzmb
        2-18 h: khvkdpbxdptllfdxvhh
        18-20 z: zzczzzzzzzzzzzzzzpzs
        1-11 p: ppppppcpzppppppppp
        4-9 z: ztpfrjzwnv
        6-11 x: snxxtstcqhv
        3-5 c: nrlcccbcpsvcc
        2-7 z: dztxzzqmfzrpz
        5-14 w: pbcjnqpwwlccfscz
        1-5 f: rfndsxdmhbgf
        8-14 t: ttttpdfwtxfttd
        2-11 l: lndmmrnxdmdpdmlzll
        3-4 h: chzl
        10-17 d: ngkkdbvflmcssmgmdk
        4-7 d: bhksdtd
        2-6 k: ktkdkzwsgkhkk
        1-4 r: hrrs
        15-19 j: ndnvjfjljnwklsmdbjj
        5-12 v: vhvvvrvgvvqgwvvbfv
        2-3 r: rfkkhrrhqhks
        13-17 q: qqmlqqqqqmqqvqqqcqq
        4-15 z: zvbkvbzczkrttcz
        4-8 s: ssssssss
        13-14 x: xmxxrxxxgxxxmb
        7-10 s: sfjzslwsqsss
        4-13 c: clccncccccccpc
        2-4 l: lddlpplrqqs
        12-13 j: jjjvjjhjjjjmjjjjj
        6-9 n: lnnznnpnclnnn
        6-10 g: gggggggwgjgg
        4-6 l: tjhqmr
        2-4 d: hddxjdvj
        5-13 t: tzftwttwttjttt
        1-9 j: jnjjjkjftjjfmjhjkj
        8-9 q: qqqsqqqjj
        15-19 l: lllllbtdlsllllllxlfl
        5-6 g: gkgkrsgg
        2-4 t: tttb
        12-15 p: jpppppspgpppppkxb
        10-13 n: nznprnnhnmgxhxnknnnn
        12-13 d: dddsdddddddsd
        5-15 q: qqqqkqqqmqfzqqqw
        5-9 s: nmgslvgdz
        1-4 d: gddkddd
        12-16 v: zvdsdsgjrtjvzsjtx
        11-14 q: pqdgjqqqqgqqjwlqqqmq
        2-7 p: pkpqsppqgz
        6-10 b: bzdbbbbbbvbbbx
        14-15 v: vvvvqvvvcvvvvvvv
        4-5 w: wjwwwhjwg
        5-10 x: wgthfxtdpxx
        6-7 c: ccqcfcbcccbml
        6-7 w: rwwwwxb
        4-5 n: jnnnngvljjmnr
        3-11 m: lbmmmmmmmmtxgxmmzm
        1-2 b: bbbvjcbbb
        6-9 b: tbwbbcbbbb
        11-13 d: sdkwqrjdddbdd
        9-15 t: ttttpqttjttttsjt
        5-7 j: jjjjjjzj
        12-13 v: vvjvmvvqvfzvcvvvvvv
        6-7 d: ddlddrd
        5-6 j: jjjjwj
        5-6 f: fffffp
        6-7 w: zwmwdwww
        1-4 d: jddddppdktdgh
        4-14 n: nnnnncnnnnnnnnrn
        14-17 c: ccccccsdccccccccn
        3-4 z: zzzgqz
        5-17 m: mmrsmmnzqlnbmmlljwpm
        3-5 j: cgvjh
        12-13 w: wtgblrdchjjkfhg
        4-7 t: rgclgtt
        1-3 k: wckhkkkjkk
        6-11 n: nnnnnnnnnnvn
        17-18 k: kktkkkknczkkkkhkkk
        1-6 x: rwxqgxrxxxmsmkrx
        17-18 g: ggggggggggggggqgjp
        14-17 w: wwwwwwwwwwwwwnwww
        11-12 w: vcbmkbwnwbwww
        15-16 g: gggggggggghjgwgggjvg
        5-9 n: nnnnwnnnfnnnnnnsnnnn
        3-4 k: kkkjhk
        5-8 k: kkkkmkkkk
        9-13 k: kkrskkkkkkkqfkknmz
        2-3 j: jtjcj
        7-8 c: ccvcrcsxc
        5-9 k: kkkkgkkkkk
        4-5 h: hhzsxv
        1-7 d: lgdbdhdddd
        5-6 j: dsjjkj
        7-20 x: xnxwmwkbbbkjbpfwkpgx
        11-12 q: wmbqtffthfcqgq
        7-16 h: hhfkhhdhhhhhhhhhhhh
        9-13 b: bhbfbmbbsgbbfbj
        8-10 w: xwwmwwwgfwwzpwnw
        7-11 m: bmrmbwmmmmmmmm
        8-9 d: lshdfglpdq
        11-13 w: vxwwwwxckwwkww
        8-13 x: xxzxgtpxxlxxx
        8-13 z: jrsfgvzzzwrdxz
        10-11 q: qqqqqlqqqqq
        2-7 m: knxnmxm
        2-4 n: znnhnnnnnnn
        4-6 k: kmxgkkk
        10-18 z: qhhzhzbldchlmwdzfrsz
        3-4 n: nnnt
        11-15 v: vvvvvvvvvvwvwvf
        4-9 x: dxjxnmghvrxbnzgxljc
        1-2 m: mmgm
        18-19 z: zzzzczzzzczzzzzzzjsz
        6-20 p: pkhzdzpppfbphphpxppp
        3-9 h: zxhqqkkqknkfvq
        5-8 l: lllltlll
        8-10 z: zdzzzzmszz
        10-17 l: txhgwzsrjlvlvglxl
        1-12 s: bvgswssssmssvssssssb
        3-6 j: xjjbjt
        3-5 x: xxlxq
        5-15 r: htprxzjstgzpddrtjrr
        1-10 x: xzftsqxxpgzdlcth
        6-9 w: wbdwwpbwwwwcrx
        4-11 n: nnknnhnnnnk
        8-11 f: ffffffpsfffff
        6-9 h: hhhnhhqhhhnhvv
        6-9 x: gqxzhlpnxlcrwnxxp
        5-7 k: kkkkjkkk
        5-7 x: xxdxxsqcx
        6-7 j: jfjljjfp
        7-8 l: clsldvlc
        5-10 h: qhqmchbzhlfhc
        5-9 m: mpdnhsmmb
        2-4 k: jvmkjrkhkctwlrq
        2-3 s: ssgstssds
        8-9 t: tvttttttht
        5-6 n: nnnpnpn
        8-9 x: xxxxqxxxsp
        6-7 z: zzzzzzl
        4-5 f: fffpkffq
        1-12 b: bsfbclbxbkbbmbmb
        14-15 b: rcnwnhbdfbhtblvb
        7-9 j: jjjjjjjjx
        2-3 x: xxxx
        13-14 z: zqzzzzzdztzzzmzz
        2-6 r: rmlbjrrbrc
        2-3 m: mwmm
        9-10 d: ddddddjddz
        15-18 p: pppppppzppppppzppj
        3-6 g: glfgdgfgbgdkg
        1-3 s: sdsblxzscp
        5-6 v: vvvvsv
        1-3 d: vdxdkd
        6-8 w: wkzwcwvwwwqwd
        9-10 h: hhhhhhhhwh
        9-12 b: bdbbbbbwbbmbbbb
        2-8 b: bbbbbbbcb
        2-9 v: nvtgsfvpv
        11-13 v: hvvgvvvvvvbvphlhnv
        6-7 r: rrrrprr
        10-16 w: wlxptrzwmwxhspcww
        5-7 f: ffpfshf
        3-6 t: rnttvx
        8-16 b: pvlbtnfbvspdhtkk
        1-4 v: vlvd
        4-17 l: qflfllkllplllllkl
        1-3 s: psswjplkhvxssftnpl
        6-11 t: tthmbtwkfct
        11-17 w: wwwwjwdtwcnwwwxkx
        9-11 s: sssssssslsss
        8-10 n: nnnnnpnwnnnvw
        12-13 m: mmmmmmmmmmmnpmm
        14-17 w: xbswvmsflkmqlpkxwm
        1-3 w: mzww
        5-6 g: ggggdw
        1-15 r: rslcrjzhrjdpwqm
        7-12 g: ggdgfggdzlxfkg
        2-11 x: cpsxxkxxqhsxdxxjkgbt
        7-8 w: wdvhwwwp
        1-4 z: zmfzllxnrnlw
        9-10 b: rkbbbbksbpdsbcm
        1-8 h: sqdmcjpw
        2-6 x: pxxvrx
        5-6 x: xjshxxqt
        1-13 b: fbbbbbbbbbbbbbb
        11-13 t: bwhtttdvtbtkw
        2-6 j: rjrggj
        5-6 v: fvvvwvtv
        10-15 s: ssdsstswssssssc
        2-6 h: hnqzhlclp
        8-12 t: pjztttrjtvttt
        5-6 g: gwxrggtmg
        1-8 z: kzzzzzzvz
        10-15 p: pppppppppvpppppp
        3-4 g: ngxdgg
        2-5 x: xcxxnbwh
        3-10 s: sgkghshxdssws
        1-2 s: pssldmf
        2-5 m: jmxmm
        5-6 n: pnsjqnnn
        13-17 t: ttxslvttlnttrdwtt
        1-6 n: nnpnsn
        3-20 m: mmmmmwjmmmmmtmmvmmmm
        15-17 s: ssszsslsssszssssss
        5-8 s: hsgzspsk
        7-8 c: ccccccchc
        14-17 l: llllllllllllllllk
        7-14 p: xjbxdpkbgcpbfpptfx
        5-6 s: sghmss
        4-6 s: ssssss
        1-2 c: kcwpwc
        5-6 m: mmmqtmt
        1-9 l: glllllllslllll
        3-4 r: rrcr
        6-9 r: rpcbrrrrdvrrwf
        3-7 l: wglsfjtwlldg
        6-9 g: gggbgggxw
        9-10 j: jjjjjjjjrjjjjjjjjjj
        4-14 p: vbppfpncsmhctp
        10-13 k: kkkkkkkkkkkkkkkkk
        3-5 p: dnlpp
        11-15 f: fsffzftkfqflnflf
        9-11 q: bqdqcqqqqgffqfqmrqlq
        1-10 l: lszxlhdkgtprglxxl
        16-18 l: sllllllmlllllllllwl
        4-7 b: brblbbbtbj
        3-6 n: rhnntq
        7-9 k: kjnkjpbkkkkvkjm
        11-12 g: kvjpqmhcgbrl
        3-12 h: khhhvhhmchhgfh
        3-4 r: xmpr
        3-7 m: mmlmmmmhm
        7-16 m: mmmlmmlmmmmmmmmmmm
        3-4 b: sdbbbr
        14-19 k: hkkkkkjclkgmzvgkkkk
        12-14 w: ssqgwwcxcqwwww
        2-3 k: lkkr
        1-7 t: wtttttlt
        4-8 d: wdjnqgdf
        8-9 j: jjsjwjjlj
        4-7 h: hnhphxhhhq
        2-5 d: qdjgqdb
        3-5 w: wpwzwdm
        3-12 n: pnnngxnjqjhpcntfrvz
        10-15 h: hhhhhvhhhhhhhhg
        4-6 s: dwrsksjhtsrjdvmbsbwr
        8-11 v: vvvvvvvcvvvvvv
        4-5 m: lnmlmmwsmfsm
        7-16 c: kvzcrcbcvkcpptdccq
        2-3 b: bnbbpjp
        3-5 m: hpjkrmmlwq
        3-7 v: vvvnlhn
        3-4 b: bnbbb
        3-6 d: tkdktrctmjw
        3-5 f: pffffj
        6-10 t: ltrgjvjthtpttphrttk
        3-8 s: ssrkstfgssxxxc
        1-2 d: sdhkcfdcdg
        6-12 h: shhhhhzzzhfh
        4-7 j: jjkzgrj
        13-15 l: llltlwlllllqzlbldl
        5-9 d: dzxjdrftsprbldvddk
        4-14 q: wqsqqxtbfnckzqcqqqq
        1-2 v: lvdxdwpphqv
        5-6 z: zpzhzjzqtzh
        3-4 q: qqqlq
        9-10 v: svvvhvvvtv
        3-12 g: kjgmbzgklwfb
        10-15 v: vvddvvvrhvvmvwvvv
        1-20 j: kjjjjjjjjkjjpjjjjjjj
        6-8 t: tttttdtt
        11-12 v: vvvvvqvvqvxvvv
        12-13 h: hnhshhhhshhhh
        7-8 z: vzzzzzrzzzfpz
        7-8 x: xkxhxxhn
        4-7 b: hbbzptb
        5-9 d: fddqjsdbj
        3-10 l: llllllglxslll
        1-9 b: dbsbbbbgbb
        5-8 n: dtnnsnnnn
        7-16 m: mmmmmmmmmmmmmmmsm
        3-4 f: nhwk
        15-17 w: wwfwwxwmwwwwwdswwwww
        1-11 l: llllllllllll
        4-9 c: cccccccchcc
        2-3 k: kkkkbskk
        3-6 s: nssqtf
        4-5 m: mmrhm
        9-11 f: nfnsrfdfnfff
        15-16 k: kkkkkkkkkkkkkkzhk
        6-9 q: tzqqxqhnq
        3-11 k: kkkkkkkkkkck
        2-5 p: wmpgpmjmrqg
        15-19 r: rrrrrsrrrrrrhfrrjrr
        4-10 l: lllsldllll
        4-7 s: sjhzqns
        1-3 n: nnknnp
        13-14 j: hjjgxjzjvjpxjj
        4-5 r: rrrgrrrrr
        10-11 p: ppptphpxkpppp
        2-7 j: fjsnxwpjgqnzjjj
        6-8 k: kdkkwnvkkkk
        2-5 q: qdqqjqqwq
        5-7 x: xdxddbcxvnxxxxhxxxq
        2-6 n: cnqlmrlwqhdbbvbnhskh
        7-8 z: zzzzzzzwz
        6-8 r: llrrtzrpr
        1-7 d: ddlddvmkddjpd
        8-9 v: vvvvvvvrkv
        18-19 t: vtststttfmtqtmttdnz
        3-9 b: nbwbzntrb
        3-4 r: pzrrqqrj
        5-9 x: bvxxllwcf
        4-6 f: fxmlxf
        11-15 n: nnqnwnnnwnknnnnnfnn
        9-11 n: nnnnqnnnnnj
        7-12 k: kkkkkvjkkksskrkkk
        2-3 b: cbbvbv
        3-6 x: xxfldxxxc
        6-11 k: fkvvkkwkvkpjkjk
        10-16 f: ffffffmffffffffffff
        7-8 p: fppplpnc
        11-20 r: srrrfrrrrrrrrhrrbrrr
        13-17 s: smssssssssssssssb
        5-8 q: fcqlqqqq
        6-10 g: rmpsgrlxcvgtggwgvk
        13-15 h: hhhhhhhhhcmfhhldhzh
        5-10 q: qqqqjqqqqqcq
        5-9 m: lmvcmmsznmmgmmmcs
        5-6 h: hhhbzr
        3-4 d: dzdg
        11-14 h: rfvjnjbzvrhthdxhv
        14-19 g: ggggggggggggggggggcg
        6-7 m: mmmmmphg
        13-14 p: ftzfrppkzrrpgp
        12-16 n: lxnnnnnngnnbnncnn
        8-9 c: dqgzbncfccrjtdkc
        6-9 r: jdrrfrtkmkfltkm
        4-6 g: dnggrr
        3-4 s: ssssvs
        18-19 f: wffffffffsffffffffvf
        6-10 l: klllbxltll
        6-7 r: rbdgrrr
        17-18 l: vjplzpcftlkrllsbqlqg
        3-9 n: bqnnnnrbxkdsdwnvtwwh
        1-2 w: qwwt
        5-18 z: zzzzzzzzzzzzzzzzzlz
        2-7 n: nbnnnnnnn
        14-15 g: mcdcmxpxmgkqdhm
        18-19 s: gsssssssssswssssssss
        5-6 s: tptssvs
        8-12 c: cccnbcccmcctclccccx
        6-15 t: tttttttttmttstf
        5-6 l: lllklq
        7-9 d: dqdcdcddxcddmdkrd
        4-5 r: rrvrxqnzrm
        9-11 p: pjpppppppppppppp
        4-6 v: vpvvvvv
        6-9 h: wwchhhgfh
        10-11 f: flfcjvtljftfffhff
        6-7 v: vvvvvvvv
        12-15 k: kjkkkktkkkkkzvn
        6-9 v: rsrvvgnwktwvvnvclvvc
        2-12 c: ccvqsctcwkmkqzc
        16-18 w: wwwwwwwwwwwwwwwwwwww
        17-18 g: ggzgggggggglggggsgg
        13-18 v: vvvvvnvvvgrvvkvtqv
        5-11 k: kkkkkkkkkkkkkkk
        11-12 f: ffffffffffvf
        1-7 h: rstpvhh
        11-14 l: lrnllwvlnflllfdfllt
        5-7 g: gcgjgrkgj
        7-18 z: zzzzzzgzztzzzzzzzxzz
        17-18 v: vvvvvvvvvvvvmvvvvvvv
        16-18 m: mmmmhmmmmmtmmmmvmx
        1-3 z: vzzzwz
        5-6 n: nnnhnq
        8-15 r: jsrprrrrmrrkgrkrr
        2-12 g: txwxcgwfqkfg
        9-15 l: ldlllllllllllll
        3-5 f: gfbsf
        15-16 v: vvhrnzxfvvvvcwjv
        4-15 c: cccmccccccccccccccc
        7-13 l: bwlzlxzllctjcf
        1-3 q: rsgtq
        4-9 n: npznnnvvnzg
        3-7 z: sqtczzfzzrzfz
        2-3 k: ckkrjnkglnz
        9-10 q: qqqqqqwqjqqfq
        4-11 v: vvvbvvvvvvnvvd
        5-7 n: lbwxnnnncnnwnv
        8-9 k: kgkkkkkjf
        7-9 l: llllllllll
        15-19 p: pppbpcppxcptppvmpppb
        3-4 m: fqmwcncsmp
        """
        .split(separator: "\n")
        .map(String.init)
}
