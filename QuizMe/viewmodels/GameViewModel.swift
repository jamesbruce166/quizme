//
//  GameViewModel.swift
//  QuizMe
//
//  Created by James Erringham-Bruce on 04/07/2021.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    @Published var questionIndex: Int = 0
    @Published var answers: [String] = [""]
    @Published var disabled = false
    @Published var showAnswers = false
    @Published var alertItem: AlertItem?
    
    func answerPressed(answer: String, results: [Question], score: Score) {
        self.disabled.toggle()
        self.showAnswers.toggle()
        
        if answerWasCorrect(answer: answer, results: results) {
            registerCorrectAnswer(score: score)
        } else {
            registerIncorrectAnswer(score: score)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.nextQuestion(results: results)
            self.getRandomAnswerArray(results: results)
            self.disabled.toggle()
        }
    }
    
    func nextQuestion(results: [Question]) {
        if self.questionIndex < results.count-1 {
            self.questionIndex += 1
            self.showAnswers.toggle()
        } else {
            roundOver()
        }
    }
    
    func answerWasCorrect(answer: String, results: [Question]) -> Bool {
        if results[self.questionIndex].correct_answer == answer {
            return true
        }
        return false
    }
    
    func registerCorrectAnswer(score: Score) {
        score.correctAnswers += 1
    }
    
    func registerIncorrectAnswer(score: Score) {
        score.incorrectAnswers += 1
    }
    
    func roundOver() {
        print("round over")
        self.alertItem = AlertContext.roundOver
    }
    
    func getRandomAnswerArray(results: [Question]) {
        let correct = results[self.questionIndex].correct_answer
        var incorrect = results[self.questionIndex].incorrect_answers
        incorrect.append(correct)
        self.answers = incorrect.shuffled()
    }
}
