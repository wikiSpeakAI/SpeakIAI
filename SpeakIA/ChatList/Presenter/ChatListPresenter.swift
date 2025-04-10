//
//  ChatListPresenter.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/10/25.
//
import UIKit
protocol ChatListPresenterProtocol: AnyObject {
    
}

class ChatListPresenter: PresenterProtocol {
    
    weak var view: ChatListViewProtocol?
    var router: ChatListRouterProtocol?
    var interactor: ChatListInteractorProtocol?
    
    deinit {
        print("Deleted ChatListPresenter")
    }
    
}

extension ChatListPresenter: ChatListPresenterProtocol {}
