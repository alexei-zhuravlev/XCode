//
//  ViewController.swift
//  RoundGame
//
//  Created by Алексей Журавлев on 31.03.2022.
//

import UIKit

class ViewController: UIViewController {
    

//Объявим цвета
    let colorDarkBlue = UIColor(red: 51.0/255.0, green: 102.0/255.0, blue: 153.0/255.0, alpha: 1.0)
    let lightBlueColor = UIColor(red: 26.0/255.0, green: 140.0/255.0, blue:255.0/255.0, alpha: 1.0)
    
    @IBOutlet weak var circleOne: MyCustomRoundView!
    @IBOutlet weak var circleTwo: MyCustomRoundView!
    @IBOutlet weak var circleThree: MyCustomRoundView!
    @IBOutlet weak var circleFour: MyCustomRoundView!
    @IBOutlet weak var circleFive: MyCustomRoundView!
    @IBOutlet weak var circleSix: MyCustomRoundView!
    @IBOutlet weak var circleSeven: MyCustomRoundView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        кастомизируем первый кружочек
        circleOne.workingView.backgroundColor = lightBlueColor //цвет
        circleOne.workingView.frame.size.width = 45   //ширина
        circleOne.workingView.frame.size.height = 45  //высота
        circleOne.workingView.layer.cornerRadius = circleOne.workingView.frame.size.width/2 //радиус
        
//       кастомизируем второй кружочек
        circleTwo.workingView.backgroundColor = lightBlueColor
        circleTwo.workingView.frame.size.width = 55   //ширина
        circleTwo.workingView.frame.size.height = 55  //высота
        circleTwo.workingView.layer.cornerRadius = circleTwo.workingView.frame.size.width/2 //радиус
        
//        кастомизируем третий кружочек
        circleThree.workingView.backgroundColor = lightBlueColor
        circleThree.workingView.frame.size.width = 40   //ширина
        circleThree.workingView.frame.size.height = 40  //высота
        circleThree.workingView.layer.cornerRadius = circleThree.workingView.frame.size.width/2 //радиус

//        кастомизируем четвертый кружочек
        circleFour.workingView.backgroundColor = lightBlueColor
        circleFour.workingView.frame.size.width = 70   //ширина
        circleFour.workingView.frame.size.height = 70  //высота
        circleFour.workingView.layer.cornerRadius = circleFour.workingView.frame.size.width/2 //радиус
        
//        кастомизируем пятый кружочек
        circleFive.workingView.backgroundColor = lightBlueColor
        circleFive.workingView.frame.size.width = 60   //ширина
        circleFive.workingView.frame.size.height = 60  //высота
        circleFive.workingView.layer.cornerRadius = circleFive.workingView.frame.size.width/2 //радиус
        
//        кастомизируем шестой кружочек
        circleSix.workingView.backgroundColor = lightBlueColor
        circleSix.workingView.frame.size.width = 65   //ширина
        circleSix.workingView.frame.size.height = 65  //высота
        circleSix.workingView.layer.cornerRadius = circleSix.workingView.frame.size.width/2 //радиус
        
//        кастомизируем седьмой кружочек
        circleSeven.workingView.backgroundColor = lightBlueColor
        circleSeven.workingView.frame.size.width = 70   //ширина
        circleSeven.workingView.frame.size.height = 70  //высота
        circleSeven.workingView.layer.cornerRadius = circleFour.workingView.frame.size.width/2 //радиус
        
    }
    

    @IBAction func panActionOne(_ sender: UIPanGestureRecognizer) {

//        Создадим переменные для координат центра первого кружочка
        
        let valueX = Int(circleOne.center.x)
        let valueY = Int(circleOne.center.y)

//        Координаты всех кружков
        let circleTwoX = Int(circleTwo.frame.minX)...Int(circleTwo.frame.maxX)
        let circleTwoY = Int(circleTwo.frame.minY)...Int(circleTwo.frame.maxY)
        let circleThreeX = Int(circleThree.frame.minX)...Int(circleThree.frame.maxX)
        let circleThreeY = Int(circleThree.frame.minY)...Int(circleThree.frame.maxY)
        let circleFourX = Int(circleFour.frame.minX)...Int(circleFour.frame.maxX)
        let circleFourY = Int(circleFour.frame.minY)...Int(circleFour.frame.maxY)
        let circleFiveX = Int(circleFive.frame.minX)...Int(circleFive.frame.maxX)
        let circleFiveY = Int(circleFive.frame.minY)...Int(circleFive.frame.maxY)
        let circleSixX = Int(circleSix.frame.minX)...Int(circleSix.frame.maxX)
        let circleSixY = Int(circleSix.frame.minY)...Int(circleSix.frame.maxY)
        let circleSevenX = Int(circleSeven.frame.minX)...Int(circleSeven.frame.maxX)
        let circleSevenY = Int(circleSeven.frame.minY)...Int(circleSeven.frame.maxY)
        
        
        
        
//        Теперь перетягивание первого кружочка на какой-то другой
        
        switch valueX{
        case _ where circleTwoX.contains(valueX) &&  circleTwoY.contains(valueY) && !circleTwo.isHidden:
                circleOne.isHidden = true
                circleTwo.changingColor()
                circleTwo.changingSize()
        case _ where circleThreeX.contains(valueX) && circleThreeY.contains(valueY) && !circleThree.isHidden:
                circleOne.isHidden = true
                circleThree.changingColor()
                circleThree.changingSize()
        case _ where circleFourX.contains(valueX) && circleFourY.contains(valueY) && !circleFour.isHidden:
                circleOne.isHidden = true
                circleFour.changingColor()
                circleFour.changingSize()
        case _ where circleFiveX.contains(valueX) && circleFiveY.contains(valueY) && !circleFive.isHidden:
                circleOne.isHidden = true
                circleFive.changingColor()
                circleFive.changingSize()
        case _ where circleSixX.contains(valueX) && circleSixY.contains(valueY) && !circleSix.isHidden:
                circleOne.isHidden = true
                circleSix.changingColor()
                circleSix.changingSize()
        case _ where circleSevenX.contains(valueX) && circleSevenY.contains(valueY) && !circleSeven.isHidden:
                circleOne.isHidden = true
                circleSeven.changingColor()
                circleSeven.changingSize()
        default: break
        
        }
     
        let gestureTranslation = sender.translation(in: view)
        guard let guesterView = sender.view else {return}
        
        guesterView.center = CGPoint(x: guesterView.center.x + gestureTranslation.x, y: guesterView.center.y + gestureTranslation.y)
        
        sender.setTranslation(.zero, in: view)
        
        guard sender.state == .ended else{return}
    }
    
    @IBAction func panActionTwo(_ sender: UIPanGestureRecognizer) {
        
        //        Создадим переменные для координат центра второго кружочка
                
                let valueX = Int(circleTwo.center.x)
                let valueY = Int(circleTwo.center.y)

        //        Координаты всех кружков
                let circleOneX = Int(circleOne.frame.minX)...Int(circleOne.frame.maxX)
                let circleOneY = Int(circleOne.frame.minY)...Int(circleOne.frame.maxY)
                let circleThreeX = Int(circleThree.frame.minX)...Int(circleThree.frame.maxX)
                let circleThreeY = Int(circleThree.frame.minY)...Int(circleThree.frame.maxY)
                let circleFourX = Int(circleFour.frame.minX)...Int(circleFour.frame.maxX)
                let circleFourY = Int(circleFour.frame.minY)...Int(circleFour.frame.maxY)
                let circleFiveX = Int(circleFive.frame.minX)...Int(circleFive.frame.maxX)
                let circleFiveY = Int(circleFive.frame.minY)...Int(circleFive.frame.maxY)
                let circleSixX = Int(circleSix.frame.minX)...Int(circleSix.frame.maxX)
                let circleSixY = Int(circleSix.frame.minY)...Int(circleSix.frame.maxY)
                let circleSevenX = Int(circleSeven.frame.minX)...Int(circleSeven.frame.maxX)
                let circleSevenY = Int(circleSeven.frame.minY)...Int(circleSeven.frame.maxY)
                
                
                
                
        //        Теперь перетягивание первого кружочка на какой-то другой
                
                switch valueX{
                case _ where circleOneX.contains(valueX) &&  circleOneY.contains(valueY) && !circleOne.isHidden:
                        circleTwo.isHidden = true
                        circleOne.changingColor()
                        circleOne.changingSize()
                case _ where circleThreeX.contains(valueX) && circleThreeY.contains(valueY) && !circleThree.isHidden:
                        circleTwo.isHidden = true
                        circleThree.changingColor()
                        circleThree.changingSize()
                case _ where circleFourX.contains(valueX) && circleFourY.contains(valueY) && !circleFour.isHidden:
                        circleTwo.isHidden = true
                        circleFour.changingColor()
                        circleFour.changingSize()
                case _ where circleFiveX.contains(valueX) && circleFiveY.contains(valueY) && !circleFive.isHidden:
                        circleTwo.isHidden = true
                        circleFive.changingColor()
                        circleFive.changingSize()
                case _ where circleSixX.contains(valueX) && circleSixY.contains(valueY) && !circleSix.isHidden:
                        circleTwo.isHidden = true
                        circleSix.changingColor()
                        circleSix.changingSize()
                case _ where circleSevenX.contains(valueX) && circleSevenY.contains(valueY) && !circleSeven.isHidden:
                        circleTwo.isHidden = true
                        circleSeven.changingColor()
                        circleSeven.changingSize()
                default: break
                
                }
        
        let gestureTranslation = sender.translation(in: view)
        guard let guesterView = sender.view else {return}
        
        guesterView.center = CGPoint(x: guesterView.center.x + gestureTranslation.x, y: guesterView.center.y + gestureTranslation.y)
        
        sender.setTranslation(.zero, in: view)
        
        guard sender.state == .ended else{return}
    }
    
    @IBAction func panActionThree(_ sender: UIPanGestureRecognizer) {
        
        //        Создадим переменные для координат центра третьего кружочка
                
                let valueX = Int(circleThree.center.x)
                let valueY = Int(circleThree.center.y)

        //        Координаты всех кружков
                let circleOneX = Int(circleOne.frame.minX)...Int(circleOne.frame.maxX)
                let circleOneY = Int(circleOne.frame.minY)...Int(circleOne.frame.maxY)
                let circleTwoX = Int(circleTwo.frame.minX)...Int(circleTwo.frame.maxX)
                let circleTwoY = Int(circleTwo.frame.minY)...Int(circleTwo.frame.maxY)
                let circleFourX = Int(circleFour.frame.minX)...Int(circleFour.frame.maxX)
                let circleFourY = Int(circleFour.frame.minY)...Int(circleFour.frame.maxY)
                let circleFiveX = Int(circleFive.frame.minX)...Int(circleFive.frame.maxX)
                let circleFiveY = Int(circleFive.frame.minY)...Int(circleFive.frame.maxY)
                let circleSixX = Int(circleSix.frame.minX)...Int(circleSix.frame.maxX)
                let circleSixY = Int(circleSix.frame.minY)...Int(circleSix.frame.maxY)
                let circleSevenX = Int(circleSeven.frame.minX)...Int(circleSeven.frame.maxX)
                let circleSevenY = Int(circleSeven.frame.minY)...Int(circleSeven.frame.maxY)
                
                
                
                
        //        Теперь перетягивание первого кружочка на какой-то другой
                
                switch valueX{
                case _ where circleTwoX.contains(valueX) &&  circleTwoY.contains(valueY) && !circleTwo.isHidden:
                        circleThree.isHidden = true
                        circleTwo.changingColor()
                        circleTwo.changingSize()
                case _ where circleOneX.contains(valueX) && circleOneY.contains(valueY) && !circleOne.isHidden:
                        circleThree.isHidden = true
                        circleOne.changingColor()
                        circleOne.changingSize()
                case _ where circleFourX.contains(valueX) && circleFourY.contains(valueY) && !circleFour.isHidden:
                        circleThree.isHidden = true
                        circleFour.changingColor()
                        circleFour.changingSize()
                case _ where circleFiveX.contains(valueX) && circleFiveY.contains(valueY) && !circleFive.isHidden:
                        circleThree.isHidden = true
                        circleFive.changingColor()
                        circleFive.changingSize()
                case _ where circleSixX.contains(valueX) && circleSixY.contains(valueY) && !circleSix.isHidden:
                        circleThree.isHidden = true
                        circleSix.changingColor()
                        circleSix.changingSize()
                case _ where circleSevenX.contains(valueX) && circleSevenY.contains(valueY) && !circleSeven.isHidden:
                        circleThree.isHidden = true
                        circleSeven.changingColor()
                        circleSeven.changingSize()
                default: break
                
                }
        
        let gestureTranslation = sender.translation(in: view)
        guard let guesterView = sender.view else {return}
        
        guesterView.center = CGPoint(x: guesterView.center.x + gestureTranslation.x, y: guesterView.center.y + gestureTranslation.y)
        
        sender.setTranslation(.zero, in: view)
        
        guard sender.state == .ended else{return}
    }
    
    @IBAction func panActionFour(_ sender: UIPanGestureRecognizer) {
        
        //        Создадим переменные для координат центра четвертого кружочка
                
                let valueX = Int(circleFour.center.x)
                let valueY = Int(circleFour.center.y)

        //        Координаты всех кружков
                let circleOneX = Int(circleOne.frame.minX)...Int(circleOne.frame.maxX)
                let circleOneY = Int(circleOne.frame.minY)...Int(circleOne.frame.maxY)
                let circleTwoX = Int(circleTwo.frame.minX)...Int(circleTwo.frame.maxX)
                let circleTwoY = Int(circleTwo.frame.minY)...Int(circleTwo.frame.maxY)
                let circleThreeX = Int(circleThree.frame.minX)...Int(circleThree.frame.maxX)
                let circleThreeY = Int(circleThree.frame.minY)...Int(circleThree.frame.maxY)
                let circleFiveX = Int(circleFive.frame.minX)...Int(circleFive.frame.maxX)
                let circleFiveY = Int(circleFive.frame.minY)...Int(circleFive.frame.maxY)
                let circleSixX = Int(circleSix.frame.minX)...Int(circleSix.frame.maxX)
                let circleSixY = Int(circleSix.frame.minY)...Int(circleSix.frame.maxY)
                let circleSevenX = Int(circleSeven.frame.minX)...Int(circleSeven.frame.maxX)
                let circleSevenY = Int(circleSeven.frame.minY)...Int(circleSeven.frame.maxY)
                
                
                
                
        //        Теперь перетягивание первого кружочка на какой-то другой
                
                switch valueX{
                case _ where circleTwoX.contains(valueX) &&  circleTwoY.contains(valueY) && !circleTwo.isHidden:
                        circleFour.isHidden = true
                        circleTwo.changingColor()
                        circleTwo.changingSize()
                case _ where circleThreeX.contains(valueX) && circleThreeY.contains(valueY) && !circleThree.isHidden:
                        circleFour.isHidden = true
                        circleThree.changingColor()
                        circleThree.changingSize()
                case _ where circleOneX.contains(valueX) && circleOneY.contains(valueY) && !circleOne.isHidden:
                        circleFour.isHidden = true
                        circleOne.changingColor()
                        circleOne.changingSize()
                case _ where circleFiveX.contains(valueX) && circleFiveY.contains(valueY) && !circleFive.isHidden:
                        circleFour.isHidden = true
                        circleFive.changingColor()
                        circleFive.changingSize()
                case _ where circleSixX.contains(valueX) && circleSixY.contains(valueY) && !circleSix.isHidden:
                        circleFour.isHidden = true
                        circleSix.changingColor()
                        circleSix.changingSize()
                case _ where circleSevenX.contains(valueX) && circleSevenY.contains(valueY) && !circleSeven.isHidden:
                        circleFour.isHidden = true
                        circleSeven.changingColor()
                        circleSeven.changingSize()
                default: break
                
                }
        
        let gestureTranslation = sender.translation(in: view)
        guard let guesterView = sender.view else {return}
        
        guesterView.center = CGPoint(x: guesterView.center.x + gestureTranslation.x, y: guesterView.center.y + gestureTranslation.y)
        
        sender.setTranslation(.zero, in: view)
        
        guard sender.state == .ended else{return}
    }
    
    @IBAction func panActionFive(_ sender: UIPanGestureRecognizer) {
        
        //        Создадим переменные для координат центра пятого кружочка
                
                let valueX = Int(circleFive.center.x)
                let valueY = Int(circleFive.center.y)

        //        Координаты всех кружков
                let circleOneX = Int(circleOne.frame.minX)...Int(circleOne.frame.maxX)
                let circleOneY = Int(circleOne.frame.minY)...Int(circleOne.frame.maxY)
                let circleTwoX = Int(circleTwo.frame.minX)...Int(circleTwo.frame.maxX)
                let circleTwoY = Int(circleTwo.frame.minY)...Int(circleTwo.frame.maxY)
                let circleThreeX = Int(circleThree.frame.minX)...Int(circleThree.frame.maxX)
                let circleThreeY = Int(circleThree.frame.minY)...Int(circleThree.frame.maxY)
                let circleFourX = Int(circleFour.frame.minX)...Int(circleFour.frame.maxX)
                let circleFourY = Int(circleFour.frame.minY)...Int(circleFour.frame.maxY)
                let circleSixX = Int(circleSix.frame.minX)...Int(circleSix.frame.maxX)
                let circleSixY = Int(circleSix.frame.minY)...Int(circleSix.frame.maxY)
                let circleSevenX = Int(circleSeven.frame.minX)...Int(circleSeven.frame.maxX)
                let circleSevenY = Int(circleSeven.frame.minY)...Int(circleSeven.frame.maxY)
                
                
                
                
        //        Теперь перетягивание первого кружочка на какой-то другой
                
                switch valueX{
                case _ where circleTwoX.contains(valueX) &&  circleTwoY.contains(valueY) && !circleTwo.isHidden:
                        circleFive.isHidden = true
                        circleTwo.changingColor()
                        circleTwo.changingSize()
                case _ where circleThreeX.contains(valueX) && circleThreeY.contains(valueY) && !circleThree.isHidden:
                        circleFive.isHidden = true
                        circleThree.changingColor()
                        circleThree.changingSize()
                case _ where circleFourX.contains(valueX) && circleFourY.contains(valueY) && !circleFour.isHidden:
                        circleFive.isHidden = true
                        circleFour.changingColor()
                        circleFour.changingSize()
                case _ where circleOneX.contains(valueX) && circleOneY.contains(valueY) && !circleOne.isHidden:
                        circleFive.isHidden = true
                        circleOne.changingColor()
                        circleOne.changingSize()
                case _ where circleSixX.contains(valueX) && circleSixY.contains(valueY) && !circleSix.isHidden:
                        circleFive.isHidden = true
                        circleSix.changingColor()
                        circleSix.changingSize()
                case _ where circleSevenX.contains(valueX) && circleSevenY.contains(valueY) && !circleSeven.isHidden:
                        circleFive.isHidden = true
                        circleSeven.changingColor()
                        circleSeven.changingSize()
                default: break
                
                }
        
        let gestureTranslation = sender.translation(in: view)
        guard let guesterView = sender.view else {return}
        
        guesterView.center = CGPoint(x: guesterView.center.x + gestureTranslation.x, y: guesterView.center.y + gestureTranslation.y)
        
        sender.setTranslation(.zero, in: view)
        
        guard sender.state == .ended else{return}
    }
    
    
    @IBAction func panActionSix(_ sender: UIPanGestureRecognizer) {
        
        //        Создадим переменные для координат центра шестого кружочка
                
                let valueX = Int(circleSix.center.x)
                let valueY = Int(circleSix.center.y)

        //        Координаты всех кружков
                let circleOneX = Int(circleOne.frame.minX)...Int(circleOne.frame.maxX)
                let circleOneY = Int(circleOne.frame.minY)...Int(circleOne.frame.maxY)
                let circleTwoX = Int(circleTwo.frame.minX)...Int(circleTwo.frame.maxX)
                let circleTwoY = Int(circleTwo.frame.minY)...Int(circleTwo.frame.maxY)
                let circleThreeX = Int(circleThree.frame.minX)...Int(circleThree.frame.maxX)
                let circleThreeY = Int(circleThree.frame.minY)...Int(circleThree.frame.maxY)
                let circleFourX = Int(circleFour.frame.minX)...Int(circleFour.frame.maxX)
                let circleFourY = Int(circleFour.frame.minY)...Int(circleFour.frame.maxY)
                let circleFiveX = Int(circleFive.frame.minX)...Int(circleFive.frame.maxX)
                let circleFiveY = Int(circleFive.frame.minY)...Int(circleFive.frame.maxY)
                let circleSevenX = Int(circleSeven.frame.minX)...Int(circleSeven.frame.maxX)
                let circleSevenY = Int(circleSeven.frame.minY)...Int(circleSeven.frame.maxY)
                
                
                
                
        //        Теперь перетягивание первого кружочка на какой-то другой
                
                switch valueX{
                case _ where circleTwoX.contains(valueX) &&  circleTwoY.contains(valueY) && !circleTwo.isHidden:
                        circleSix.isHidden = true
                        circleTwo.changingColor()
                        circleTwo.changingSize()
                case _ where circleThreeX.contains(valueX) && circleThreeY.contains(valueY) && !circleThree.isHidden:
                        circleSix.isHidden = true
                        circleThree.changingColor()
                        circleThree.changingSize()
                case _ where circleFourX.contains(valueX) && circleFourY.contains(valueY) && !circleFour.isHidden:
                        circleSix.isHidden = true
                        circleFour.changingColor()
                        circleFour.changingSize()
                case _ where circleFiveX.contains(valueX) && circleFiveY.contains(valueY) && !circleFive.isHidden:
                        circleSix.isHidden = true
                        circleFive.changingColor()
                        circleFive.changingSize()
                case _ where circleOneX.contains(valueX) && circleOneY.contains(valueY) && !circleOne.isHidden:
                        circleSix.isHidden = true
                        circleOne.changingColor()
                        circleOne.changingSize()
                case _ where circleSevenX.contains(valueX) && circleSevenY.contains(valueY) && !circleSeven.isHidden:
                        circleSix.isHidden = true
                        circleSeven.changingColor()
                        circleSeven.changingSize()
                default: break
                
                }
        
        let gestureTranslation = sender.translation(in: view)
        guard let guesterView = sender.view else {return}
        
        guesterView.center = CGPoint(x: guesterView.center.x + gestureTranslation.x, y: guesterView.center.y + gestureTranslation.y)
        
        sender.setTranslation(.zero, in: view)
        
        guard sender.state == .ended else{return}
    }
    
    @IBAction func panActionSeven(_ sender: UIPanGestureRecognizer) {
        
        //        Создадим переменные для координат центра седьмого кружочка
                
                let valueX = Int(circleSeven.center.x)
                let valueY = Int(circleSeven.center.y)

        //        Координаты всех кружков
                let circleOneX = Int(circleOne.frame.minX)...Int(circleOne.frame.maxX)
                let circleOneY = Int(circleOne.frame.minY)...Int(circleOne.frame.maxY)
                let circleTwoX = Int(circleTwo.frame.minX)...Int(circleTwo.frame.maxX)
                let circleTwoY = Int(circleTwo.frame.minY)...Int(circleTwo.frame.maxY)
                let circleThreeX = Int(circleThree.frame.minX)...Int(circleThree.frame.maxX)
                let circleThreeY = Int(circleThree.frame.minY)...Int(circleThree.frame.maxY)
                let circleFourX = Int(circleFour.frame.minX)...Int(circleFour.frame.maxX)
                let circleFourY = Int(circleFour.frame.minY)...Int(circleFour.frame.maxY)
                let circleFiveX = Int(circleFive.frame.minX)...Int(circleFive.frame.maxX)
                let circleFiveY = Int(circleFive.frame.minY)...Int(circleFive.frame.maxY)
                let circleSixX = Int(circleSix.frame.minX)...Int(circleSix.frame.maxX)
                let circleSixY = Int(circleSix.frame.minY)...Int(circleSix.frame.maxY)
                
                
        //        Теперь перетягивание первого кружочка на какой-то другой
                
                switch valueX{
                case _ where circleTwoX.contains(valueX) &&  circleTwoY.contains(valueY) && !circleTwo.isHidden:
                        circleSeven.isHidden = true
                        circleTwo.changingColor()
                        circleTwo.changingSize()
                case _ where circleThreeX.contains(valueX) && circleThreeY.contains(valueY) && !circleThree.isHidden:
                        circleSeven.isHidden = true
                        circleThree.changingColor()
                        circleThree.changingSize()
                case _ where circleFourX.contains(valueX) && circleFourY.contains(valueY) && !circleFour.isHidden:
                        circleSeven.isHidden = true
                        circleFour.changingColor()
                        circleFour.changingSize()
                case _ where circleFiveX.contains(valueX) && circleFiveY.contains(valueY) && !circleFive.isHidden:
                        circleSeven.isHidden = true
                        circleFive.changingColor()
                        circleFive.changingSize()
                case _ where circleSixX.contains(valueX) && circleSixY.contains(valueY) && !circleSix.isHidden:
                        circleSeven.isHidden = true
                        circleSix.changingColor()
                        circleSix.changingSize()
                case _ where circleOneX.contains(valueX) && circleOneY.contains(valueY) && !circleOne.isHidden:
                        circleSeven.isHidden = true
                        circleOne.changingColor()
                        circleOne.changingSize()
                default: break
                
                }
        
        let gestureTranslation = sender.translation(in: view)
        guard let guesterView = sender.view else {return}
        
        guesterView.center = CGPoint(x: guesterView.center.x + gestureTranslation.x, y: guesterView.center.y + gestureTranslation.y)
        
        sender.setTranslation(.zero, in: view)
        
        guard sender.state == .ended else{return}
    }
    
}

