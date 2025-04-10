//
//  ChatListViewController.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/10/25.
//
import UIKit
protocol ChatListViewProtocol: AnyObject {
    
}


class ChatListViewController: BaseController,ViewProtocol {
    var presenter: ChatListPresenterProtocol?
    
    @IBOutlet weak var headerContent: UIView!
    @IBOutlet weak var searchContent: UIView!
    @IBOutlet weak var chatListContent: UIView!
    
    init(){
        super.init(nibName: "ChatListViewController", bundle: BundleClass().bundle)
    }
    deinit {
        print("Deleted ChatListViewController")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ChatListViewController: ChatListViewProtocol {}

