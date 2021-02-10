import Foundation

public class DIContainer {

    public static let shared = DIContainer()

    private init() {}

    private var dependencies: [DependencyKey: Weak] = [:]

    public static func register<T>(type: T.Type = T.self, name: String? = nil, dependency: T) {
        shared.register(type: type, name: name, dependency: dependency)
    }

    public static func resolve<T>(type: T.Type = T.self, name: String? = nil) -> T {
        shared.resolve(type: type, name: name)
    }

    private func register<T>(type: T.Type, name: String?, dependency: T) {
        let key = DependencyKey(type: type, name: name)
        let weak = Weak(value: dependency as AnyObject)
        dependencies[key] = weak
    }

    private func resolve<T>(type: T.Type, name: String?) -> T {

        let key = DependencyKey(type: type, name: name)
        guard let weak = dependencies[key],
              let dependency = weak.value as? T else {
            //Log issue
            fatalError("Error getting dependency, check if registered")
        }
        return dependency
    }
}

final fileprivate class DependencyKey: Hashable, Equatable {
    private let type: Any.Type
    private let name: String?

    init(type: Any.Type, name: String? = nil) {
        self.type = type
        self.name = name
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(type))
        hasher.combine(name)
    }

    public static func == (lhs: DependencyKey, rhs: DependencyKey) -> Bool {
        return lhs.type == rhs.type && lhs.name == rhs.name
    }
}
