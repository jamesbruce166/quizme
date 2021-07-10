//
//  Menu.swift
//  QuizMe
//
//  Created by James Erringham-Bruce on 04/07/2021.
//

import SwiftUI

struct Menu: View {
    @Environment(\.presentationMode) var presentationMode
    
    private var paragraph1 = "This app is a wrapper around the amazing Open Trivia DB. Open Trivia DB is an open API that allows any member of public to submit their own quiz question."
    
    private var paragraph2 = "If you want to contribute, please visit their website and submit your own questions. New questions are submitted and approved everyday."
    
    private var paragraph3 = "Out of courtesy for Open Triva DB - this app is 100% free with no Ads. I hope you enjoy!"

    var body: some View {
        ScrollView {
            VStack (spacing: 20) {
                Text("Info")
                    .modifier(PoppinsFont(.semiBold, size: 35))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
                
                Text(paragraph1)
                    .modifier(PoppinsFont(.regular, size: 16))
                    .multilineTextAlignment(.leading)
                    .lineLimit(100)
                
                Text(paragraph2)
                    .modifier(PoppinsFont(.regular, size: 16))
                    .multilineTextAlignment(.leading)
                    .lineLimit(100)
                
                Text(paragraph3)
                    .modifier(PoppinsFont(.regular, size: 16))
                    .multilineTextAlignment(.leading)
                    .lineLimit(100)
                
                Spacer()
            }
            .padding()
            
            Button(action: {
                guard let url = URL(string: "https://jameserringhambruce.co.uk"), UIApplication.shared.canOpenURL(url) else {
                  return
                }
                UIApplication.shared.open(url as URL)
            }) {
                HStack {
                    Image(systemName: "link")
                        .foregroundColor(.blue)
                    Text("View My Website")
                        .foregroundColor(.blue)
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
