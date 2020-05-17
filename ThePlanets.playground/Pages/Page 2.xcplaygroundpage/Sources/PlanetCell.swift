import Foundation
import UIKit

public class PlanetCell: UICollectionViewCell {
    lazy var planetImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = false
        image.backgroundColor = .white
        return image
    }()
    
    lazy var descriptionPlanet: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    var planetImage: UIImage? {
        didSet {
            planetImageView.image = planetImage
        }
    }
    
    public var planetName: String? {
        didSet{
            descriptionPlanet.text = planetName
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupPlanetImageView()
        setupPlanetDescription()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPlanetImageView() {
        
            self.addSubview(planetImageView)
            
            planetImageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                self.planetImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -200),
                self.planetImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
                self.planetImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                self.planetImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
            ])
            
        }
    
    func setupPlanetDescription() {
        
        self.addSubview(descriptionPlanet)
        
        descriptionPlanet.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.descriptionPlanet.topAnchor.constraint(equalTo: planetImageView.bottomAnchor, constant: 0),
            self.descriptionPlanet.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.descriptionPlanet.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
        
    }
}
