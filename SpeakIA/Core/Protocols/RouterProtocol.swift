//
//  RouterProtocol.swift
//  AppDondeBanco
//
//  Created by Administrador on 13/08/24.
//

import Foundation
import UIKit


protocol RouterProtocol: AnyObject {
    associatedtype T
    
    var rootView: T? {get}
    var navigation: UINavigationController? {get}
    
    func start(navigation: UINavigationController?) -> UIViewController
}
