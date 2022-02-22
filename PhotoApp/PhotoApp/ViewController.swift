//
//  ViewController.swift
//  PhotoApp
//
//  Created by Ваня Науменко on 22.02.22.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @IBAction func alertButton(_ sender: Any) {
        showImagePicker()
    }
 
    func showImagePicker() {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = true
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
        
        
    }
    
    
    func showAlert () {
        let alertController = UIAlertController(title: "Vanya",
                                                message: "developer",
                                                preferredStyle: .actionSheet)
        
        
        let actionYEs = UIAlertAction(title: "Yes",
                                      style: .default,
                                      handler: nil)
        let actionNot = UIAlertAction(title: "Not",
                                      style: .destructive,
                                      handler: nil)
        
        alertController.addAction(actionYEs)
        alertController.addAction(actionNot)
        
        present(alertController, animated: true, completion: nil)
    }
    
}

extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imageView.image = image
        } else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
        }
         
        
        picker.dismiss(animated: true, completion: nil)
    }
}


