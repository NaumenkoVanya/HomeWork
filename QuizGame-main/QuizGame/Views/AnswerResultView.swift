//
//  AnswerView.swift
//  QuizGame
//
//  Created by Bogdan Yatsiuk on 18.02.2022.
//

import UIKit

class AnswerResultView: UIView {
    private var resultLabel: UILabel?
    private var explanationLabel: UILabel?
    private var button: UIButton?

    private let rightText = "ВЕРНО"
    private let wrongText = "НЕВЕРНО"

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    func configure(with answer: AnswerResult, target: Any, action: Selector) {
        resultLabel?.text = answer.isCorrect ? rightText : wrongText
        resultLabel?.textColor = answer.isCorrect ? UIColor.systemGreen : UIColor.systemRed

        explanationLabel?.text = answer.explanation

        let buttonTitle = "\(answer.buttonTitle)  \(answer.isCorrect ? "🙂" : "😕")"
        button?.setTitle(buttonTitle, for: .normal)
        button?.addTarget(target, action: action, for: .touchUpInside)
    }

    private func commonInit() {
        let resultLabel = addResultLabel()
        let explanationLabel = addExplanation(topAnchor: resultLabel.bottomAnchor)

        button = addNextButton(topAnchor: explanationLabel.bottomAnchor)

        self.resultLabel = resultLabel
        self.explanationLabel = explanationLabel
    }

    private func makeLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }

    private func addResultLabel() -> UILabel {
        let label = makeLabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        addSubview(label)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])

        return label
    }

    private func addExplanation(topAnchor: NSLayoutYAxisAnchor) -> UILabel {
        let label = makeLabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        addSubview(label)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
        ])

        return label
    }

    func addNextButton(topAnchor: NSLayoutYAxisAnchor) -> UIButton {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 16
        addSubview(button)

        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
        ])

        return button
    }
}
