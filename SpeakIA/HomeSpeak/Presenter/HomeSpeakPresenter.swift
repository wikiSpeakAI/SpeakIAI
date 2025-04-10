//
//  HomeSpeakPresenter.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/8/25.
//
import UIKit

protocol HomeSpeakPresenterProtocol: AnyObject {
    func fetchData()
    func gotoFlow(flow: LearningMethod)
}

class HomeSpeakPresenter: PresenterProtocol {
    weak var view: HomeSpeakViewControllerProtocol?
    var router: HomeSpeakRouterProtocol?
    var interactor: HomeSpeakInteractorProtocol?
    
    var sessionTimer: Timer?
    private let secondsToEvent: Int = 3

    deinit {
        print("deleted HomeSpeakPresenter")
    }
    
    let dataDummy: [LearningMethod] = [
        LearningMethod(name: "speakAI", img: "speakAI", title: "Habla con MelissIA", description: "Habla con IA para mejorar tu lenguaje", typeMethod: .speakAI),
        LearningMethod(name: "chatWithAI", img: "chatAI", title: "Chatea", description: "Chatea con IA para mejorar tu lenguaje", typeMethod: .chatWithAI)]
}

extension HomeSpeakPresenter: HomeSpeakPresenterProtocol {
    func gotoFlow(flow: LearningMethod) {
        router?.gotoFlowRouter(flow: flow)
    }
    
    func fetchData() {
        sessionTimer = Timer.scheduledTimer(timeInterval: TimeInterval(secondsToEvent), target: self, selector: #selector(validateSessionData), userInfo: nil, repeats: false)
    }
    
    @objc func validateSessionData(){
        self.view?.loadData(LearnidMethod: self.dataDummy)

    }
    
    
    
}
