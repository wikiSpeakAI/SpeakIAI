//
//  InteractorProtocol.swift
//  AppDondeBanco
//
//  Created by Administrador on 13/08/24.
//

import Foundation


protocol InteractorProtocol: AnyObject {
    associatedtype T
    
    var presenter: T? {get}
}
