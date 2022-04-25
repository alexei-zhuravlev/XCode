//
//  ViewController.swift
//  NumberToWords
//
//  Created by Алексей Журавлев on 24.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var translateButton: UIButton!
    
    @IBOutlet weak var labelImen: UILabel!
    @IBOutlet weak var labelRod: UILabel!
    @IBOutlet weak var labelDat: UILabel!
    @IBOutlet weak var labelVin: UILabel!
    @IBOutlet weak var labelTvo: UILabel!
    @IBOutlet weak var labelPre: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        оформление поля ввода текста
        inputText.layer.borderWidth = 2
        inputText.layer.borderColor = UIColor.black.cgColor
        inputText.layer.cornerRadius = 15
        
//        оформление кнопки
        translateButton.layer.cornerRadius = 15
        translateButton.layer.borderWidth = 1
        translateButton.layer.borderColor = UIColor.blue.cgColor
        translateButton.layer.shadowColor = UIColor.gray.cgColor
        translateButton.layer.shadowRadius = 5
        translateButton.layer.shadowOffset = CGSize(width: 3, height: 4)
        translateButton.layer.shadowOpacity = 0.6
    }

    @IBAction func translationButtonTapped(_ sender: UIButton) {
        
        guard let number = inputText.text else {return}
        
        let resultTextArray = numberToWord(number: number)
        
        labelImen.text = resultTextArray[0]
        labelRod.text = resultTextArray[1]
        labelDat.text = resultTextArray[2]
        labelVin.text = resultTextArray[3]
        labelTvo.text = resultTextArray[4]
        labelPre.text = resultTextArray[5]
    }
    

}

