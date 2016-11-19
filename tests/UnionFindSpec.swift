import Nimble
import Quick

let SutKey = "sutKey"

class UnionFindSpec: QuickSpec {
    
    override func spec() {
        sharedExamples("Union Find") { (sharedExampleContext: @escaping SharedExampleContext) in
            var sut: UnionFind!
            
            beforeEach {
                let context = sharedExampleContext() as! [String: AnyObject]
                sut = context[SutKey]! as! UnionFind
            }
            
            it("tells that two components not connected") {
                expect(sut.connected(p: 0, q: 1)).to(beFalse())
            }
            
            it("connects two components") {
                sut.union(p: 0, q: 1)
                
                expect(sut.connected(p: 0, q: 1)).to(beTrue())
            }
            
            it("conects two groups") {
                sut.union(p: 0, q: 1)
                sut.union(p: 2, q: 3)
                sut.union(p: 0, q: 3)
                
                expect(sut.connected(p: 1, q: 2)).to(beTrue())
            }
        }
        
        describe("Quick Find") {
            let sut = QuickFindUF(capacity: 10)
            
            itBehavesLike("Union Find") { [SutKey: sut] }
        }
        
        describe("Quick Union") {
            let sut = QuickUnionUF(capacity: 10)
            
            itBehavesLike("Union Find") { [SutKey: sut] }
        }
    }
}
