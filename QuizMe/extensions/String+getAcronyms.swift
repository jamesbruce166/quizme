//
//  String+getAcronyms.swift
//  QuizMe
//
//  Created by James Erringham-Bruce on 04/07/2021.
//

import SwiftUI

extension String
{
    public func getAcronyms(separator: String = "") -> String
    {
        return self.components(separatedBy: separator).map { String($0.prefix(1))}.joined()
    }
}
