//
//  HomeSpeakPresenter.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/8/25.
//
protocol HomeSpeakPresenterProtocol: AnyObject {
    func fetchData()
}

class HomeSpeakPresenter: PresenterProtocol {
    var view: HomeSpeakViewControllerProtocol?
    var router: HomeSpeakRouterProtocol?
    var interactor: HomeSpeakInteractorProtocol?
    
    var sessionTimer: Timer?
    private let secondsToEvent: Int = 15

    
    let dataDummy: [LearningMethod] = [
        LearningMethod(name: "speakAI", img: "speakAI", title: "Habla con MelissIA", description: "Habla con IA para mejorar tu lenguaje", typeMethod: .speakAI),
        LearningMethod(name: "chatWithAI", img: "chatAI", title: "Chatea", description: "Chatea con IA para mejorar tu lenguaje", typeMethod: .chatWithAI)]
}

extension HomeSpeakPresenter: HomeSpeakPresenterProtocol {
    func fetchData() {
        sessionTimer = Timer.scheduledTimer(timeInterval: TimeInterval(secondsToEvent), target: self, selector: #selector(validateSessionData), userInfo: nil, repeats: false)
    }
    
    @objc func validateSessionData(){
        self.view?.loadData(LearnidMethod: self.dataDummy)

    }
    
    
    
}
