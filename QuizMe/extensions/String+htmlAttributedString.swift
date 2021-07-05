//
//  String+htmlAttributedString.swift
//  QuizMe
//
//  Created by James Erringham-Bruce on 04/07/2021.
//

import Foundation

extension String {
    var htmlAttributedString: NSAttributedString {
        do {
            return try NSAttributedString(data: Data(utf8), options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch _ {
            return NSAttributedString(string: "error")
        }
    }
}
