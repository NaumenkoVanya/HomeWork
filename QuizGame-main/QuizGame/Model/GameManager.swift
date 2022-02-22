//
//  Question.swift
//  QuizGame
//
//  Created by Bogdan Yatsiuk on 14.02.2022.
//

import Foundation

class GameManager {

    static func makeGame() -> QuizGame {
        let questions = readQuestions()
        return QuizGame(questions: questions)
    }

    private static func readQuestions() -> [Question] {
        var result: [Question] = []

        if let filePath = Bundle.main.path(forResource: "questions", ofType: "txt") {
            do {
                let content = try String(contentsOfFile: filePath)
                let lines = content.split(separator: "\n").map { String($0) }

                for idx in stride(from: 0, to: lines.count, by: 7) {
                    let question = Question(question: lines[idx],
                                            answers: [
                                                lines[idx + 1],
                                                lines[idx + 2],
                                                lines[idx + 3],
                                                lines[idx + 4],
                                            ],
                                            correctAnswer: lines[idx + 5],
                                            explanation: lines[idx + 6])
                    result.append(question)
                }

            } catch {
                print("Cannot read file content")
            }

        }

        return result
    }
}
