//
//  Color+random.swift
//  QuizMe
//
//  Created by James Erringham-Bruce on 04/07/2021.
//

import SwiftUI

extension Color {
    static var random: Color {
        return Color(red: .random(in: 0.2...0.7),
                     green: .random(in: 0.2...0.7),
                     blue: .random(in: 0.2...0.7))
    }
}
