//
//  CardView.swift
//  QuizMe
//
//  Created by James Erringham-Bruce on 04/07/2021.
//

import SwiftUI

struct CardView: View {
    var width = UIScreen.main.bounds.size.width
    var height = UIScreen.main.bounds.size.height
    
    var name: String
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            ZStack {
                Color.random
                Text("\(name.getAcronyms(separator: " "))")
                    .modifier(PoppinsFont(.extraBold, size: 100))
                    .foregroundColor(.white.opacity(0.1))
                    .multilineTextAlignment(.center)
                VStack {
                    Spacer()
                    HStack {
                        Text("\(name)")
                            .modifier(PoppinsFont(.medium, size: 25))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .padding(10)
                }
            }
            .frame(width: width*0.85, height: height*0.25, alignment: .center)
            .cornerRadius(20)
            .padding(10)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(name: "Category Name")
    }
}
