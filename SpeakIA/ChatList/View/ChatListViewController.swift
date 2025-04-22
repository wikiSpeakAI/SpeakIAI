//
//  ChatListViewController.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/10/25.
//
import UIKit
protocol ChatListViewProtocol: AnyObject {
    
}

var topViewInitialHeight : CGFloat = 200

let topViewFinalHeight : CGFloat = 50 //navigation hieght

let topViewHeightConstraintRange = topViewFinalHeight..<topViewInitialHeight


class ChatListViewController: BaseController,ViewProtocol {
    var presenter: ChatListPresenterProtocol?
    

    
    @IBOutlet weak var headerContent: UIView!
    @IBOutlet weak var searchContent: UIView!
    @IBOutlet weak var chatListContent: UIView!
    @IBOutlet weak var constraintHeaderHeight: NSLayoutConstraint!
    
    var dragInitialY: CGFloat = 0
    var dragPreviousY: CGFloat = 0
    var dragDirection: DragDirection = .Up
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addPanGestureToTopViewAndCollectionView()
    }
    init(){
        super.init(nibName: "ChatListViewController", bundle: BundleClass().bundle)
    }
    deinit {
        print("Deleted ChatListViewController")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var containerTableView = { [weak self] in
        var chatListTableView = ChatListTableView()
        chatListTableView.delegate = self
        chatListTableView.translatesAutoresizingMaskIntoConstraints = false
        return chatListTableView
    }()
    
    func setupView()  {
        chatListContent.addSubView(viewChild: containerTableView)

    }
    
    func addPanGestureToTopViewAndCollectionView() {
        
        let topViewPanGesture = UIPanGestureRecognizer(target: self, action: #selector(topViewMoved))
        
        headerContent.isUserInteractionEnabled = true
        headerContent.addGestureRecognizer(topViewPanGesture)
        
    }
    
    @objc func topViewMoved(_ gesture: UIPanGestureRecognizer) {
        
        var dragYDiff : CGFloat
        
        switch gesture.state {
            
        case .began:
            
            dragInitialY = gesture.location(in: self.view).y
            dragPreviousY = dragInitialY
            
        case .changed:
            
            let dragCurrentY = gesture.location(in: self.view).y
            dragYDiff = dragPreviousY - dragCurrentY
            dragPreviousY = dragCurrentY
            dragDirection = dragYDiff < 0 ? .Down : .Up
            innerTableViewDidScroll(withDistance: dragYDiff)
            
        case .ended:
            
            innerTableViewScrollEnded(withScrollDirection: dragDirection)
            
        default: return
        
        }
    }
    
}

extension ChatListViewController: ChatListViewProtocol {}


extension ChatListViewController: ChatListTableViewDelegate {
    func chatDidSelected(dta: [UserChat]) {
        presenter?.selectedChat(userChat: dta)
    }
    
    var currentHeaderHeight: CGFloat {
        return constraintHeaderHeight.constant
    }
    
    func innerTableViewDidScroll(withDistance scrollDistance: CGFloat) {
        constraintHeaderHeight.constant -= scrollDistance
        
        if constraintHeaderHeight.constant < topViewFinalHeight {
            
            constraintHeaderHeight.constant = topViewFinalHeight
        }
    }
    
    func innerTableViewScrollEnded(withScrollDirection scrollDirection: DragDirection) {
        
        let topHeigth = constraintHeaderHeight.constant
        
        if topHeigth < topViewFinalHeight + 20 {
            heigthEndScroll()
        } else if  topHeigth <= topViewInitialHeight - 20 {
            switch scrollDirection {
            case .Down: scrollToInitialView()
            case .Up: heigthEndScroll()
                
            }
        } else {
            scrollToInitialView()
        }
        
    }
    
    func scrollToInitialView() {
        
        let topViewCurrentHeight = headerContent.frame.height
        
        let distanceToBeMoved = abs(topViewCurrentHeight - topViewInitialHeight)
        
        var time = distanceToBeMoved / 500
        
        if time < 0.25 {
            
            time = 0.25
        }
        
        constraintHeaderHeight.constant = topViewInitialHeight
        
        UIView.animate(withDuration: TimeInterval(time), animations: {
            
            self.view.layoutIfNeeded()
        })
    }
    
    func heigthEndScroll() {
        let topViewCurrentHeight = headerContent.frame.height
        
        let distanceToBeMoved = abs(topViewCurrentHeight - topViewFinalHeight)
        
        var time = distanceToBeMoved / 500
        
        if time < 0.25 {
            
            time = 0.25
        }
        
        constraintHeaderHeight.constant = topViewFinalHeight
        
        UIView.animate(withDuration: TimeInterval(time), animations: {
            
            self.view.layoutIfNeeded()
        })
    }
    
    
}
