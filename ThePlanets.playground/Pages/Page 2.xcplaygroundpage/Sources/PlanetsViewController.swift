import Foundation
import UIKit

public class PlanetsViewController : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var planets = PlanetsInformation()
    
    lazy var collection: UICollectionView = {
           let flow = UICollectionViewFlowLayout()
            flow.scrollDirection = .horizontal
            flow.minimumInteritemSpacing = 0
            flow.minimumLineSpacing = 0
            let collec = UICollectionView(frame: .zero, collectionViewLayout: flow)
            collec.isPagingEnabled = true
            collec.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(collec)
            
            return collec
        }()
        
        
        
    public override func viewDidLoad() {
            super.viewDidLoad()
            collection.delegate = self
            collection.dataSource = self
            
            collection.register(PlanetCell.self, forCellWithReuseIdentifier: "customCell" )
            
            setupConstraints()
        }
        
        
        private func setupConstraints() {
            NSLayoutConstraint.activate([
                collection.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                collection.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                collection.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
                collection.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            ])
        }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planets.planetsImageMessage.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! PlanetCell
        
        cell.planetImage = UIImage(named: planets.planetsImageMessage[indexPath.row])
        cell.planetName = planets.planetsName[indexPath.row]
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }

}

