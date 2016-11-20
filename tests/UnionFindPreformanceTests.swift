import XCTest

let capacity = 1_000

private func testUnionFind(_ sut: UnionFind) {
    var sut = sut
    for i in 0..<capacity-1 {
        sut.union(p: i, q: i+1)
    }
    
    for i in 0..<capacity-1 {
        let _ = sut.connected(p: i, q: i+1)
    }
}

class UnionFindPreformanceTests: XCTestCase {
    func test_QuickFindUF_N_Sequentional_Union_And_Connected() {
        measure {
            let sut: UnionFind = QuickFindUF(capacity: capacity)
            testUnionFind(sut)
        }
    }
    
    func test_QuickUnionUF_10N_Sequentional_Union_And_Connected() {
        measure {
            let sut: UnionFind = QuickUnionUF(capacity: capacity)
            testUnionFind(sut)
        }
    }
    
    func test_QuickUnionWeightedUF_10N_Sequentional_Union_And_Connected() {
        measure {
            let sut: UnionFind = QuickUnionWeightedUF(capacity: capacity)
            testUnionFind(sut)
        }
    }
}
