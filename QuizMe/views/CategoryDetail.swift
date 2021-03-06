//
//  CategoryDetail.swift
//  QuizMe
//
//  Created by James Erringham-Bruce on 04/07/2021.
//

import SwiftUI

struct CategoryDetail: View {
    var width = UIScreen.main.bounds.size.width
    var height = UIScreen.main.bounds.size.height
    var selectedCategory: Category
    
    @StateObject var network = NetworkMonitor()
    @StateObject private var viewModel = CategoryViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
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
                            Text("\(selectedCategory.name)")
                                .modifier(PoppinsFont(.medium, size: 25))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        .padding()
                        
                        HStack {
                            CategoryStat(number: "\(String(describing: viewModel.totalQuestions))", text: "Total Questions")
                            Spacer()
                            CategoryStat(number: "\(String(describing: viewModel.pendingQuestions))", text: "Coming Soon")
                        }
                        .padding()
                        Spacer()
                    }
                }
                .frame(width: width, height: height*0.27, alignment: .center)
                
                HStack {
                    Text("Game Modes")
                        .modifier(PoppinsFont(.medium, size: 16))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding([.leading, .top], 15)
                VStack (spacing: 20) {
                    Button(action: {
                        viewModel.startRound(categoryID: selectedCategory.id)
                        viewModel.isNormalMode = true
                    }) {
                        GameModeButton(icon: "star.circle.fill", title: "Normal Mode", info: "15 questions with mixed difficulty.")
                    }
                    Button(action: {
                        viewModel.startRound(categoryID: selectedCategory.id)
                        viewModel.isNormalMode = false
                    }) {
                        GameModeButton(icon: "clock.arrow.circlepath", title: "Quick Fire", info: "15 questions, but be quick!")
                    }
                }
                .padding(.top, 10)
                
                Spacer()
                
                HStack {
                    Text("Recent Score")
                        .modifier(PoppinsFont(.medium, size: 16))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding([.leading, .top], 15)
                ScoreIndicator(score: viewModel.score)
                
                Spacer()
            }
        }
        .onAppear() {
            viewModel.loadCategoryInfo(categoryID: selectedCategory.id)
        }
        .fullScreenCover(item: $viewModel.questionRequest) {
            Game(questions: $0, isNormalMode: viewModel.isNormalMode, score: $viewModel.score)
        }
    }
}

struct CategoryDetail_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetail(selectedCategory: .init(id: 13, name: "Name"))
            .preferredColorScheme(.dark)
    }
}
