//
//  GameModeButton.swift
//  QuizMe
//
//  Created by James Erringham-Bruce on 04/07/2021.
//

import SwiftUI

struct GameModeButton: View {
    var width = UIScreen.main.bounds.size.width
    var height = UIScreen.main.bounds.size.height
    var icon: String
    var title: String
    var info: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.15), radius: 7, x: 0.0, y: 0.0)
            
            VStack {
                HStack (spacing: 20) {
                    Image(systemName: "\(icon)")
                        .foregroundColor(Color(red: 1, green: 30/255, blue: 60/255))
                        .font(.system(size: 20))
                    Text("\(title)")
                        .modifier(PoppinsFont(.medium, size: 18))
                        .foregroundColor(Color(red: 1, green: 30/255, blue: 60/255))
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    Text("\(info)")
                        .modifier(PoppinsFont(.light, size: 12))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding(.leading, 10)
            }
            .padding(10)
        }
        .frame(width: width*0.9, height: height*0.08)
    }
}
