//
//  API.swift
//  QuizMe
//
//  Created by James Erringham-Bruce on 04/07/2021.
//

import Foundation

class Api : ObservableObject{
    @Published var categories: CategoryGroup?
    @Published var categoryInfo: CategoryInfo?
    @Published var questionList: QuestionRequest?
    
    func loadCategories(completion:@escaping (Result<CategoryGroup, Error>) -> ()) {
        guard let url = URL(string: "https://opentdb.com/api_category.php") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error.localizedDescription as! Error))
                return
            }
            do {
                let categories = try JSONDecoder().decode(CategoryGroup.self, from: data!)
                completion(.success(categories))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }.resume()
    }
    
    func getCategoryInfo(completion:@escaping (Result<CategoryInfo, Error>) -> ()) {
        guard let url = URL(string: "https://opentdb.com/api_count_global.php") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error.localizedDescription as! Error))
                return
            }
            do {
                let categoryInfo = try JSONDecoder().decode(CategoryInfo.self, from: data!)
                completion(.success(categoryInfo))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }.resume()
    }
    
    func getQuestions(categoryId: Int, numOfQuestions: Int, completion:@escaping (Result<QuestionRequest, Error>) -> ()) {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=\(numOfQuestions)&category=\(categoryId)") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error.localizedDescription as! Error))
                return
            }
            do {
                let questionList = try JSONDecoder().decode(QuestionRequest.self, from: data!)
                completion(.success(questionList))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }.resume()
    }
}

