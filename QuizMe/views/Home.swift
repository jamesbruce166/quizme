//
//  Home.swift
//  QuizMe
//
//  Created by James Erringham-Bruce on 04/07/2021.
//

import SwiftUI

struct Home: View {
    
    @StateObject private var viewModel = HomeViewModel()
    @StateObject var network = NetworkMonitor()
    
    var width = UIScreen.main.bounds.size.width
    var height = UIScreen.main.bounds.size.height
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                HStack {
                    Text("MyQuiz")
                        .modifier(PoppinsFont(.semiBold, size: 35))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                    Spacer()
                    Button(action: {
                        viewModel.shouldShowInfo.toggle()
                    }) {
                        Image(systemName: "info.circle")
                            .font(.system(size: 25.0))
                    }
                    .sheet(isPresented: $viewModel.shouldShowInfo, content: Menu.init)
                }
                .padding()
                
                ScrollView {
                    ForEach(viewModel.categories?.trivia_categories ?? [], id: \.self) { category in
                        Button(action: {
                            self.viewModel.selectedCategory = category
                        }) {
                            CardView(name: category.name)
                        }
                        .fullScreenCover(item: $viewModel.selectedCategory) {
                            CategoryDetail(selectedCategory: $0)
                        }
                    }
                    if viewModel.categories?.trivia_categories.count ?? 0 < 1 {
                        VStack {
                            Image("ListImage")
                                .resizable()
                                .scaledToFit()
                                .frame(width: width*0.7, height: height*0.25, alignment: .center)
                            Text("Categories will appear here")
                                .modifier(PoppinsFont(.light, size: 20))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
            }
            .onAppear() {
                if network.isConnected {
                    self.viewModel.getCategories()
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().preferredColorScheme(.dark)
    }
}
