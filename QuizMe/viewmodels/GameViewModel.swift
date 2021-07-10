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
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var timeRemaining = 30
    
    func countdown() {
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
            alertItem = AlertContext.TimeOut
        }
    }
    
    func answerPressed(answer: String, results: [Question]) {
        self.disabled.toggle()
        self.showAnswers.toggle()
        
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
