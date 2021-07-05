//
//  Alerts.swift
//  QuizMe
//
//  Created by James Erringham-Bruce on 04/07/2021.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    static let roundOver = AlertItem(title: Text("Round Over"), message: Text("Well done! No more questions left for this round."), buttonTitle: Text("Finish"))
    static let TimeOut = AlertItem(title: Text("Tome Out"), message: Text("Out of time! How did you do?"), buttonTitle: Text("Finish"))
}


