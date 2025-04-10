//
//  ChatListInteractor.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/10/25.
//
protocol ChatListInteractorProtocol {
    
}

class ChatListInteractor: InteractorProtocol {
    weak var presenter: ChatListPresenterProtocol?
    
    deinit {
        print("Deleted ChatListInteractor")
    }
}
extension ChatListInteractor: ChatListInteractorProtocol {
    
}
