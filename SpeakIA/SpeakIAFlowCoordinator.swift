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
    
    
    
    public func start(navigation: UINavigationController?) -> UIViewController {
        // validate if account premium o free
        self.navigation = navigation
        let viewController = HomeSpeakRouter()
        let vc = viewController.start(navigation: navigation)
        
        return vc
    }
    
    deinit {
        print("deleted SpeakIAFlowCoordinator")
    }
}
