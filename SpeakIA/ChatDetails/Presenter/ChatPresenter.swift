//
//  ChatPresenter.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/12/25.
//
protocol ChatPresenterProtocol: AnyObject {
    func fetchData()
}

class ChatPresenter: PresenterProtocol {
    weak var view: ChatViewProtocol?
    var router: ChatRouterProtocol?
    var interactor: ChatInteractorProtocol?
    
    var dummyUser: [MessagesModel] = [
        MessagesModel(id: "0", msg: "Este es un ejemplo de mensaje", translate: nil, isTralated: false, date: "3 febrero", isSeen: false, typeMsg: .generic),
        MessagesModel(id: "0", msg: "Este es un ejemplo de mensaje", translate: nil, isTralated: false, date: "3 febrero", isSeen: false, typeMsg: .generic),
        MessagesModel(id: "0", msg: "Este es un ejemplo de mensaje este es mas largo que todos los otros mensajes", translate: nil, isTralated: false, date: "3 febrero", isSeen: false, typeMsg: .generic),
        MessagesModel(id: "0", msg: "Este es un ejemplo de mensaje", translate: nil, isTralated: false, date: "3 febrero", isSeen: false, typeMsg: .generic),
        MessagesModel(id: "0", msg: "Este es un ejemplo de mensaje", translate: nil, isTralated: false, date: "3 febrero", isSeen: false, typeMsg: .generic)
    ]
    
    deinit {
        print("Deleted ChatPresenter")
    }
}
extension ChatPresenter: ChatPresenterProtocol{
    
    
    func fetchData() {
        view?.loadData(userData: dummyUser)
    }
}
