//
//  CategoryViewModel.swift
//  QuizMe
//
//  Created by James Erringham-Bruce on 04/07/2021.
//

import SwiftUI

final class CategoryViewModel: ObservableObject {
    @Published var categoryInfo: CategoryInfo?
    @Published var questionRequest: QuestionRequest?
    @Published var totalQuestions: Int = 0
    @Published var pendingQuestions: Int = 0
    
    func loadCategoryInfo(categoryID: Int) {
        Api().getCategoryInfo { result in
            switch result {
            case .success(let info):
                DispatchQueue.main.async {
                    self.categoryInfo = info
                    self.totalQuestions = self.categoryInfo?.categories.filter { $0.key == categoryID }.map { $0.value.total_num_of_verified_questions}[0] ?? 0

                    self.pendingQuestions = self.categoryInfo?.categories.filter { $0.key == categoryID }.map { $0.value.total_num_of_pending_questions}[0] ?? 0
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func startNormalMode(categoryID: Int) {
        Api().getQuestions(categoryId: categoryID, numOfQuestions: 15) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                   self.questionRequest = data
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
