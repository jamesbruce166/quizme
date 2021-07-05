//
//  AnswerCard.swift
//  QuizMe
//
//  Created by James Erringham-Bruce on 04/07/2021.
//

import SwiftUI

struct AnswerCard: View {
    var width = UIScreen.main.bounds.size.width
    var height = UIScreen.main.bounds.size.height
    
    var answer: String
    var isCorrect: Bool
    var showAnswer: Bool
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(getColour())
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.15), radius: 7, x: 0.0, y: 0.0)
            
            VStack {
                Text("\(answer.htmlAttributedString.string)")
                    .modifier(PoppinsFont(.regular, size: 18))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .minimumScaleFactor(0.3)
            }
            .padding(10)
        }
        .frame(width: width*0.9, height: height*0.1)
        .padding(10)
    }
    
    func getColour() -> Color {
        if isCorrect && showAnswer {
            return .green
        } else if !isCorrect && showAnswer {
            return .red
        }
        return .white
    }
}
