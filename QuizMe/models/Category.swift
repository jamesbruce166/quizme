//
//  Category.swift
//  QuizMe
//
//  Created by James Erringham-Bruce on 04/07/2021.
//

import Foundation

struct CategoryGroup: Decodable {
    var trivia_categories: [Category]
}

struct CategoryInfo: Decodable {
    var overall: QuestionCount
    var categories: [Int: QuestionCount]
}

struct Category: Decodable, Hashable, Identifiable  {
    var id: Int
    var name: String
}

struct QuestionCount: Decodable {
    var total_num_of_questions: Int
    var total_num_of_pending_questions: Int
    var total_num_of_verified_questions: Int
    var total_num_of_rejected_questions: Int
}
