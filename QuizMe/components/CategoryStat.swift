//
//  CategoryStat.swift
//  QuizMe
//
//  Created by James Erringham-Bruce on 04/07/2021.
//

import SwiftUI

struct CategoryStat: View {
    var number: String
    var text: String
    var body: some View {
        VStack (alignment: .center, spacing: 5) {
            ZStack {
                Rectangle()
                    .fill(Color.white.opacity(0.3))
                    .cornerRadius(.infinity)
                    .ignoresSafeArea()
                Text("\(number)")
                    .modifier(PoppinsFont(.extraBold, size: 14))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
            }
            .frame(width: 70, height: 25, alignment: .center)
            Text("\(text)")
                .modifier(PoppinsFont(.regular, size: 16))
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
        }
        .padding()
    }
}
