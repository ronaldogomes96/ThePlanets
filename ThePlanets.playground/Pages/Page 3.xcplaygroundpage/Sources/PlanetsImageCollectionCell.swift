import Foundation
import UIKit

public class PlanetsImageCollectionCell: UICollectionViewCell {
    lazy var planetImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = false
//        image.backgroundColor = .black
        return image
    }()
    
    var planetImage: UIImage? {
        didSet {
            planetImageView.image = planetImage
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPlanetImageView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPlanetImageView() {
        
            self.addSubview(planetImageView)
            
            planetImageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                self.planetImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
                self.planetImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
                self.planetImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                self.planetImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
            ])
            
            
    //        planetImageView.layer.masksToBounds = true
    //        planetImageView.layer.cornerRadius = self.planetImageView.bounds.width / 2
        }
    
    
}
