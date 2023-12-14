import SceneKit
import UIKit

private let ARModelCellInset: CGFloat = 8.0
private let ARModelCellReuseIdentifier = "AR-Model-Cell-Identifier"

class GridViewController: UICollectionViewController {
    
    // MARK: - Properties
    private var models = [SCNScene]()
    private var user: User? {
        didSet { configureUI() }
    }
    
    // MARK: - Life Cycle
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authenticateUser()
    
        collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.register(ARModelCell.self, forCellWithReuseIdentifier: ARModelCellReuseIdentifier)
        collectionView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = self.view.bounds
    }
    
    // MARK: - Helpers
    private func authenticateUser() {
        let controller = LoginViewController()
        controller.delegate = self
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.present(nav, animated: true, completion: nil)
        }
    }
    
    private func configureUI() {
        guard let user = user else { return }
        models = user.models
        collectionView.reloadData()
    }
    
}

// MARK: - UICollectionViewDelegate/UICollectionViewDataSource
extension GridViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ARModelCellReuseIdentifier, for: indexPath) as! ARModelCell
        cell.scene = models[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(SingleViewController(scene: models[indexPath.row]), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: ARModelCellInset, left: ARModelCellInset, bottom: ARModelCellInset, right: ARModelCellInset)
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension GridViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 36) / 3
        return CGSize(width: width, height: width)
    }
}

// MARK: - LoginViewControllerDelegate
extension GridViewController: LoginViewControllerDelegate {
    func didAuthenticateUser(_ loginViewController: LoginViewController, user: User) {
        self.user = user
    }
}

