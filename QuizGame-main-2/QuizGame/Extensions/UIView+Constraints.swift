//
//  UIView+Constraints.swift.swift
//  QuizGame
//
//  Created by Bogdan Yatsiuk on 17.02.2022.
//

import UIKit

extension UIView {
    func addConstraintsToSuperview(top: CGFloat = 0,
                                   trailing: CGFloat = 0,
                                   bottom: CGFloat = 0,
                                   leading: CGFloat = 0) {

        guard let superview = superview else { return }

        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor, constant: top),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: trailing),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: bottom),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: leading),
        ])

    }
}
