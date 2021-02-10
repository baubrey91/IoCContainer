import Foundation

private enum Constants {
    static let invalidId = NSLocalizedString("Invalid", comment: "Invalid")
}

final class PetManager {
    var mockAnimal: Pet

    init(mockAnimal: Pet) {
        self.mockAnimal = mockAnimal
    }
}

//This should be in its own file
struct User {

}

protocol Pet {
    var firstName: String { get }
    var lastName: String { get }
    var id: Int? { get }
    var idString: String { get }
    func noise()
}


struct Dog: Pet {
    var firstName: String
    var lastName: String
    var id: Int?

    var idString: String {
        guard let id = id else { return Constants.invalidId }
        return String(id)
    }

    func noise() {
        print("Woof")
    }
}

struct Cat: Pet {
    var firstName: String
    var lastName: String
    var id: Int?

    var idString: String {
        guard let id = id else { return Constants.invalidId }
        return String(id)
    }

    func noise() {
        print("Meow")
    }
}
