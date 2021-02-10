import Foundation

final class Weak: Equatable {
    weak var value: AnyObject?

    init(value: AnyObject) {
        self.value = value
    }

    static public func == (lhs: Weak, rhs: Weak) -> Bool {
        return lhs.value === rhs.value
    }
}
