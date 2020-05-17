import Foundation
import UIKit


public class PlanetsCollectionViewController: UIViewController {
    
    var planets = PlanetsInformation()
    
    public var travelTour: [String] = [] {
        didSet{
            for (_, element) in travelTour.enumerated(){
                if !(planets.planetsName.filter { $0 == element }).isEmpty {
                    for (index, name) in planets.planetsName.enumerated(){
                        if(element == name) {
                            choisePlanets.append(index)
                        }
                    }
                }
            }
        }
    }
    
    var choisePlanets: [Int] = []
    
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
            
            collection.register(PlanetsCollectionCell.self, forCellWithReuseIdentifier: "customCell" )
            
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

}

extension PlanetsCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return choisePlanets.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! PlanetsCollectionCell
        cell.planetDescription = planets.planetsPages[choisePlanets[indexPath.row]][5]
        cell.planetCuriosities = "Day: \(planets.planetsPages[choisePlanets[indexPath.row]][6])\nYear: \(planets.planetsPages[choisePlanets[indexPath.row]][7])\nMoons: \(planets.planetsPages[choisePlanets[indexPath.row]][8])"
        cell.planetImage = UIImage(named: planets.planetsPages[choisePlanets[indexPath.row]][0])
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}

