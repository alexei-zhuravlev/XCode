//
//  ViewController.swift
//  Calculator
//
//  Created by Алексей Журавлев on 04.03.2022.
//

import UIKit

class ViewController: UIViewController {
    //Сначала займемся внешним видом.
    //Вытаскиваем все аутлеты
    
    @IBOutlet weak var button_ac: UIButton!
    @IBOutlet weak var button_sign: UIButton!
    @IBOutlet weak var button_perc: UIButton!
    @IBOutlet weak var buttin_divide: UIButton!
    @IBOutlet weak var button_1: UIButton!
    @IBOutlet weak var button_2: UIButton!
    @IBOutlet weak var button_3: UIButton!
    @IBOutlet weak var button_multiply: UIButton!
    @IBOutlet weak var button_4: UIButton!
    @IBOutlet weak var button_5: UIButton!
    @IBOutlet weak var button_6: UIButton!
    @IBOutlet weak var button_minus: UIButton!
    @IBOutlet weak var button_7: UIButton!
    @IBOutlet weak var button_8: UIButton!
    @IBOutlet weak var button_9: UIButton!
    @IBOutlet weak var button_plus: UIButton!
    @IBOutlet weak var button_0: UIButton!
    @IBOutlet weak var button_comma: UIButton!
    @IBOutlet weak var button_result: UIButton!
    @IBOutlet weak var labelText: UILabel!
    
    //описываем как их надо отображать
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let buttons = [button_ac, button_sign, button_perc, buttin_divide, button_multiply, button_minus, button_plus, button_comma, button_result, button_1, button_2, button_3, button_4, button_5, button_6, button_7, button_8, button_9, button_0]
        
