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
    var footerBottomConstraint: NSLayoutConstraint?
    var heigthKeyboard: CGFloat?

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
    
    
    @objc func keyboardWillShow(notification: Notification) {
        if let userInfo = notification.userInfo,
           let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            let keyboardHeight = keyboardFrame.height
            print("Keyboard height: \(keyboardHeight)")
            heigthKeyboard = keyboardHeight
            toMoveFooter(heigth: -keyboardHeight)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeObserves()
    }
    
    func setupUI() {
        contentCollection.addSubViewToBottom(viewChild: footerSendMessage)
        contentCollection.addSubviewOverTo(parnerView: footerSendMessage, childView: contentTableView)
        
        footerBottomConstraint = footerSendMessage.bottomAnchor.constraint(equalTo: contentCollection.bottomAnchor)
        footerBottomConstraint?.isActive = true
    }
    
    func addObservers() {
        NotificationCenter.default.addObserver(self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    func removeObserves(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        // footer return to init position
        print("Se escondera el teclado: ", heigthKeyboard as Any )
        toMoveFooter(heigth:  0.0)
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
    
    lazy var footerSendMessage = {
        var footer = MesageFooterView()
        footer.delegate = self
        footer.translatesAutoresizingMaskIntoConstraints = false
        return footer
    }()
    
    
    // cuando gira la pantalla volvemos a recargar el tableview
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        coordinator.animate(alongsideTransition: nil) { _ in
            self.contentTableView.tableView.reloadData()
        }
    }
    
    // MARK: Funtions Logic
    
    func toMoveFooter(heigth : CGFloat) {
        footerBottomConstraint?.constant = heigth
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
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

extension ChatViewController : MesageFooterViewDelegate {

    
    func sendMessage(msg: String?) {
        //login send message
        
    }
}

extension ChatViewController: ChatViewProtocol {
    func loadData(userData: [UserChat]) {
        dataSource = userData
    }
    
    
}
