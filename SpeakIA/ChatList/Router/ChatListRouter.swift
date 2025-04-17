//
//  ChatListRouter.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/10/25.
//
import UIKit

protocol ChatListRouterProtocol: AnyObject {
    func gotoChatFlow(_ data: [UserChat]?)
}

class ChatListRouter: RouterProtocol {
    
    var navigation: UINavigationController?
    var rootView: UIViewController?
    
    func start(navigation: UINavigationController?) -> UIViewController {
        let view = ChatListViewController()
        let presenter = ChatListPresenter()
        let interactor = ChatListInteractor()
        self.navigation = navigation
        view.presenter = presenter
        presenter.view = view
        presenter.router = self
        presenter.interactor = interactor
        
        return view
        
        
    }
    deinit {
        print("Deleted ChatListRouter")
    }
    
    
}
extension ChatListRouter: ChatListRouterProtocol {
    func gotoChatFlow(_ data: [UserChat]?) {
        var router = ChatRouter(data: data)
        var vc = router.start(navigation: navigation)
        
        navigation?.pushViewController(vc, animated: true)
    }
    
    
}
