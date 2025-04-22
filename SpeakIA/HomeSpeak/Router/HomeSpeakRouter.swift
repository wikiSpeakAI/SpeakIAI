//
//  HomeSpeakRouter.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/8/25.
//
import UIKit
protocol HomeSpeakRouterProtocol: AnyObject {
    func gotoFlowRouter(flow: LearningMethod)
}

class HomeSpeakRouter: RouterProtocol {
   
    var rootView: UIViewController?
    var navigation: UINavigationController?
    
    func start(navigation: UINavigationController?) -> UIViewController {
        let view =  HomeSpeakViewController()
        let presenter = HomeSpeakPresenter()
        let interactor = HomeSpeakInteractor()
        
        self.navigation = navigation
        view.presenter = presenter
        presenter.view = view
        presenter.router = self
        presenter.interactor = interactor
        
        return view
    }
    
    deinit {
        print("Deleted HomeSpeakRouter" )
    }
    
}
extension HomeSpeakRouter: HomeSpeakRouterProtocol {
    func gotoFlowRouter(flow: LearningMethod) {

        switch flow.typeMethod {
        case .chatWithAI:
            let router = ChatListRouter()
            let vc = router.start(navigation: navigation)
            print("dede abrir ChatListRouter vc: ", vc)

            navigation?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
    
    
}
