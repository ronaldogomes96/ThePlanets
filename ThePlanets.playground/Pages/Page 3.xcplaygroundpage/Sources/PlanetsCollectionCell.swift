import Foundation
import UIKit

public class PlanetsCollectionCell: UICollectionViewCell {
    
    var planets = PlanetsInformation()
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    lazy var scrollContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    lazy var descriptionPlanet: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .natural
        label.numberOfLines = 0
        return label
    }()
    
    lazy var curiositiesPlanet: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var planetImageView: UIImageView = {
            let image = UIImageView()
            image.contentMode = .scaleAspectFit
            image.clipsToBounds = false
            return image
        }()
    
    public var planetDescription: String? {
        didSet{
            descriptionPlanet.text = planetDescription
        }
    }
    
    public var planetCuriosities: String? {
        didSet{
            curiositiesPlanet.text = planetCuriosities
        }
    }
    
    var planetImage: UIImage? {
        didSet {
            planetImageView.image = planetImage
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        setupScrollView()
        setupImageCollection()
        setupPlanetDescription()
        setupPlanetCuriosities() 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupScrollView() {
        
        self.addSubview(scrollView)
        scrollView.addSubview(scrollContentView)
        
        let heightAnchorContent = scrollContentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        heightAnchorContent.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            scrollView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            heightAnchorContent,
            scrollContentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            scrollContentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            scrollContentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            scrollContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
        ])
        
    }
    
    
    func setupImageCollection() {

        scrollContentView.addSubview(planetImageView)
        
        planetImageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                self.planetImageView.bottomAnchor.constraint(equalTo: scrollContentView.safeAreaLayoutGuide.topAnchor, constant: 150),
                self.planetImageView.topAnchor.constraint(equalTo: scrollContentView.safeAreaLayoutGuide.topAnchor, constant: 5),
                self.planetImageView.leadingAnchor.constraint(equalTo: scrollContentView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
                self.planetImageView.trailingAnchor.constraint(equalTo: scrollContentView.safeAreaLayoutGuide.trailingAnchor, constant: -10)
            ])
        }

        
        func setupPlanetDescription() {

            scrollContentView.addSubview(descriptionPlanet)
            
            descriptionPlanet.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                self.descriptionPlanet.topAnchor.constraint(equalTo: planetImageView.bottomAnchor, constant: 20),
                self.descriptionPlanet.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor, constant: 10),
                self.descriptionPlanet.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor, constant: -10),
                self.descriptionPlanet.bottomAnchor.constraint(equalTo: scrollContentView.bottomAnchor, constant: 20)
            ])
            
        }
    
    func setupPlanetCuriosities() {
        
        scrollContentView.addSubview(curiositiesPlanet)
        
        curiositiesPlanet.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.curiositiesPlanet.topAnchor.constraint(equalTo: descriptionPlanet.bottomAnchor, constant: 20),
            self.curiositiesPlanet.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor, constant: 10),
            self.curiositiesPlanet.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor, constant: -10),
            self.curiositiesPlanet.bottomAnchor.constraint(equalTo: scrollContentView.bottomAnchor, constant: 100)
        ])
        
    }
}
