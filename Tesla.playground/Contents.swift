import UIKit

//Итоговый проект модуля 9 (условия и циклы)

//Переменная, которая хранит в себе режим управления: ручной или автопилот. Если включен режим ручного управления, то будем считать, что автопилот отключен.
var isAutopilot:Bool = false

//Должно быть реализовано хранение каких-либо характеристик автомобиля
//характеристики автомобиля - константы (то есть изменение веса или длинны машины - серьезное вмешательство в конструкцию, поэтому let, а не var
let weight = 2108 // масса автомобиля в килограммах
let lenght = 4976 //длина автомобиля в милимметрах
let width = 1963 //ширина с учетом боковых зеркал (в миллиметрах)
let high = 1435 //высота автомобиля в миллиметрах
let wheelbase = 2959 //ширина колесной базы в миллиметрах
let clearance = 154.9//клиренс в миллиметрах
let trunkVolume = 900//объем багажника в литрах

//Должно быть реализовано хранение функционала машины
var musicPlayer:Bool = false//управлеение музыкой или вкл. или нет
var sunroof:Int = 0 //степень открытия люка в процентах 0 - закрыт, 100 - открыт
var blowerFan:Int = 0//скорость работы вентилятора обдува (обороты в минуту)
var driverComfort:Int = 20 //температура воздуха на водителя в градусах С
var driverSeatHeatting:Int = 0//степень обогрева водительского сидения в условных единицах
var batteryLevel:Int = 100//уровень заряда батареи в процентах
var isGPS:Bool = false //показывает включен ли GPS
var isMap:Bool = false//показывает включена ли карта
var nearestStation = false //показывает ближайшую станцию подзарядки

//Должна быть реализована система обработки ошибок
enum AutoError: Error {
    case isLost // заблудился
    case lowBattery // низкая батарея
    case brokeAutoDrive // проблемы с управлением машины
    case stopEngine //двигатель выключен (проверка люка)
    case trunkIsOpen//открыт багажник
}
 
var isLost: Bool = false
var lowBattery: Bool = false
var brokeAutoDrive: Bool = false
var stopEngine:Bool = false
var trunkIsOpen:Bool = false
 
do {
    if isLost {
        throw AutoError.isLost
    }
 
    if lowBattery {
        throw AutoError.lowBattery
    }
 
    if brokeAutoDrive {
        throw AutoError.brokeAutoDrive
    }
    
    if stopEngine {
        throw AutoError.stopEngine
    }
    
    if trunkIsOpen {
        throw AutoError.trunkIsOpen
    }
    
} catch AutoError.isLost {
    print("Вы заблудились! Включаю GPS")
    isGPS = true //включили GPS
    
} catch AutoError.lowBattery {
    print("Батарея садится! Ближайшая станция подзарядки через 1 км 300 м")
    isMap = true
    nearestStation = true
    
} catch AutoError.brokeAutoDrive {
    print("Режим автопилота поврежден. Переходим в режим ручного управления!")
    isAutopilot = true
    
} catch AutoError.stopEngine {
    if sunroof>0 {
        print("Люк открыт! Закройте Люк перед выходом из авто!")
        
    }
    print("Вы остановили двигатель! Прежде чем выйти из машины, убедитесь в безопасности открытия дверей")
        
} catch AutoError.trunkIsOpen {
    print("Р!")
    
}

//Некоторые возможные "операции" (понятно, что размещать их надо в другом месте кода, но я иду по пунктам задания)
//при понижении заряда аккумулятора ниже 15 процентов вызываем выброс ошибки
//(то есть маркируем lowBattery как true, и вызываем соответствующие этой ошибке действия)

if batteryLevel <= 15 {
    lowBattery = true
}

//При включении автопилота выводим сообщение о необходимости быть внимательным
if isAutopilot{
    print("Автопилот включен! Это может быть опасно! Следите за движением автомобиля!")
}
//При включении управления музыкой выводим сообщение о необходимости следить за дорогой

if musicPlayer{
    print("Пожалуйста, не отвлекайтесь от управления автомобилем! Это может быть опасно!")
}
