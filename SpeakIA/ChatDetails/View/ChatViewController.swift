//
//  ChatViewController.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/12/25.
//
import UIKit

protocol ChatViewProtocol: AnyObject {
    func loadData(userData: [UserChat])
}

class ChatViewController: BaseController, ViewProtocol {

    @IBOutlet private weak var contentCollection: UIView!
    var presenter: ChatPresenterProtocol?
    var dataSource: [UserChat]?
    var numItemsbyRow: CGFloat = 1
    
    private struct Constants {
        static var cellIdentifier: String { ChatCollectionViewCell.reuseIdentifier }
    }
    
    init(){
        super.init(nibName: "ChatViewController", bundle: BundleClass().bundle)
    }
    deinit {
        print("Deleted ChatViewController")
    }
    
     required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupUI()
    }
    
    func setupUI() {

        contentCollection.addSubView(viewChild: contentTableView)
    }

    
    lazy var contentCollectioView = {
        var collection = MessagerContentCollectionView()
        collection.translatesAutoresizingMaskIntoConstraints = false

        return collection
    }()
    
    lazy var contentTableView = {
        var contentTableView = MessagerContentTableView()
        contentTableView.translatesAutoresizingMaskIntoConstraints = false

        return contentTableView
    }()
    
    // cuando gira la pantalla volvemos a recargar el tableview
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        coordinator.animate(alongsideTransition: nil) { _ in
            self.contentTableView.tableView.reloadData()
        }
    }
    

}
extension ChatViewController: UICollectionViewDelegate {}

extension ChatViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier, for: indexPath) as? ChatCollectionViewCell  else {return UICollectionViewCell()}
        
        cell.setData(data: dataSource?[indexPath.row])
        
        return cell
    }
    

}

extension ChatViewController : UICollectionViewDelegateFlowLayout {
    /* func collectionView(_ collectionView: UICollectionView,
     layout collectionViewLayout: UICollectionViewLayout,
     sizeForItemAt indexPath: IndexPath) -> CGSize {
     
     var size = CGSizeZero
     let width = collectionView.bounds.width
     if let dummyCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier, for: indexPath) as? ChatCollectionViewCell  {
     
     dummyCell.setData(data: nil)
     dummyCell.setNeedsLayout()
     dummyCell.layoutIfNeeded()
     size = dummyCell.contentView.systemLayoutSizeFitting(
     CGSize(width: width, height: UIView.layoutFittingCompressedSize.height)
     )
     
     }
     
     
     
     
     
     return size
     }*/
    
    


}

extension ChatViewController: ChatViewProtocol {
    func loadData(userData: [UserChat]) {
        dataSource = userData
    }
    
    
}
