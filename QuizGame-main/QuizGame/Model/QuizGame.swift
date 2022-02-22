//
//  Question.swift
//  QuizGame
//
//  Created by Bogdan Yatsiuk on 14.02.2022.
//

import Foundation

class QuizGame {

    private var questions: [Question]
    private var currentQuestionIndex = -1
    private var currentQuestion: Question?

    private(set) var score = 0
    private(set) var skipsLeft = 3
    
    var canSkip: Bool {
        return skipsLeft > 0
    }

    init(questions: [Question]) {
        self.questions = questions.shuffled()
    }

    func nextQuestion() -> Question? {
        currentQuestionIndex += 1
        var currentQuestion = questions[safe: currentQuestionIndex]
        currentQuestion?.answers.shuffle()

        self.currentQuestion = currentQuestion
        return currentQuestion
    }

    func checkAnswer(_ answer: Int) -> (isCorrect: Bool, explanation: String) {
        guard let currentQuestion = currentQuestion else { return (false, "") }

        let isCorrect = currentQuestion.answers[safe: answer] == currentQuestion.correctAnswer
        score += isCorrect ? 1 : 0

        return (isCorrect, currentQuestion.explanation)
    }

    func skipQuestion() -> Question? {
        guard skipsLeft > 0 else { return nil }
        skipsLeft -= 1
        return  nextQuestion()
    }
}
