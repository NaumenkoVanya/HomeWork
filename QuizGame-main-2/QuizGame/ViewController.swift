//
//  ViewController.swift
//  QuizGame
//
//  Created by Bogdan Yatsiuk on 14.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var skipButton: UIButton!

    @IBOutlet var buttonsXConstraint: [NSLayoutConstraint]!
    @IBOutlet var skipButtonBottomContraint: NSLayoutConstraint!

    var blurView: UIVisualEffectView?

    private var game: QuizGame?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let game = GameManager.makeGame()
        self.game = game

        addResultView()
        fillContent(question: game.nextQuestion())
        showContent()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        showContent()
    }

    // MARK: - UI

    func addResultView() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.isHidden = true
        blurView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(blurView)
        blurView.addConstraintsToSuperview()

        // Add Labels
        // Result
        // Explanation
        // Button

        self.blurView = blurView
    }

    func fillContent(question: Question) {
        questionLabel.isHidden = true
        questionLabel.text = question.question

        for (idx, button) in buttons.enumerated() {
            button.isHidden = true
            button.setTitle(question.answers[idx], for: .normal)
        }
        skipButton.isHidden = true
    }

    func showContent() {
        for buttonPosition in buttonsXConstraint {
            buttonPosition.constant = view.frame.width
        }
        skipButtonBottomContraint.constant = -(view.safeAreaInsets.bottom + skipButton.frame.height)

        view.layoutIfNeeded()

        questionLabel.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        self.questionLabel.isHidden = false

        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 4,
            initialSpringVelocity: 40,
            options: [],
            animations: {
                self.questionLabel.transform = CGAffineTransform.identity
            },
            completion: nil)

        showButtons()
    }

    func showButtons() {
        skipButton.isHidden = false

        for button in buttons {
            button.isHidden = false
        }

        var delay = 0.15
        for buttonPosition in buttonsXConstraint {
            UIView.animate(
                withDuration: 0.5,
                delay: delay,
                usingSpringWithDamping: 3,
                initialSpringVelocity: 30,
                options: [],
                animations: {
                    buttonPosition.constant = 0
                    self.view.layoutIfNeeded()
                },
                completion: nil)

            delay += 0.15
        }

        skipButtonBottomContraint.constant = 20
        UIView.animate(
            withDuration: 0.3,
            delay: delay + 0.15,
            usingSpringWithDamping: 3,
            initialSpringVelocity: 30,
            options: [],
            animations: {
                self.view.layoutIfNeeded()
            },
            completion: nil)
    }

    // MARK: - Actions

    @IBAction func answerButtonTapped(_ sender: UIButton) {
        guard let game = game else { return }

        let isCorrect = game.checkAnswer(sender.tag)

        if isCorrect {
            fillContent(question: game.nextQuestion())
            showContent()
        }
    }

    @IBAction func skipButtonTapped(_ sender: Any) {
        blurView?.isHidden = false
//        if let question = game?.skipQuestion() {
//            fillContent(question: question)
//            showContent()
//        }
    }
}

