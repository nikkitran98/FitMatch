import SceneKit
import UIKit

class ARModelCell: UICollectionViewCell {
    
    // MARK: - Properties
    var scene: SCNScene? {
        didSet { configureThumbnail() }
    }
    private var imageView = UIImageView()
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemGroupedBackground
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10.0
        
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        imageView.frame = self.bounds
    }
    
    private func configureThumbnail() {
        let renderer = SCNRenderer(device: MTLCreateSystemDefaultDevice())
        renderer.autoenablesDefaultLighting = true
        renderer.scene = scene
        
        let image = renderer.snapshot(atTime: 0.0, with: CGSize(width: self.frame.width, height: self.frame.width), antialiasingMode: .multisampling4X)
        imageView.image = image
    }

}
