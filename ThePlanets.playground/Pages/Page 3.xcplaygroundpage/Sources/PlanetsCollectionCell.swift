import Foundation
import UIKit

public class PlanetsCollectionCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var planets = PlanetsInformation()
    
    var index : Int!
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    //Tu tinha esquecido de colocar a content view da scroll
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
    
    
    lazy var collection: UICollectionView = {
       let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        flow.minimumInteritemSpacing = 0
        flow.minimumLineSpacing = 0
        let collec = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collec.isPagingEnabled = true
        collec.translatesAutoresizingMaskIntoConstraints = false
        return collec
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        
        collection.delegate = self
        collection.dataSource = self
        
        collection.register(PlanetsImageCollectionCell.self, forCellWithReuseIdentifier: "planetsCell" )
        
        //A ordem que a gente chama as funções importa pois você está adicionando as subviews e quando você tenta ativar constraints em views que não tem ligação isso pode levar seu app a quebrar em tempo de execução
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
        
        //Lembrando que é de suma importância que essa constraint seja de baixa prioridade
        let heightAnchorContent = scrollContentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        heightAnchorContent.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            scrollView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            //Aqui configuramos as constraints da content view de acordo com o pai que é a scrollview
            heightAnchorContent,
            scrollContentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            scrollContentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            scrollContentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            scrollContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
        ])
        
    }
    
    
    func setupImageCollection() {
            //Todos os elementos devem ser adicionados ao content view da scroll
            scrollContentView.addSubview(collection)
            
            collection.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                self.collection.bottomAnchor.constraint(equalTo: scrollContentView.safeAreaLayoutGuide.topAnchor, constant: 150),
                self.collection.topAnchor.constraint(equalTo: scrollContentView.safeAreaLayoutGuide.topAnchor, constant: 5),
                self.collection.leadingAnchor.constraint(equalTo: scrollContentView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
                self.collection.trailingAnchor.constraint(equalTo: scrollContentView.safeAreaLayoutGuide.trailingAnchor, constant: -10)
            ])

        }

        
        func setupPlanetDescription() {
            
            //Todos os elementos devem ser adicionados ao content view da scroll
            scrollContentView.addSubview(descriptionPlanet)
            
            descriptionPlanet.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                self.descriptionPlanet.topAnchor.constraint(equalTo: collection.bottomAnchor, constant: 20),
                self.descriptionPlanet.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor, constant: 10),
                self.descriptionPlanet.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor, constant: -10),
                self.descriptionPlanet.bottomAnchor.constraint(equalTo: scrollContentView.bottomAnchor, constant: 20)
            ])
            
        }
    
    func setupPlanetCuriosities() {
        
        //Todos os elementos devem ser adicionados ao content view da scroll
        scrollContentView.addSubview(curiositiesPlanet)
        
        curiositiesPlanet.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.curiositiesPlanet.topAnchor.constraint(equalTo: descriptionPlanet.bottomAnchor, constant: 20),
            self.curiositiesPlanet.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor, constant: 10),
            self.curiositiesPlanet.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor, constant: -10),
            self.curiositiesPlanet.bottomAnchor.constraint(equalTo: scrollContentView.bottomAnchor, constant: 100)
        ])
        
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "planetsCell", for: indexPath) as! PlanetsImageCollectionCell
        
        cell.planetImage = UIImage(named: planets.planetsPages[index][indexPath.row])
        cell.backgroundColor = .black
            
        return cell
    }
        
        public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.size.width , height: collectionView.frame.size.height)
        }
}
