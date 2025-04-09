//
//  HomeSpeakRouter.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/8/25.
//
import UIKit
protocol HomeSpeakRouterProtocol: AnyObject {
    
}

class HomeSpeakRouter: RouterProtocol {
   
    var rootView: UIViewController?
    var navigation: UINavigationController?
    
    func start(navigation: UINavigationController?) -> UIViewController {
        let view =  HomeSpeakViewController()
        let presenter = HomeSpeakPresenter()
        let interactor = HomeSpeakInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = self
        presenter.interactor = interactor
        
        return view
    }
    
    
}
extension HomeSpeakRouter: HomeSpeakRouterProtocol {
    
}
