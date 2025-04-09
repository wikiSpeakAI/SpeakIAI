//
//  Storyboarded.swift
//  AppDondeBanco
//
//  Created by Administrador on 13/08/24.
//

import Foundation
import UIKit


protocol Storyboarded {
    associatedtype T
    
    static func instantiate(from flow: String?,  bundle: Bundle?) -> T
}

extension Storyboarded where Self: UIViewController{
    static func instantiate(from flow: String? = "Main", bundle: Bundle? = nil ) -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: flow!, bundle: bundle)
        guard let vc = storyboard.instantiateViewController(withIdentifier: className) as? Self else { fatalError("")  }
        return vc
        
    }
}
