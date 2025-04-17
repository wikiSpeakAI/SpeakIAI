//
//  ChatListPresenter.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/10/25.
//
import UIKit
protocol ChatListPresenterProtocol: AnyObject {
    func selectedChat(userChat: [UserChat]?)
}

class ChatListPresenter: PresenterProtocol {
    
    weak var view: ChatListViewProtocol?
    var router: ChatListRouterProtocol?
    var interactor: ChatListInteractorProtocol?
    
    deinit {
        print("Deleted ChatListPresenter")
    }
    
}

extension ChatListPresenter: ChatListPresenterProtocol {
    
    func selectedChat(userChat: [UserChat]?) {
        router?.gotoChatFlow(userChat)
    }
}
