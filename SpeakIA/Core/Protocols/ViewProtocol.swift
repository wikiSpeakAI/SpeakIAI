//
//  ViewProtocol.swift
//  AppDondeBanco
//
//  Created by Administrador on 13/08/24.
//

import Foundation

protocol ViewProtocol : AnyObject {
    associatedtype presenterProtocol
    var presenter: presenterProtocol? {get set}
}
