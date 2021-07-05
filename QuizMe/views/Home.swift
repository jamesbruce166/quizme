//
//  Home.swift
//  QuizMe
//
//  Created by James Erringham-Bruce on 04/07/2021.
//

import SwiftUI

struct Home: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("QuizMe")
                    .modifier(PoppinsFont(.semiBold, size: 35))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                Spacer()
                Button(action: {
                }) {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 25.0))
                }
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
            }
        }
        .onAppear() {
            self.viewModel.getCategories()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
