//
//  User.swift
//  QuizMe
//
//  Created by James Erringham-Bruce on 04/07/2021.
//

import SwiftUI

class Score: ObservableObject {
    @Published var correctAnswers: Int = 0
    @Published var incorrectAnswers: Int = 0
}
