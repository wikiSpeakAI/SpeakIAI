//
//  ContainerHomeCollectionView.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/8/25.
//

import UIKit

protocol ContainerHomeCollectionViewProtocol: AnyObject {
    func didSelectFlow(flow: LearningMethod)
}


class ContainerHomeCollectionView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var CollectionView: UICollectionView!
    weak var delegate: ContainerHomeCollectionViewProtocol?
    let itemsPerRow: CGFloat = 2
    
    var dataSource: [LearningMethod]? {
        didSet {
            reloadData(dataSource)
        }
    }
    private struct Constants {
        static let welcomHomeCell: String = WelcomMenuCollectionViewCell.reuseIdentifier
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    deinit {
        print("Se elimino ContainerHomeCollectionView")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        CollectionView.collectionViewLayout.invalidateLayout()
    }
    
    private func commonInit() {
        Bundle(for: Self.self).loadNibNamed("ContainerHomeCollectionView", owner: self, options: nil)
       
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        CollectionView.dataSource = self
        CollectionView.delegate = self
        CollectionView.backgroundColor = .backgroudColor
        
        CollectionView.register(UINib(nibName: Constants.welcomHomeCell, bundle: BundleClass().bundle), forCellWithReuseIdentifier: Constants.welcomHomeCell)
        
        dataSource = [LearningMethod(name: "skeleton", img: nil, title: "", description: "", typeMethod: .none),
                      LearningMethod(name: "skeleton", img: nil, title: "", description: "", typeMethod: .none),
                      LearningMethod(name: "skeleton", img: nil, title: "", description: "", typeMethod: .none),
                      LearningMethod(name: "skeleton", img: "", title: "", description: "", typeMethod: .none)]

    }
    
    func reloadData(_ data: [LearningMethod]?)  {
        CollectionView.reloadData()
    }

    
}

extension ContainerHomeCollectionView : UICollectionViewDataSource, UICollectionViewDelegate {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return dataSource?.count ?? 0
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: Constants.welcomHomeCell, for: indexPath) as? WelcomMenuCollectionViewCell else { return UICollectionViewCell() }
         
       
         //cell.coverImgCell.image = UIImage(named: "app_Icon")
         guard let dataLearningMethod = dataSource?[indexPath.row] else { return cell}
         cell.setData(data: dataLearningMethod)
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("se dio clic a", dataSource?[indexPath.row].title)
        guard let data = dataSource?[indexPath.row] else {return}
        delegate?.didSelectFlow(flow: data)
    }
    
    
    

}
extension ContainerHomeCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat = 10 // espacio entre celdas
        let totalPadding = padding * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - totalPadding
        var widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem - 33, height: widthPerItem) // rectangulo
    }
    

    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 40, left: 30, bottom: 10, right: 30)
    }
}
