//
//  PresenterProtocol.swift
//  AppDondeBanco
//
//  Created by Administrador on 13/08/24.
//

import Foundation
import UIKit

protocol PresenterProtocol: AnyObject {
    associatedtype viewProtocol
    associatedtype routerProtocol
    associatedtype interactorProtocol
    
    var view: viewProtocol? { get set }
    var router: routerProtocol? { get set }
    var interactor: interactorProtocol? { get set }
}

