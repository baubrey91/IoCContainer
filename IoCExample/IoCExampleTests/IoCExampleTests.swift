import XCTest
import IoCFramework

@testable import IoCExample

class IoCExampleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMainUserViewController() throws {

        let manager = PetManager(mockAnimal: Dog(firstName: "Fluffy", lastName: "Tailz", id: 123))
        DIContainer.register(dependency: manager)

        let vc = ViewController()
        vc.viewDidLoad()

        let userManager: PetManager = DIContainer.resolve()

        XCTAssertEqual(vc.firstNameLabel.text, userManager.mockAnimal.firstName)
        XCTAssertEqual(vc.lastNameLabel.text, userManager.mockAnimal.lastName)
        XCTAssertEqual(vc.idLabel.text, userManager.mockAnimal.idString)
    }

    func testSecondUserViewController() throws {
        
        let manager = PetManager(mockAnimal: Cat(firstName: "Garfield", lastName: "Meows", id: nil))
        DIContainer.register(dependency: manager)

        let vc = ViewController()
        vc.viewDidLoad()

        let userManager: PetManager = DIContainer.resolve()

        XCTAssertEqual(vc.firstNameLabel.text, userManager.mockAnimal.firstName)
        XCTAssertEqual(vc.lastNameLabel.text, userManager.mockAnimal.lastName)
        XCTAssertEqual(vc.idLabel.text, "Invalid")
    }

}
