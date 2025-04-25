//
//  MessagerContentCollectionView.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/13/25.
//

import UIKit


class MessagerContentCollectionView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var contentView: UIView!
    
    var dataSource: [UserChat]?  = [UserChat(id: "1", name: "Este es un mensjae de prueba"),
                                    UserChat(id: "2", name: "Este es un mensjae de prueba"),
                                    UserChat(id: "3", name: "Este es un mensjae de prueba"),
                                    UserChat(id: "4", name: "Este es un mensjae de prueba")]
    
    struct Constants {
        static let cellIdentify: String = "ChatCollectionViewCell"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    deinit {
        print("Se elimino MessagerContentTableView")
    }
    
    func setupUI() {
        Bundle(for: Self.self).loadNibNamed("MessagerContentCollectionView", owner: self, options: nil)
        addSubview(contentView)
        
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.backgroundColor = .red
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .blue
        collectionView.register(UINib(nibName: Constants.cellIdentify, bundle: BundleClass().bundle), forCellWithReuseIdentifier: Constants.cellIdentify)

    }
}

extension MessagerContentCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentify, for: indexPath) as? ChatCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setData(data: nil)
        return cell
    }
}
