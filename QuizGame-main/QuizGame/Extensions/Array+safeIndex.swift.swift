//
//  Array+safeIndex.swift.swift
//  QuizGame
//
//  Created by Bogdan Yatsiuk on 17.02.2022.
//

import Foundation

extension Array {
    public subscript(safe index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }

        return self[index]
    }
}
