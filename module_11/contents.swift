// Итогоаый проект модуля 13
import UIKit

//Кортежи

//Создаем два кортежа с одинаковыми параметрами и типами данных (Int, String, String)
let firstTuple = (age:36, name:"Alexey", surname:"Ivanov")
let secondTuple = (age:22, name:"Ivan", surname:"Petrov")

//Получение значений из кортежа по параметру
firstTuple.age
firstTuple.name
firstTuple.surname

//Получение значений из кортежа по индексу
secondTuple.0
secondTuple.1
secondTuple.2

//Массивы

//Создайте массив «дни в месяцах» (12 элементов содержащих количество дней в соответствующем месяце)
let daysInMonthes = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
//Просто проверка того, что в массиве 12 элементов
daysInMonthes.count

//Создам массив с именами месяцев
let namesOfMonthes = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"]

//выведите количество дней в каждом месяце, используя цикл for
//1 вариант (без названий месяца)
for element in daysInMonthes{
    print(element)
}

//используйте еще один массив с именами месяцев чтобы вывести название месяца + количество дней
for i in 0...11{
    print("В месяце \(namesOfMonthes[i]) \(daysInMonthes[i]) дней")
}
// как вариант можно использовать не конкретное число, а просто длинну массива
for i in 0..<daysInMonthes.count{
    print("В месяце \(namesOfMonthes[i]) \(daysInMonthes[i]) дней")
}
//сделайте тоже самое, но используя массив кортежей с параметрами (имя месяца, количество дней)

//объявляем пустой именованный кортеж
var monthesArray:[(month: String, days: Int)] = []

//заполняем массив значениями
for i in 0...11{
    monthesArray.append((month: namesOfMonthes[i], days: daysInMonthes[i]))
}

//выводим имена и количество дней месяца в обратном порядке
for i in stride(from: 11, through: 0, by: -1){
    print("В месяце \(namesOfMonthes[i]) \(daysInMonthes[i]) дней")
}

//для произвольно выбранной даты (месяц и день) посчитайте количество дней до конца года

// Для начала объявим ту самую произвольную дату. Будем требовать от пользователя ввести дату кортежем
let someDate = (day:13, month:"Июль")
//Найдем место (индекс на самом деле) месяца в массиве месяцев
//Так как значение индекса будет выходить опциональным, нужно его извлечь.
//Я точно знаю, что месяц есть, поэтому буду извлекать "жестко" :)
let indexInMonthes = namesOfMonthes.firstIndex(of: someDate.month)!
//Теперь посчитаем сколько дней останется до конца года от выбранной даты
//Объявим переменную
var daysTillEndOfYear = 0
//Вычислим сколько дней осталось до конца выбранного случайного месяца от нашей даты
daysTillEndOfYear = daysInMonthes[indexInMonthes] - someDate.day
//Теперь пройдемся циклом for по оставшимся месяцам и прибавим их значение к переменной
for i in (indexInMonthes+1)..<daysInMonthes.count{
    daysTillEndOfYear+=daysInMonthes[i]
}
//Выведем в консоль результат
print(daysTillEndOfYear)


/*Создайте словарь, как журнал студентов, где имя и фамилия студента это ключ, а оценка за экзамен — значение.*/
var studentsDictionary = ["Иван Петров": 5, "Вероника Тряпкина": 4, "Петр Иванов": 3, "Сидор Сидоров":2]

//Повысьте студенту оценку за экзамен
//Повысим Веронике Тряпкиной оценку
studentsDictionary["Вероника Тряпкина"] = 5

/*Если оценка положительная (4 или 5) или удовлетворительная (3), то выведите сообщение с поздравлением, отрицательная (1, 2) - отправьте на пересдачу*/
switch studentsDictionary["Вероника Тряпкина"]{
    case 3,4,5:
        print("Поздравляем! Ваша оценка \(studentsDictionary["Вероника Тряпкина"]!). Экзмент сдан!")
    case 1, 2:
        print("Увы! Ваша оценка \(studentsDictionary["Вероника Тряпкина"]!). Экзамен нужно пересдать!")
    default:
        print("Оценка введена некорректно")
}


//Добавьте еще несколько студентов — это ваши новые одногруппники!
//Добавим студента Иван Сидоров
studentsDictionary["Иван Сидоров"] = 3
//Добавим студента Анна Павлова
studentsDictionary["Анна Павлова"] = 3

//Удалите одного студента — он отчислен
//Удалим студента Сидор Сидоров
studentsDictionary.removeValue(forKey: "Сидор Сидоров")

//Посчитайте средний балл всей группы по итогам экзамена
var commonResultOfGroup = 0
for (_, value) in studentsDictionary{
    commonResultOfGroup+=value
}
//Выведем средний балл в консоль
print("Средний балл группы - \(commonResultOfGroup/studentsDictionary.count)")
//Если нас интересует точный средний балл, то вот так
print("Средний балл группы - \(Double(commonResultOfGroup)/Double(studentsDictionary.count))")