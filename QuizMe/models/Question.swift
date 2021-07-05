//
//  Question.swift
//  QuizMe
//
//  Created by James Erringham-Bruce on 04/07/2021.
//

import Foundation

struct QuestionRequest: Decodable, Identifiable {
    let id = UUID()
    var response_code: Int
    var results: [Question]
}

struct Question: Decodable {
    var category: String
    var type: String
    var difficulty: String
    var question: String
    var correct_answer: String
    var incorrect_answers: [String]
}
