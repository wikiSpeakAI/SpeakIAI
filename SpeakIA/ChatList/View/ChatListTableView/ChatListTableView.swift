//
//  ChatListTableView.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/11/25.
//

import UIKit
enum DragDirection {
    
    case Up
    case Down
}

protocol ChatListTableViewDelegate :AnyObject {
    var currentHeaderHeight: CGFloat { get }
    
    func innerTableViewDidScroll(withDistance scrollDistance: CGFloat)
    func innerTableViewScrollEnded(withScrollDirection scrollDirection: DragDirection)
}


class ChatListTableView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak private var tableView: UITableView!
    
    weak var delegate: ChatListTableViewDelegate?
    var lastContentOffset = CGPoint.zero
    private var drawDirection: DragDirection = .Up

    var dataSource: [UserChat] = [UserChat(id: "123" , name: "William Brando Estrada Tepec", avatar: "",lastMessage: "ya vienes apurate", lastMessageDate: "Viernes"),UserChat(id: "123" , name: "William Brando Estrada Tepec", avatar: "",lastMessage: "ya vienes apurate, necesito que traigas las verduras y los vegetales para cocinar", lastMessageDate: "Viernes"),UserChat(id: "123" , name: "William Brando Estrada Tepec", avatar: "",lastMessage: "ya vienes apurate", lastMessageDate: "Viernes"),UserChat(id: "123" , name: "William Brando Estrada Tepec", avatar: "",lastMessage: "ya vienes apurate", lastMessageDate: "Viernes"),UserChat(id: "123" , name: "William Brando Estrada Tepec", avatar: "",lastMessage: "ya vienes apurate", lastMessageDate: "Viernes"),UserChat(id: "123" , name: "William Brando Estrada Tepec", avatar: "",lastMessage: "ya vienes apurate", lastMessageDate: "Viernes"),UserChat(id: "123" , name: "William Brando Estrada Tepec", avatar: "",lastMessage: "ya vienes apurate", lastMessageDate: "Viernes"),UserChat(id: "123" , name: "William Brando Estrada Tepec", avatar: "",lastMessage: "ya vienes apurate", lastMessageDate: "Viernes"),UserChat(id: "123" , name: "William Brando Estrada Tepec", avatar: "",lastMessage: "ya vienes apurate", lastMessageDate: "Viernes"),UserChat(id: "123" , name: "William Brando Estrada Tepec", avatar: "",lastMessage: "ya vienes apurate", lastMessageDate: "Viernes"),UserChat(id: "123" , name: "William Brando Estrada Tepec", avatar: "",lastMessage: "ya vienes apurate", lastMessageDate: "Viernes"),UserChat(id: "123" , name: "William Brando Estrada Tepec", avatar: "",lastMessage: "ya vienes apurate", lastMessageDate: "Viernes"),UserChat(id: "123" , name: "William Brando Estrada Tepec", avatar: "",lastMessage: "ya vienes apurate", lastMessageDate: "Viernes"),UserChat(id: "123" , name: "William Brando Estrada Tepec", avatar: "",lastMessage: "ya vienes apurate", lastMessageDate: "Viernes"),UserChat(id: "123" , name: "William Brando Estrada Tepec", avatar: "",lastMessage: "ya vienes apurate", lastMessageDate: "Viernes"),UserChat(id: "123" , name: "William Brando Estrada Tepec", avatar: "",lastMessage: "ya vienes apurate", lastMessageDate: "Viernes")]
    
    
    private struct Constants {
        static let ChatListCell: String = ChatListTableViewCell.reuseIdentifier
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    deinit {
        print("Se elimino ContainerHomeCollectionView")
    }
    
    func setupView()  {
        Bundle(for: Self.self).loadNibNamed("ChatListTableView", owner: self, options: nil)
        
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.backgroundColor = .red
        contentView.backgroundColor = .red
        let UInib =  UINib(nibName: Constants.ChatListCell, bundle: BundleClass().bundle)
        tableView.register(UInib, forCellReuseIdentifier: Constants.ChatListCell)
        tableView.dequeueReusableCell(withIdentifier: Constants.ChatListCell)
        
    }
    
  
}

extension ChatListTableView:  UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ChatListCell) as? ChatListTableViewCell else { return UITableViewCell() }
        
        cell.setData(data: dataSource[indexPath.row])
        
        return cell
    }
    
    

    
}

extension ChatListTableView : UITableViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        var delta = scrollView.contentOffset.y - lastContentOffset.y
        print("scroll value: \(scrollView.contentOffset.y)")
        print("delta: \(delta)")
        
        if let heightHeader = delegate?.currentHeaderHeight {
            //up scroll
            if delta > 0, heightHeader > topViewHeightConstraintRange.lowerBound {
                
                drawDirection = .Up
                delegate?.innerTableViewDidScroll(withDistance: delta)
                scrollView.contentOffset.y -= delta
            }
        }
        
        if delta < 0,
            // topViewUnwrappedHeight < topViewHeightConstraintRange.upperBound,
            scrollView.contentOffset.y < 0 {
            
            drawDirection = .Down
            delegate?.innerTableViewDidScroll(withDistance: delta)
            scrollView.contentOffset.y -= delta
        }
        
        lastContentOffset = scrollView.contentOffset
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y <= 0 {
            delegate?.innerTableViewScrollEnded(withScrollDirection: drawDirection)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate == false && scrollView.contentOffset.y <= 0 {
            
            delegate?.innerTableViewScrollEnded(withScrollDirection: drawDirection)
        }
    }
    
}
