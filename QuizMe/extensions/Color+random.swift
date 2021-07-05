//
//  Color+random.swift
//  QuizMe
//
//  Created by James Erringham-Bruce on 04/07/2021.
//

import SwiftUI

extension Color {
    static var random: Color {
        return Color(red: .random(in: 0...0.8),
                     green: .random(in: 0...0.8),
                     blue: .random(in: 0...0.8))
    }
}