        for element in buttons{
            element?.layer.cornerRadius = 12
        }
    }
    
    //MARK: Теперь переменные, которые буду использовать в логике
    
    //Переменная, которая покажет начался ли набор цифр или продолжается
    var isFirstPressing = true
    
    //Переменная, которая будет использоваться для хранения ранее введенного числа
    var firstOperand:Float = 0
    
    //Результат вычислений
    var result:Float = 0
    
    //Выбранная арифметическая операция
    var pressedOperand:Operands = .plus
    
    //Переменная, которая показывает была ли ранее выбрана какая-то арифметическая операция. Нужна для организации цепочки вычислений
    var ifPressedOperandBefor = false
    
    //Перечисление с возможными операциями
    enum Operands{
        case plus
        case minus
        case multiply
        case divide
        case percent
    }
    
    //MARK: Объявим функции, нужные для вычислений
    //очистка экрана
    func clearLabel(){
        labelText.text = "0"
        isFirstPressing = true
        firstOperand = 0
        ifPressedOperandBefor = false
    }

    //Функция вычисления результата операции
    func calculation()->Float{
        switch pressedOperand{
        case .plus:
            result = firstOperand + Float(labelText.text ?? "0")!
        case .minus:
            result = firstOperand - Float(labelText.text ?? "0")!
        case .multiply:
            result = firstOperand * Float(labelText.text ?? "0")!
        case .divide:
            result = firstOperand / Float(labelText.text ?? "0")!
        case .percent:
            result = Float(labelText.text ?? "0")! / 100
        }
        return result
    }
    
    //MARK: Действия при нажатии кнопок с цифрой и запятой

    @IBAction func pressedBUtton_1(_ sender: UIButton) {
        if isFirstPressing{
            labelText.text = "1"
            isFirstPressing = false
        }else{
            labelText.text = String(labelText.text ?? "") + "1"
        }
    }
    @IBAction func pressedButton_2(_ sender: UIButton) {
        if isFirstPressing{
            labelText.text = "2"
            isFirstPressing = false
        }else{
            labelText.text = String(labelText.text ?? "") + "2"
        }
    }
    @IBAction func pressedButton_3(_ sender: Any) {
        if isFirstPressing{
            labelText.text = "3"
            isFirstPressing = false
        }else{
            labelText.text = String(labelText.text ?? "") + "3"
        }
    }
    @IBAction func pressedButton_4(_ sender: Any) {
        if isFirstPressing{
            labelText.text = "4"
            isFirstPressing = false
        }else{
            labelText.text = String(labelText.text ?? "") + "4"
        }
    }
    @IBAction func pressedButton_5(_ sender: Any) {
        if isFirstPressing{
            labelText.text = "5"
            isFirstPressing = false
        }else{
            labelText.text = String(labelText.text ?? "") + "5"
        }
    }
    @IBAction func pressedButton_6(_ sender: Any) {
        if isFirstPressing{
            labelText.text = "6"
            isFirstPressing = false
        }else{
            labelText.text = String(labelText.text ?? "") + "6"
        }
    }
    @IBAction func pressedButton_7(_ sender: Any) {
        if isFirstPressing{
            labelText.text = "7"
            isFirstPressing = false
        }else{
            labelText.text = String(labelText.text ?? "") + "7"
        }
    }
    @IBAction func pressedButton_8(_ sender: Any) {
        if isFirstPressing{
            labelText.text = "8"
            isFirstPressing = false
        }else{
            labelText.text = String(labelText.text ?? "") + "8"
        }
    }
    @IBAction func pressedButton_9(_ sender: Any) {
        if isFirstPressing{
            labelText.text = "9"
            isFirstPressing = false
        }else{
            labelText.text = String(labelText.text ?? "") + "9"
        }
    }
    @IBAction func pressedButton_0(_ sender: Any) {
        if isFirstPressing{
            labelText.text = "0"
            isFirstPressing = false
        }else{
            labelText.text = String(labelText.text ?? "") + "0"
        }
    }
    @IBAction func pressedButton_comma(_ sender: Any) {
        if isFirstPressing{
            labelText.text = "0."
            isFirstPressing = false
        }else{
            labelText.text = String(labelText.text ?? "") + "."
        }
    }
    
    //MARK: Действие при нажатии кнопки обнуления
    
    @IBAction func pressedButtonClear(_ sender: Any) {
        clearLabel()
    }
    
    //MARK: Действие при нажатии кнопки изменения знака числа
    
    @IBAction func pressedButtonChange(_ sender: Any) {
        var textForChange = labelText.text!
        if textForChange[textForChange.startIndex] == "-"{
            textForChange.removeFirst()
        }else{ textForChange.insert("-", at: textForChange.startIndex)}
        labelText.text = textForChange
    }
  
    //MARK: Действия при нажатии кнопки арифметических операций
    
    @IBAction func pressedButtonMult(_ sender: Any) {
        if ifPressedOperandBefor{
            result = calculation()
            labelText.text = "\(result)"
            firstOperand = result
        }else{
            firstOperand = Float(labelText.text ?? "0")!
        }
        ifPressedOperandBefor = true
        pressedOperand = .multiply
        isFirstPressing = true
    }
    
    @IBAction func pressedButtonMinus(_ sender: Any) {
        if ifPressedOperandBefor{
            result = calculation()
            labelText.text = "\(result)"
            firstOperand = result
        }else{
            firstOperand = Float(labelText.text ?? "0")!
        }
        ifPressedOperandBefor = true
        pressedOperand = .minus
        isFirstPressing = true
    }
    
    @IBAction func pressedButtonDivide(_ sender: Any) {
        if ifPressedOperandBefor{
            result = calculation()
            labelText.text = "\(result)"
            firstOperand = result
        }else{
            firstOperand = Float(labelText.text ?? "0")!
        }
        ifPressedOperandBefor = true
        pressedOperand = .divide
        isFirstPressing = true
    }
    
    @IBAction func pressedButtonPlus(_ sender: Any) {
        if ifPressedOperandBefor{
            result = calculation()
            labelText.text = "\(result)"
            firstOperand = result
        }else{
            firstOperand = Float(labelText.text ?? "0")!
        }
        ifPressedOperandBefor = true
        pressedOperand = .plus
        isFirstPressing = true
    }
    
    @IBAction func pressedButtonPercent(_ sender: Any) {
        result = Float(labelText.text ?? "0")!/100
        labelText.text = "\(result)"
    }
    
    @IBAction func pressedButtonResult(_ sender: Any) {
        if ifPressedOperandBefor{
            result = calculation()
            labelText.text = "\(result)"
        }else{
            labelText.text = "Вы не выбрали операцию, начните сначала"
        }
        isFirstPressing = true
        ifPressedOperandBefor = false
    }
}

