//
//  SecondVC.swift
//  ASimpleTestWithTwoScreens
//
//  Created by Алексей Журавлев on 31.07.2022.
//

import UIKit

class SecondVC: UIViewController {
    
    weak var savingText:SaveText!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func saveTextToFirstScreen(_ sender: Any) {
        guard let text = inputTextField.text else {return}
        if !text.isEmpty{
            savingText?.saveText(item: text)
            print("Delegat was calling")
            dismiss(animated: true)
        }
    }
    
}
