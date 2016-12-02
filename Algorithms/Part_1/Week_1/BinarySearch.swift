import Foundation

extension Array where Element: Comparable {
    func binarySearch(_ element: Element) -> Int {
        var lo = 0
        var hi = count - 1
        while (lo <= hi) {
            let mid = lo + (hi - lo) / 2
            if (element < self[mid]) {
                hi = mid - 1
            } else if (element > self[mid]) {
                lo = mid + 1
            } else {
                return mid
            }
        }
        return -1;
    }
}
