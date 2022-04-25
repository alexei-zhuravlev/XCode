//MARK: Попробую тут сделать обработку числа в набор слов.

import Foundation
import UIKit


//просто число, на примере которого буду проводить опыты
let testNumber = "78972734.23"

//для начала нужно разбить это число на две части (целую и ту, что идет после запятой)
let firstPart = testNumber.components(separatedBy: ".")[0]
let secondPart = testNumber.components(separatedBy: ".")[1]
let firstPartLength = firstPart.count
let secondPartLength = secondPart.count

//for i in 0..<firstPart.count{
//    let index = firstPart.index(firstPart.startIndex, offsetBy: i)
//    let letter = firstPart[index]
//    print(i,letter)
//}

func addition(position:Int) ->String{
    var additionText = ""
    switch position{
    case _ where [3,4,5].contains(position):
        additionText = "тысяч"
    case _ where [6,7,8].contains(position):
        additionText = "миллион"
    case _ where [9,10,11].contains(position):
        additionText = "миллиард"
    default:
        break
    }
    return additionText
}



//собственно перевод цифр в слова
func numberToWord(number:String) -> [String]{
//    куда записываем готовый текст (по падежам)
    var text = "У меня есть " // именительный падеж
    var textRod = "У него нет " //родительный падеж
    var textDat = "Я рад " //дательный падеж
    var textVin = "Я вижу " //винительный падеж
    var textTvo = "Я любуюсь "//творительный падеж
    var textPre = "Я думаю о "//предложный падеж
    
//    базовая компонента (корень) к которой добавляются падежные окончания
    var base = ""
    
//    добавление к десяткам "расширения" тысячь, миллионов, миллиардов
    
    func addDec(position:Int){
        switch position{
        case _ where [3,4,5].contains(position):
            text += addition(position: position) + "ь "
            textRod += addition(position: position) + "ь "
            textDat += addition(position: position) + "ам "
            textVin += addition(position: position) + "ь "
            textTvo += addition(position: position) + "ами "
            textPre += addition(position: position) + "ах "
        case _ where [6,7,8].contains(position):
            text += addition(position: position) + "ов "
            textRod += addition(position: position) + "ов "
            textDat += addition(position: position) + "ам "
            textVin += addition(position: position) + "ов "
            textTvo += addition(position: position) + "ами "
            textPre += addition(position: position) + "ах "
        case _ where [9,10,11].contains(position):
            text += addition(position: position) + "ов "
            textRod += addition(position: position) + "ов "
            textDat += addition(position: position) + "ам "
            textVin += addition(position: position) + "ов "
            textTvo += addition(position: position) + "ами "
            textPre += addition(position: position) + "ах "
        default: break
        }
    }
    
    
    let numberLenght = number.count
    for i in 0..<numberLenght{
        let index = number.index(number.startIndex, offsetBy: i)
        var previouseLetter:Character = "X"
        if i > 0{
            let previouseIndex = number.index(number.startIndex, offsetBy: i-1)
            previouseLetter = number[previouseIndex]
        }
        var nextLetter:Character = "X"
        if i < (numberLenght - 1){
            let nextIndex = number.index(number.startIndex, offsetBy: i+1)
            nextLetter = number[nextIndex]
        }
            
        let letter = number[index]
        let position = numberLenght-(i+1)
        switch letter{
//            разбираемся с сотнями
            case "1" where [2, 5, 8, 11].contains(position):
                base = "cт"
                text += (base + "о ")
                textRod += (base + "a ")
                textDat += (base + "a ")
                textVin += (base + "о ")
                textTvo += (base + "а ")
                textPre += (base + "а ")
            case "2" where [2, 5, 8, 11].contains(position):
                base = "дв"
                text += (base + "ести ")
                textRod += (base + "ухсот ")
                textDat += (base + "умстам ")
                textVin += (base + "ести ")
                textTvo += (base + "умястами ")
                textPre += (base + "ухстах ")
            case "3" where [2, 5, 8, 11].contains(position):
                base = "тр"
                text += (base + "иста ")
                textRod += (base + "ёхсот ")
                textDat += (base + "ёмстам ")
                textVin += (base + "иста ")
                textTvo += (base + "емястами ")
                textPre += (base + "ёхстах ")
            case "4" where [2, 5, 8, 11].contains(position):
                base = "четыр"
                text += (base + "еста ")
                textRod += (base + "ёхсот ")
                textDat += (base + "ёмстам ")
                textVin += (base + "еста ")
                textTvo += (base + "ьмястами ")
                textPre += (base + "ёхстах ")
            case "5" where [2, 5, 8, 11].contains(position):
                base = "пят"
                text += (base + "ьсот ")
                textRod += (base + "исот ")
                textDat += (base + "истам ")
                textVin += (base + "ьсот ")
                textTvo += (base + "ьюстами ")
                textPre += (base + "истах ")
            case "6" where [2, 5, 8, 11].contains(position):
                base = "шест"
                text += (base + "ьсот ")
                textRod += (base + "исот ")
                textDat += (base + "истам ")
                textVin += (base + "ьсот ")
                textTvo += (base + "ьюстами ")
                textPre += (base + "истах ")
            case "7" where [2, 5, 8, 11].contains(position):
                base = "сем"
                text += (base + "ьсот ")
                textRod += (base + "исот ")
                textDat += (base + "истам ")
                textVin += (base + "ьсот ")
                textTvo += (base + "ьюстами ")
                textPre += (base + "истах ")
            case "8" where [2, 5, 8, 11].contains(position):
                base = "восем"
                text += (base + "ьсот ")
                textRod += ("восьм" + "исот ")
                textDat += ("восьм" + "истам ")
                textVin += (base + "ьсот ")
                textTvo += (base + "ьюстами ")
                textPre += ("восьм" + "истах ")
            case "9" where [2, 5, 8, 11].contains(position):
                base = "девят"
                text += (base + "ьсот ")
                textRod += (base + "исот ")
                textDat += (base + "истам ")
                textVin += (base + "ьсот ")
                textTvo += (base + "ьюстами ")
                textPre += (base + "истах ")
//            разбираемся с десятками
//            MARK: нужно доделать десятки тысяч, десятки миллионов и т.д.
        case "9" where [1, 4, 7, 10].contains(position) :
            base = "девяност"
            text += (base + "о ")
            textRod += (base + "а ")
            textDat += (base + "а ")
            textVin += (base + "о ")
            textTvo += (base + "а ")
            textPre += (base + "а ")
            
            if nextLetter == "0" {
                addDec(position: position)
//                switch position{
//                case _ where [3,4,5].contains(position):
//                    text += addition(position: position) + "ь "
//                    textRod += addition(position: position) + "ь "
//                    textDat += addition(position: position) + "ам "
//                    textVin += addition(position: position) + "ь "
//                    textTvo += addition(position: position) + "ами "
//                    textPre += addition(position: position) + "ах "
//                case _ where [6,7,8].contains(position):
//                    text += addition(position: position) + "ов "
//                    textRod += addition(position: position) + "ов "
//                    textDat += addition(position: position) + "ам "
//                    textVin += addition(position: position) + "ов "
//                    textTvo += addition(position: position) + "ами "
//                    textPre += addition(position: position) + "ах "
//                case _ where [9,10,11].contains(position):
//                    text += addition(position: position) + "ов "
//                    textRod += addition(position: position) + "ов "
//                    textDat += addition(position: position) + "ам "
//                    textVin += addition(position: position) + "ов "
//                    textTvo += addition(position: position) + "ами "
//                    textPre += addition(position: position) + "ах "
//                default: break
//                }
            }
        case "8" where [1, 4, 7, 10].contains(position) :
            let baseTwo = "десят"
            base = "вос"
            text += (base + "емь" + baseTwo + " ")
            textRod += (base + "ьми" + baseTwo + "и " )
            textDat += (base + "ьми" + baseTwo + "и " )
            textVin += (base + "емь" + baseTwo + " ")
            textTvo += (base + "емью" + baseTwo + "ью ")
            textPre += (base + "ьми" + baseTwo + "и " )
            if nextLetter == "0" {
                text += addition(position: position)
                text += " "
            }
        case "7" where [1, 4, 7, 10].contains(position) :
            let baseTwo = "десят"
            base = "сем"
            text += (base + "ь" + baseTwo + " ")
            textRod += (base + "и" + baseTwo + "и " )
            textDat += (base + "и" + baseTwo + "и " )
            textVin += (base + "ь" + baseTwo + " ")
            textTvo += (base + "ью" + baseTwo + "ью ")
            textPre += (base + "и" + baseTwo + "и " )
            if nextLetter == "0" {
                addDec(position: position)
//                text += addition(position: position)
//                text += " "
            }
        case "6" where [1, 4, 7, 10].contains(position) :
            let baseTwo = "десят"
            base = "шест"
            text += (base + "ь" + baseTwo + " ")
            textRod += (base + "и" + baseTwo + "и " )
            textDat += (base + "и" + baseTwo + "и " )
            textVin += (base + "ь" + baseTwo + " ")
            textTvo += (base + "ью" + baseTwo + "ью ")
            textPre += (base + "и" + baseTwo + "и " )
            if nextLetter == "0" {
                addDec(position: position)
//                text += addition(position: position)
//                text += " "
            }
        case "5" where [1, 4, 7, 10].contains(position) :
            let baseTwo = "десят"
            base = "пят"
            text += (base + "ь" + baseTwo + " ")
            textRod += (base + "и" + baseTwo + "и " )
            textDat += (base + "и" + baseTwo + "и " )
            textVin += (base + "ь" + baseTwo + " ")
            textTvo += (base + "ью" + baseTwo + "ью ")
            textPre += (base + "и" + baseTwo + "и " )
            if nextLetter == "0" {
                addDec(position: position)
//                text += addition(position: position)
//                text += " "
            }
        case "4" where [1, 4, 7, 10].contains(position) :
            base = "сорок"
            text += (base + " ")
            textRod += (base + "а ")
            textDat += (base + "а ")
            textVin += (base + " ")
            textTvo += (base + "а ")
            textPre += (base + "а ")
            if nextLetter == "0" {
                addDec(position: position)
//                text += addition(position: position)
//                text += " "
            }
        case "3" where [1, 4, 7, 10].contains(position) :
            base = "тридцат"
            text += (base + "ь ")
            textRod += (base + "и ")
            textDat += (base + "и ")
            textVin += (base + "ь ")
            textTvo += (base + "ью ")
            textPre += (base + "и ")
            if nextLetter == "0" {
                addDec(position: position)
//                text += addition(position: position)
//                text += " "
            }
        case "2" where [1, 4, 7, 10].contains(position) :
            base = "двадцат"
            text += (base + "ь ")
            textRod += (base + "и ")
            textDat += (base + "и ")
            textVin += (base + "ь ")
            textTvo += (base + "ью ")
            textPre += (base + "и ")
            if nextLetter == "0" {
                addDec(position: position)
//                text += addition(position: position)
//                text += " "
            }
//            разбираемся с "дцать"
        case "1" where [1, 4, 7, 10].contains(position) :
            switch nextLetter{
            case "0":
                switch position{
                case 1:
                    base = "десят"
                    text += (base + "ь ")
                    textRod += (base + "и ")
                    textDat += (base + "и ")
                    textVin += (base + "ь ")
                    textTvo += (base + "ью ")
                    textPre += (base + "и ")
                    break
                case 4:
                    base = "десят"
                    let baseAdd = "тысяч"
                    text += (base + "ь " + baseAdd + " ")
                    textRod += (base + "и " + baseAdd + " ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + " ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                case 7:
                    base = "десят"
                    let baseAdd = "миллион"
                    text += (base + "ь " + baseAdd + "ов ")
                    textRod += (base + "и " + baseAdd + "ов ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + "ов ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                case 10:
                    base = "десят"
                    let baseAdd = "миллиард"
                    text += (base + "ь " + baseAdd + "ов ")
                    textRod += (base + "и " + baseAdd + "ов ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + "ов ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                default:
                    break
                }
            case "1":
                switch position{
                case 1:
                    base = "одннадцат"
                    text += (base + "ь ")
                    textRod += (base + "и ")
                    textDat += (base + "и ")
                    textVin += (base + "ь ")
                    textTvo += (base + "ью ")
                    textPre += (base + "и ")
                    break
                case 4:
                    base = "одннадцат"
                    let baseAdd = "тысяч"
                    text += (base + "ь " + baseAdd + " ")
                    textRod += (base + "и " + baseAdd + " ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + " ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                case 7:
                    base = "одннадцат"
                    let baseAdd = "миллион"
                    text += (base + "ь " + baseAdd + "ов ")
                    textRod += (base + "и " + baseAdd + "ов ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + "ов ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                case 10:
                    base = "одннадцат"
                    let baseAdd = "миллиард"
                    text += (base + "ь " + baseAdd + "ов ")
                    textRod += (base + "и " + baseAdd + "ов ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + "ов ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                default:
                    break
                }
            case "2":
                switch position{
                case 1:
                    base = "двенадцат"
                    text += (base + "ь ")
                    textRod += (base + "и ")
                    textDat += (base + "и ")
                    textVin += (base + "ь ")
                    textTvo += (base + "ью ")
                    textPre += (base + "и ")
                    break
                case 4:
                    base = "двенадцат"
                    let baseAdd = "тысяч"
                    text += (base + "ь " + baseAdd + " ")
                    textRod += (base + "и " + baseAdd + " ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + " ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                case 7:
                    base = "двенадцат"
                    let baseAdd = "миллион"
                    text += (base + "ь " + baseAdd + "ов ")
                    textRod += (base + "и " + baseAdd + "ов ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + "ов ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                case 10:
                    base = "двенадцат"
                    let baseAdd = "миллиард"
                    text += (base + "ь " + baseAdd + "ов ")
                    textRod += (base + "и " + baseAdd + "ов ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + "ов ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                default:
                    break
                }
            case "3":
                switch position{
                case 1:
                    base = "тринадцат"
                    text += (base + "ь ")
                    textRod += (base + "и ")
                    textDat += (base + "и ")
                    textVin += (base + "ь ")
                    textTvo += (base + "ью ")
                    textPre += (base + "и ")
                    break
                case 4:
                    base = "тринадцат"
                    let baseAdd = "тысяч"
                    text += (base + "ь " + baseAdd + " ")
                    textRod += (base + "и " + baseAdd + " ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + " ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                case 7:
                    base = "тринадцат"
                    let baseAdd = "миллион"
                    text += (base + "ь " + baseAdd + "ов ")
                    textRod += (base + "и " + baseAdd + "ов ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + "ов ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                case 10:
                    base = "тринадцат"
                    let baseAdd = "миллиард"
                    text += (base + "ь " + baseAdd + "ов ")
                    textRod += (base + "и " + baseAdd + "ов ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + "ов ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                default:
                    break
                }
            case "4":
                switch position{
                case 1:
                    base = "четырнадцат"
                    text += (base + "ь ")
                    textRod += (base + "и ")
                    textDat += (base + "и ")
                    textVin += (base + "ь ")
                    textTvo += (base + "ью ")
                    textPre += (base + "и ")
                    break
                case 4:
                    base = "четырнадцат"
                    let baseAdd = "тысяч"
                    text += (base + "ь " + baseAdd + " ")
                    textRod += (base + "и " + baseAdd + " ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + " ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                case 7:
                    base = "четырнадцат"
                    let baseAdd = "миллион"
                    text += (base + "ь " + baseAdd + "ов ")
                    textRod += (base + "и " + baseAdd + "ов ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + "ов ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                case 10:
                    base = "четырнадцат"
                    let baseAdd = "миллиард"
                    text += (base + "ь " + baseAdd + "ов ")
                    textRod += (base + "и " + baseAdd + "ов ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + "ов ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                default:
                    break
                }
            case "5":
                switch position{
                case 1:
                    base = "пятнадцат"
                    text += (base + "ь ")
                    textRod += (base + "и ")
                    textDat += (base + "и ")
                    textVin += (base + "ь ")
                    textTvo += (base + "ью ")
                    textPre += (base + "и ")
                    break
                case 4:
                    base = "пятнадцат"
                    let baseAdd = "тысяч"
                    text += (base + "ь " + baseAdd + " ")
                    textRod += (base + "и " + baseAdd + " ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + " ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                case 7:
                    base = "пятнадцат"
                    let baseAdd = "миллион"
                    text += (base + "ь " + baseAdd + "ов ")
                    textRod += (base + "и " + baseAdd + "ов ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + "ов ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                case 10:
                    base = "пятнадцат"
                    let baseAdd = "миллиард"
                    text += (base + "ь " + baseAdd + "ов ")
                    textRod += (base + "и " + baseAdd + "ов ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + "ов ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                default:
                    break
                }
            case "6":
                switch position{
                case 1:
                    base = "шестнадцат"
                    text += (base + "ь ")
                    textRod += (base + "и ")
                    textDat += (base + "и ")
                    textVin += (base + "ь ")
                    textTvo += (base + "ью ")
                    textPre += (base + "и ")
                    break
                case 4:
                    base = "шестнадцат"
                    let baseAdd = "тысяч"
                    text += (base + "ь " + baseAdd + " ")
                    textRod += (base + "и " + baseAdd + " ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + " ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                case 7:
                    base = "шестнадцат"
                    let baseAdd = "миллион"
                    text += (base + "ь " + baseAdd + "ов ")
                    textRod += (base + "и " + baseAdd + "ов ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + "ов ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                case 10:
                    base = "шестнадцат"
                    let baseAdd = "миллиард"
                    text += (base + "ь " + baseAdd + "ов ")
                    textRod += (base + "и " + baseAdd + "ов ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + "ов ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                default:
                    break
                }
            case "7":
                switch position{
                case 1:
                    base = "семнадцат"
                    text += (base + "ь ")
                    textRod += (base + "и ")
                    textDat += (base + "и ")
                    textVin += (base + "ь ")
                    textTvo += (base + "ью ")
                    textPre += (base + "и ")
                    break
                case 4:
                    base = "семнадцат"
                    let baseAdd = "тысяч"
                    text += (base + "ь " + baseAdd + " ")
                    textRod += (base + "и " + baseAdd + " ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + " ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                case 7:
                    base = "семнадцат"
                    let baseAdd = "миллион"
                    text += (base + "ь " + baseAdd + "ов ")
                    textRod += (base + "и " + baseAdd + "ов ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + "ов ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                case 10:
                    base = "семнадцат"
                    let baseAdd = "миллиард"
                    text += (base + "ь " + baseAdd + "ов ")
                    textRod += (base + "и " + baseAdd + "ов ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + "ов ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                default:
                    break
                }
            case "8":
                switch position{
                case 1:
                    base = "восемнадцат"
                    text += (base + "ь ")
                    textRod += (base + "и ")
                    textDat += (base + "и ")
                    textVin += (base + "ь ")
                    textTvo += (base + "ью ")
                    textPre += (base + "и ")
                    break
                case 4:
                    base = "восемнадцат"
                    let baseAdd = "тысяч"
                    text += (base + "ь " + baseAdd + " ")
                    textRod += (base + "и " + baseAdd + " ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + " ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                case 7:
                    base = "восемнадцат"
                    let baseAdd = "миллион"
                    text += (base + "ь " + baseAdd + "ов ")
                    textRod += (base + "и " + baseAdd + "ов ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + "ов ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                case 10:
                    base = "восемнадцат"
                    let baseAdd = "миллиард"
                    text += (base + "ь " + baseAdd + "ов ")
                    textRod += (base + "и " + baseAdd + "ов ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + "ов ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                default:
                    break
                }
            case "9":
                switch position{
                case 1:
                    base = "девятнадцат"
                    text += (base + "ь ")
                    textRod += (base + "и ")
                    textDat += (base + "и ")
                    textVin += (base + "ь ")
                    textTvo += (base + "ью ")
                    textPre += (base + "и ")
                    break
                case 4:
                    base = "девятнадцат"
                    let baseAdd = "тысяч"
                    text += (base + "ь " + baseAdd + " ")
                    textRod += (base + "и " + baseAdd + " ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + " ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                case 7:
                    base = "девятнадцат"
                    let baseAdd = "миллион"
                    text += (base + "ь " + baseAdd + "ов ")
                    textRod += (base + "и " + baseAdd + "ов ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + "ов ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                case 10:
                    base = "девятнадцат"
                    let baseAdd = "миллиард"
                    text += (base + "ь " + baseAdd + "ов ")
                    textRod += (base + "и " + baseAdd + "ов ")
                    textDat += (base + "и " + baseAdd + "ам ")
                    textVin += (base + "ь " + baseAdd + "ов ")
                    textTvo += (base + "ью " + baseAdd + "ами ")
                    textPre += (base + "и " + baseAdd + "ах ")
                    break
                default:
                    break
                }
            default:
                break
            }
//            разберемся с единицами
        case "1" where [0,3,6,9].contains(position):
            switch position{
            case 0:
                base = "од"
                text += (base + "ин ")
                textRod += (base + "ного ")
                textDat += (base + "ному ")
                textVin += (base + "ин ")
                textTvo += (base + "ним ")
                textPre += (base + "ном ")
            case 3:
                base = "од"
                let baseAdd = "тысяч"
                text += (base + "на " + baseAdd + "а ")
                textRod += (base + "ной " + baseAdd + "и ")
                textDat += (base + "ной " + baseAdd + "е ")
                textVin += (base + "ну " + baseAdd + "у ")
                textTvo += (base + "ной " + baseAdd + "ей ")
                textPre += (base + "ной " + baseAdd + "е ")
            case 6:
                base = "од"
                let baseAdd = "миллион"
                text += (base + "ин " + baseAdd + " ")
                textRod += (base + "ного " + baseAdd + "а ")
                textDat += (base + "ному " + baseAdd + "у ")
                textVin += (base + "ин " + baseAdd + " ")
                textTvo += (base + "ним " + baseAdd + "ом ")
                textPre += (base + "ном " + baseAdd + "е ")
            case 9:
                base = "од"
                let baseAdd = "миллиард"
                text += (base + "ин " + baseAdd + " ")
                textRod += (base + "ного " + baseAdd + "а ")
                textDat += (base + "ному " + baseAdd + "у ")
                textVin += (base + "ин " + baseAdd + " ")
                textTvo += (base + "ним " + baseAdd + "ом ")
                textPre += (base + "ном " + baseAdd + "е ")
            default:
                break
            }
        case "2" where [0,3,6,9].contains(position):
            switch position{
            case 0:
                base = "дв"
                text += (base + "а ")
                textRod += (base + "ух ")
                textDat += (base + "ум ")
                textVin += (base + "а ")
                textTvo += (base + "умя ")
                textPre += (base + "ух ")
            case 3:
                base = "дв"
                let baseAdd = "тысяч"
                text += (base + "е " + baseAdd + "и ")
                textRod += (base + "ух " + baseAdd + " ")
                textDat += (base + "ум " + baseAdd + "ам ")
                textVin += (base + "е " + baseAdd + "и ")
                textTvo += (base + "умя " + baseAdd + "ами ")
                textPre += (base + "ух " + baseAdd + "ах ")
            case 6:
                base = "дв"
                let baseAdd = "миллион"
                text += (base + "а " + baseAdd + "а ")
                textRod += (base + "ух " + baseAdd + "ов ")
                textDat += (base + "ум " + baseAdd + "ам ")
                textVin += (base + "а " + baseAdd + "а ")
                textTvo += (base + "умя " + baseAdd + "ами ")
                textPre += (base + "ух " + baseAdd + "ах ")
            case 9:
                base = "дв"
                let baseAdd = "миллиард"
                text += (base + "а " + baseAdd + "а ")
                textRod += (base + "ух " + baseAdd + "ов ")
                textDat += (base + "ум " + baseAdd + "ам ")
                textVin += (base + "а " + baseAdd + "а ")
                textTvo += (base + "умя " + baseAdd + "ами ")
                textPre += (base + "ух " + baseAdd + "ах ")
            default:
                break
            }
        case "3" where [0,3,6,9].contains(position):
            switch position{
            case 0:
                base = "тр"
                text += (base + "и ")
                textRod += (base + "ёх ")
                textDat += (base + "ем ")
                textVin += (base + "и ")
                textTvo += (base + "емя ")
                textPre += (base + "ёх ")
            case 3:
                base = "тр"
                let baseAdd = "тысяч"
                text += (base + "и " + baseAdd + "и ")
                textRod += (base + "ёх " + baseAdd + " ")
                textDat += (base + "ём " + baseAdd + "ам ")
                textVin += (base + "и " + baseAdd + "и ")
                textTvo += (base + "емя " + baseAdd + "ами ")
                textPre += (base + "ёх " + baseAdd + "ах ")
            case 6:
                base = "тр"
                let baseAdd = "миллион"
                text += (base + "и " + baseAdd + "а ")
                textRod += (base + "ёх " + baseAdd + "ов ")
                textDat += (base + "ём " + baseAdd + "ам ")
                textVin += (base + "и " + baseAdd + "а ")
                textTvo += (base + "емя " + baseAdd + "ами ")
                textPre += (base + "ёх " + baseAdd + "ах ")
            case 9:
                base = "тр"
                let baseAdd = "миллиард"
                text += (base + "и " + baseAdd + "а ")
                textRod += (base + "ёх " + baseAdd + "ов ")
                textDat += (base + "ём " + baseAdd + "ам ")
                textVin += (base + "и " + baseAdd + "а ")
                textTvo += (base + "емя " + baseAdd + "ами ")
                textPre += (base + "ёх " + baseAdd + "ах ")
            default:
                break
            }
        case "4" where [0,3,6,9].contains(position):
            switch position{
            case 0:
                base = "четыр"
                text += (base + "е ")
                textRod += (base + "ёх ")
                textDat += (base + "ем ")
                textVin += (base + "е ")
                textTvo += (base + "ьмя ")
                textPre += (base + "ёх ")
            case 3:
                base = "четыр"
                let baseAdd = "тысяч"
                text += (base + "е " + baseAdd + "и ")
                textRod += (base + "ёх " + baseAdd + " ")
                textDat += (base + "ём " + baseAdd + "ам ")
                textVin += (base + "е " + baseAdd + "и ")
                textTvo += (base + "ьмя " + baseAdd + "ами ")
                textPre += (base + "ёх " + baseAdd + "ах ")
            case 6:
                base = "четыр"
                let baseAdd = "миллион"
                text += (base + "е " + baseAdd + "а ")
                textRod += (base + "ёх " + baseAdd + "ов ")
                textDat += (base + "ём " + baseAdd + "ам ")
                textVin += (base + "е " + baseAdd + "а ")
                textTvo += (base + "ьмя " + baseAdd + "ами ")
                textPre += (base + "ёх " + baseAdd + "ах ")
            case 9:
                base = "четыр"
                let baseAdd = "миллиард"
                text += (base + "е " + baseAdd + "а ")
                textRod += (base + "ёх " + baseAdd + "ов ")
                textDat += (base + "ём " + baseAdd + "ам ")
                textVin += (base + "е " + baseAdd + "а ")
                textTvo += (base + "ьмя " + baseAdd + "ами ")
                textPre += (base + "ёх " + baseAdd + "ах ")
            default:
                break
            }
        case "5" where [0,3,6,9].contains(position):
            switch position{
            case 0:
                base = "пят"
                text += (base + "ь ")
                textRod += (base + "и ")
                textDat += (base + "и ")
                textVin += (base + "ь ")
                textTvo += (base + "ью ")
                textPre += (base + "и ")
            case 3:
                base = "пят"
                let baseAdd = "тысяч"
                text += (base + "ь " + baseAdd + " ")
                textRod += (base + "и " + baseAdd + " ")
                textDat += (base + "и " + baseAdd + "ам ")
                textVin += (base + "ь " + baseAdd + " ")
                textTvo += (base + "ью " + baseAdd + "ами ")
                textPre += (base + "и " + baseAdd + "ах ")
            case 6:
                base = "пят"
                let baseAdd = "миллион"
                text += (base + "ь " + baseAdd + "ов ")
                textRod += (base + "и " + baseAdd + "ов ")
                textDat += (base + "и " + baseAdd + "ам ")
                textVin += (base + "ь " + baseAdd + "ов ")
                textTvo += (base + "ью " + baseAdd + "ами ")
                textPre += (base + "и " + baseAdd + "ах ")
            case 9:
                base = "пят"
                let baseAdd = "миллиард"
                text += (base + "ь " + baseAdd + "ов ")
                textRod += (base + "и " + baseAdd + "ов ")
                textDat += (base + "и " + baseAdd + "ам ")
                textVin += (base + "ь " + baseAdd + "ов ")
                textTvo += (base + "ью " + baseAdd + "ами ")
                textPre += (base + "и " + baseAdd + "ах ")
            default:
                break
            }
        case "6" where [0,3,6,9].contains(position):
            switch position{
            case 0:
                base = "шест"
                text += (base + "ь ")
                textRod += (base + "и ")
                textDat += (base + "и ")
                textVin += (base + "ь ")
                textTvo += (base + "ью ")
                textPre += (base + "и ")
            case 3:
                base = "шест"
                let baseAdd = "тысяч"
                text += (base + "ь " + baseAdd + " ")
                textRod += (base + "и " + baseAdd + " ")
                textDat += (base + "и " + baseAdd + "ам ")
                textVin += (base + "ь " + baseAdd + " ")
                textTvo += (base + "ью " + baseAdd + "ами ")
                textPre += (base + "и " + baseAdd + "ах ")
            case 6:
                base = "шест"
                let baseAdd = "миллион"
                text += (base + "ь " + baseAdd + "ов ")
                textRod += (base + "и " + baseAdd + "ов ")
                textDat += (base + "и " + baseAdd + "ам ")
                textVin += (base + "ь " + baseAdd + "ов ")
                textTvo += (base + "ью " + baseAdd + "ами ")
                textPre += (base + "и " + baseAdd + "ах ")
            case 9:
                base = "шест"
                let baseAdd = "миллиард"
                text += (base + "ь " + baseAdd + "ов ")
                textRod += (base + "и " + baseAdd + "ов ")
                textDat += (base + "и " + baseAdd + "ам ")
                textVin += (base + "ь " + baseAdd + "ов ")
                textTvo += (base + "ью " + baseAdd + "ами ")
                textPre += (base + "и " + baseAdd + "ах ")
            default:
                break
            }
        case "7" where [0,3,6,9].contains(position):
            switch position{
            case 0:
                base = "сем"
                text += (base + "ь ")
                textRod += (base + "и ")
                textDat += (base + "и ")
                textVin += (base + "ь ")
                textTvo += (base + "ью ")
                textPre += (base + "и ")
            case 3:
                base = "сем"
                let baseAdd = "тысяч"
                text += (base + "ь " + baseAdd + " ")
                textRod += (base + "и " + baseAdd + " ")
                textDat += (base + "и " + baseAdd + "ам ")
                textVin += (base + "ь " + baseAdd + " ")
                textTvo += (base + "ью " + baseAdd + "ами ")
                textPre += (base + "и " + baseAdd + "ах ")
            case 6:
                base = "сем"
                let baseAdd = "миллион"
                text += (base + "ь " + baseAdd + "ов ")
                textRod += (base + "и " + baseAdd + "ов ")
                textDat += (base + "и " + baseAdd + "ам ")
                textVin += (base + "ь " + baseAdd + "ов ")
                textTvo += (base + "ью " + baseAdd + "ами ")
                textPre += (base + "и " + baseAdd + "ах ")
            case 9:
                base = "сем"
                let baseAdd = "миллиард"
                text += (base + "ь " + baseAdd + "ов ")
                textRod += (base + "и " + baseAdd + "ов ")
                textDat += (base + "и " + baseAdd + "ам ")
                textVin += (base + "ь " + baseAdd + "ов ")
                textTvo += (base + "ью " + baseAdd + "ами ")
                textPre += (base + "и " + baseAdd + "ах ")
            default:
                break
            }
        case "8" where [0,3,6,9].contains(position):
            switch position{
            case 0:
                base = "вос"
                text += (base + "емь ")
                textRod += (base + "ьми ")
                textDat += (base + "ьми ")
                textVin += (base + "емь ")
                textTvo += (base + "емью ")
                textPre += (base + "ьми ")
            case 3:
                base = "вос"
                let baseAdd = "тысяч"
                text += (base + "емь " + baseAdd + " ")
                textRod += (base + "ьми " + baseAdd + " ")
                textDat += (base + "ьми " + baseAdd + "ам ")
                textVin += (base + "емь " + baseAdd + " ")
                textTvo += (base + "емью " + baseAdd + "ами ")
                textPre += (base + "ьми " + baseAdd + "ах ")
            case 6:
                base = "вос"
                let baseAdd = "миллион"
                text += (base + "емь " + baseAdd + "ов ")
                textRod += (base + "ьми " + baseAdd + "ов ")
                textDat += (base + "ьми " + baseAdd + "ам ")
                textVin += (base + "емь " + baseAdd + "ов ")
                textTvo += (base + "емью " + baseAdd + "ами ")
                textPre += (base + "ьми " + baseAdd + "ах ")
            case 9:
                base = "вос"
                let baseAdd = "миллиард"
                text += (base + "емь " + baseAdd + "ов ")
                textRod += (base + "ьми " + baseAdd + "ов ")
                textDat += (base + "ьми " + baseAdd + "ам ")
                textVin += (base + "емь " + baseAdd + "ов ")
                textTvo += (base + "емью " + baseAdd + "ами ")
                textPre += (base + "ьми " + baseAdd + "ах ")
            default:
                break
            }
        case "9" where [0,3,6,9].contains(position):
            switch position{
            case 0:
                base = "девят"
                text += (base + "ь ")
                textRod += (base + "и ")
                textDat += (base + "и ")
                textVin += (base + "ь ")
                textTvo += (base + "ью ")
                textPre += (base + "и ")
            case 3:
                base = "девят"
                let baseAdd = "тысяч"
                text += (base + "ь " + baseAdd + " ")
                textRod += (base + "и " + baseAdd + " ")
                textDat += (base + "и " + baseAdd + "ам ")
                textVin += (base + "ь " + baseAdd + " ")
                textTvo += (base + "ью " + baseAdd + "ами ")
                textPre += (base + "и " + baseAdd + "ах ")
            case 6:
                base = "девят"
                let baseAdd = "миллион"
                text += (base + "ь " + baseAdd + "ов ")
                textRod += (base + "и " + baseAdd + "ов ")
                textDat += (base + "и " + baseAdd + "ам ")
                textVin += (base + "ь " + baseAdd + "ов ")
                textTvo += (base + "ью " + baseAdd + "ами ")
                textPre += (base + "и " + baseAdd + "ах ")
            case 9:
                base = "девят"
                let baseAdd = "миллиард"
                text += (base + "ь " + baseAdd + "ов ")
                textRod += (base + "и " + baseAdd + "ов ")
                textDat += (base + "и " + baseAdd + "ам ")
                textVin += (base + "ь " + baseAdd + "ов ")
                textTvo += (base + "ью " + baseAdd + "ами ")
                textPre += (base + "и " + baseAdd + "ах ")
            default:
                break
            }
        default:
            break
        }
    }
    
    let finalText = [text, textRod, textDat, textVin, textTvo, textPre ]
    
    return finalText
}
