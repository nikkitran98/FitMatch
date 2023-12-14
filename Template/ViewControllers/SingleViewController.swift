import SceneKit
import UIKit

class SingleViewController: UIViewController {
    
    // MARK: - Properties
    private let sceneView = SCNView()
    
    // MARK: - Life Cycle
    init(scene: SCNScene) {
        sceneView.scene = scene
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
        sceneView.backgroundColor = .white
        sceneView.cameraControlConfiguration.allowsTranslation = true
        
        view.addSubview(sceneView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        sceneView.frame = self.view.bounds
    }
    
}
