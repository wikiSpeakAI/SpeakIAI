//
//  SpeakIAFlowCoordinator.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/8/25.
//

import UIKit

class SpeakIAFlowCoordinator: RouterProtocol{
    
    var navigation: UINavigationController?
    var rootView: UIViewController?
    
    private var navigationController: UINavigationController!
    
    
    public func start(navigation: UINavigationController?) -> UIViewController {
        // validate if account premium o free
        let viewController = HomeSpeakRouter()
        let vc = viewController.start(navigation: navigationController)
        
        return vc
    }
}
