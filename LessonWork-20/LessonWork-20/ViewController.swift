//
//  ViewController.swift
//  LessonWork-20
//
//  Created by Ваня Науменко on 21.02.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var secondTextFiejd: UITextField!
    
    @IBOutlet weak var thirdTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttomAction(_ sender: UIButton) {
        view.endEditing(true)
    }
}

//extension ViewController: UITextFieldDelegate {
//    func textFieldShouldReturn (_ textField: UITextField) -> Bool {
//
//    if textField1 === textField {
//
//        }
//        textField.resignFirstResponder()
//
//        return true
//    }
//}
