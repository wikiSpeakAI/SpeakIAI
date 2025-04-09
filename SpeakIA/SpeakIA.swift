//
//  SpeakIA.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/7/25.
//

import UIKit

public class SpeakIA {
    public init() {}
    
    public func hello() -> String {
        return "Hello, World!"
    }
    
    public func initSpeakIA(_ navigationController: UINavigationController) {
        configStatusBar(navigationController)

        let speakIAFlow = SpeakIAFlowCoordinator()


        let vc =  speakIAFlow.start(navigation: navigationController)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func configStatusBar(_ navigationController : UINavigationController) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let statusBarFrame = windowScene.statusBarManager?.statusBarFrame,
           let window = windowScene.windows.first {

            let statusBarView = UIView(frame: statusBarFrame)
            statusBarView.backgroundColor = .statusBarColor
            window.addSubview(statusBarView)
            navigationController.navigationBar.backgroundColor = .statusBarColor
    
            
        }
    }

    deinit {
        print("BYE SDK")
    }
}
