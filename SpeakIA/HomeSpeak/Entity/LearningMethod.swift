//
//  LearningMethod.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/8/25.
//

struct LearningMethod {
    let name: String?
    let img: String?
    let title: String?
    let description: String?
    let typeMethod: TypeMethodLearning?
}


enum TypeMethodLearning {
    case speakAI, chatWithAI, speechToText, textToSpeech, myVocavulary, myDictionary
}
