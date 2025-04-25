//
//  MessagesModel.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/23/25.
//

struct MessagesModel {
    var id: String
    var msg: String
    var translate: String?
    var isTralated: Bool = false
    var date: String
    var isSeen: Bool = false
    var typeMsg: TypeMessge?
}


enum TypeMessge {
    case generic, img, audio
}

