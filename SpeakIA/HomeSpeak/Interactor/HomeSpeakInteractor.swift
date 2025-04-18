//
//  HomeSpeakInteractor.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/8/25.
//
protocol HomeSpeakInteractorProtocol: AnyObject {
    
}

class HomeSpeakInteractor: InteractorProtocol {
    weak var presenter: HomeSpeakPresenterProtocol?
    
}

extension HomeSpeakInteractor: HomeSpeakInteractorProtocol {
    
}
