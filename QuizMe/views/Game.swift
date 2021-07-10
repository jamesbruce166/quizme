//
//  Game.swift
//  QuizMe
//
//  Created by James Erringham-Bruce on 04/07/2021.
//

import SwiftUI

struct Game: View {
    @Environment(\.presentationMode) var presentationMode
    
    var width = UIScreen.main.bounds.size.width
    var height = UIScreen.main.bounds.size.height
    var questions: QuestionRequest
    var isNormalMode: Bool
    
    @StateObject private var viewModel = GameViewModel()
    @Binding var score: Int

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                ZStack {
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 200/255, green: 50/255, blue: 50/255), Color(red: 1, green: 0, blue: 153/255)]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(30)
                        .ignoresSafeArea()
                    
                    VStack {
                        HStack (spacing: 15) {
                            Image(systemName: "chevron.left.circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                                .onTapGesture(perform: {
                                    self.presentationMode.wrappedValue.dismiss()
                                })
                            Text("Question \(viewModel.questionIndex+1)")
                                .modifier(PoppinsFont(.medium, size: 25))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .lineLimit(3)
                                .minimumScaleFactor(0.3)
                            
                            Spacer()
                            
                            if !isNormalMode {
                                Text("\(viewModel.timeRemaining)s")
                                    .modifier(PoppinsFont(.medium, size: 20))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                        .padding()
                        Text("\(questions.results[viewModel.questionIndex].question.htmlAttributedString.string)")
                            .modifier(PoppinsFont(.regular, size: 20))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .padding()
                        Spacer()
                    }
                }
                .frame(width: width, height: height*0.27, alignment: .center)
                
                Spacer()
                
                ForEach(viewModel.answers, id: \.self) { answer in
                    Button(action: {
                        viewModel.answerPressed(answer: answer, results: questions.results)
                        if viewModel.answerWasCorrect(answer: answer, results: questions.results) {
                            score += 1
                        }
                    }) {
                        AnswerCard(answer: answer, isCorrect: viewModel.answerWasCorrect(answer: answer, results: self.questions.results), showAnswer: viewModel.showAnswers)
                    }
                }
                
                Spacer()
            }
        }
        .onAppear() {
            viewModel.getRandomAnswerArray(results: questions.results)
        }
        .onReceive(viewModel.timer) { _ in
            if !isNormalMode {
                viewModel.countdown()
            }
        }
        .disabled(viewModel.disabled)
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle, action: { self.presentationMode.wrappedValue.dismiss() }))
        })
    }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game(questions: QuestionRequest.init(response_code: 0, results: [Question.init(category: "test", type: "multiple", difficulty: "easy", question: "This is my example question, can you read it?", correct_answer: "yes", incorrect_answers: ["This is a really long answer and you should shrink me down as much as you possible can", "not sure", "What do you think?"])]), isNormalMode: true, score: .constant(0))
    }
}
