//
//  ChatRouter.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/12/25.
//
import UIKit

protocol ChatRouterProtocol: AnyObject {
    
}

class ChatRouter: RouterProtocol {
    weak var rootView: UIViewController?
    var navigation: UINavigationController?
    var data: [MessagesModel]?
    
    init(data: [MessagesModel]? = nil) {
        self.data = data
    }
    
    func start(navigation: UINavigationController?) -> UIViewController {
        let view = ChatViewController()
        let presenter = ChatPresenter()
        let interactor = ChatInteractor()
        
        view.presenter = presenter
        view.dataSource = data
        presenter.view = view
        presenter.router = self
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        self.navigation = navigation
        self.rootView = view
        
        return view
        
        
    }
    
    deinit {
        print("Deleted ChatRouter")
    }
    
    
}
extension ChatRouter: ChatRouterProtocol {
    
}
