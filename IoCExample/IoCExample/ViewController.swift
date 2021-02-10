import UIKit
import IoCFramework

final class ViewController: UIViewController {

    @Dependency private var userManager: PetManager

    ///Without IoC we would have something like this but we have reverted the control
    //let user = User(firstName: "Brandon", lastName: "Aubrey", id: 123)
    lazy var firstNameLabel = UILabel()
    lazy var lastNameLabel = UILabel()
    lazy var idLabel = UILabel()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstNameLabel, lastNameLabel, idLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    ///Alternatively you can inject your dependency through the initializer, which is the more traditional way

//    init(dependency: DIContainerProtocol) {
//        self.dependency = dependency
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        firstNameLabel.text = userManager.mockAnimal.firstName
        lastNameLabel.text = userManager.mockAnimal.lastName
        idLabel.text = userManager.mockAnimal.idString

        view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}
