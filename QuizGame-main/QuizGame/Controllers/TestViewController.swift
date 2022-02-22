//
//  TestViewController.swift
//  QuizGame
//
//  Created by Bogdan Yatsiuk on 17.02.2022.
//

import UIKit

class TestViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet var imgView: UIImageView!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

    @IBAction func alertButtonTapped(_ sender: Any) {
        showImagePicker()
    }

    func showImagePicker() {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = true
        pickerController.delegate = self

        present(pickerController, animated: true, completion: nil)
    }

    func showAlert() {
        let alertController = UIAlertController(title: "Вопросы закончились",
                                                message: "Начать сначала?",
                                                preferredStyle: .actionSheet)

        let yesAction = UIAlertAction(title: "Да",
                                   style: .default)

        let noAction = UIAlertAction(title: "Нет!",
                                     style: .cancel)

        let noWayAction = UIAlertAction(title: "Низачтооо!",
                                     style: .destructive)

        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        alertController.addAction(noWayAction)

        present(alertController, animated: true, completion: nil)
    }
}

extension TestViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imgView.image = image

        } else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imgView.image = image
        }

        picker.dismiss(animated: true, completion: nil)
    }
}
