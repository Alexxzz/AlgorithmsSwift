import Foundation

protocol UnionFind {
    init(capacity: Int)
    
    mutating func union(p: Int, q: Int)
    mutating func connected(p: Int, q: Int) -> Bool
}

struct QuickFindUF: UnionFind {
    private var id: [Int]
    
    init(capacity: Int) {
        id = Array(0..<capacity)
    }
    
    mutating func union(p: Int, q: Int) {
        let pid = id[p]
        let qid = id[q]
        id = id.map {
            if $0 == pid { return qid }
            return $0
        }
    }
    
    func connected(p: Int, q: Int) -> Bool {
        return id[p] == id[q]
    }
}

struct QuickUnionUF: UnionFind {
    private var id: [Int]
    
    init(capacity: Int) {
        id = Array(0..<capacity)
    }
    
    mutating func union(p: Int, q: Int) {
        let i = root(of: p)
        let j = root(of: q)
        
        if i == j { return }
        
        id[i] = id[j]
    }
    
    func connected(p: Int, q: Int) -> Bool {
        return root(of: p) == root(of: q)
    }
    
    private func root(of i: Int) -> Int {
        var res = i
        while res != id[res] { res = id[res] }
        return res
    }
}

struct QuickUnionWeightedUF: UnionFind {
    private var id: [Int]
    private var sz: [Int]
    
    init(capacity: Int) {
        id = Array(0..<capacity)
        sz = Array(repeating: 1, count: capacity)
    }
    
    mutating func connected(p: Int, q: Int) -> Bool {
        return root(of: p) == root(of: q)
    }
    
    mutating func union(p: Int, q: Int) {
        let i = root(of: p)
        let j = root(of: q)
        if i == j { return }
        
        if sz[i] < sz[j] {
            id[i] = j
            sz[j] += sz[i]
        } else {
            id[j] = i
            sz[i] += sz[j]
        }
    }
    
    private mutating func root(of i: Int) -> Int {
        var res = i
        while res != id[res] {
            id[res] = id[id[res]]
            res = id[res]
        }
        return res
    }
}
