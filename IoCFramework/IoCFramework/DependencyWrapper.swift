import Foundation

@propertyWrapper
public class Dependency<T> {
    public var wrappedValue: T

    public init() {
        self.wrappedValue = DIContainer.resolve()
    }
}
