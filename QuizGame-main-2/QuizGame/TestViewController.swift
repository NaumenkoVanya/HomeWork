//
//  TestViewController.swift
//  QuizGame
//
//  Created by Bogdan Yatsiuk on 17.02.2022.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet var testView: UIView!
    @IBOutlet var bottomConstraint: NSLayoutConstraint!


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)


//        bottomConstraint.constant = 450

//        UIView.animate(withDuration: 0.5,
//                       delay: 0,
//                       options: [.curveEaseOut],
//                       animations: {
//            self.view.layoutIfNeeded()
//        })

//        testView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
//
//        UIView.animate(
//            withDuration: 1,
//            delay: 0,
//            usingSpringWithDamping: 3,
//            initialSpringVelocity: 30,
//            options: [],
//            animations: {
//                self.testView.transform = CGAffineTransform.identity
////                self.view.layoutIfNeeded()
//            },
//            completion: nil)
    }
}
