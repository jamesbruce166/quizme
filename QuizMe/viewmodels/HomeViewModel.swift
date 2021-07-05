//
//  HomeViewModel.swift
//  QuizMe
//
//  Created by James Erringham-Bruce on 04/07/2021.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    @Published var categories: CategoryGroup?
    @Published var shouldShowDetailView = false
    @Published var selectedCategory: Category?
    
    func getCategories() {
        Api().loadCategories { result in
            switch result {
            case .success(let categories):
                DispatchQueue.main.async {
                    self.categories = categories
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
