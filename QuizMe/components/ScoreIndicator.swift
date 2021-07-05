//
//  ScoreIndicator.swift
//  QuizMe
//
//  Created by James Erringham-Bruce on 04/07/2021.
//

import SwiftUI

struct ScoreIndicator: View {
    var score: Score
    var width = UIScreen.main.bounds.size.width
    var height = UIScreen.main.bounds.size.height
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.3)
                .foregroundColor(Color(red: 1, green: 30/255, blue: 60/255))
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(CGFloat(score.correctAnswers) &/ CGFloat(15), 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color(red: 1, green: 30/255, blue: 60/255))
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            
            Text("\(score.correctAnswers)/15")
                .modifier(PoppinsFont(.medium, size: 28))
                .foregroundColor(Color(red: 1, green: 30/255, blue: 60/255))
                .multilineTextAlignment(.leading)
        }
        .frame(width: width*0.8, height: height*0.2, alignment: .center)
    }
}

