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
    
    var dummyUser: [UserChat] = [
        UserChat(id: "1",name: "willy", avatar: "https://via.placeholder.com/150"),
        UserChat(id: "2",name: "Este es un ejemplo de mensaje para pruebas de que tenemos un llenado de datos correctamente para cada celda y que se muestre correctamente.", avatar: "https://via.placeholder.com/150"),
        UserChat(id: "3",name: "willy", avatar: "https://via.placeholder.com/150"),
        UserChat(id: "4",name: "willy", avatar: "https://via.placeholder.com/150"),
        UserChat(id: "5",name: "willy", avatar: "https://via.placeholder.com/150"),
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
