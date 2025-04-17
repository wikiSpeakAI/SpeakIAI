//
//  ChatInteractor.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/12/25.
//
protocol ChatInteractorProtocol: AnyObject {
    
}

class ChatInteractor: InteractorProtocol {
    weak var presenter: ChatPresenterProtocol?
    
}
extension ChatInteractor: ChatInteractorProtocol {}
