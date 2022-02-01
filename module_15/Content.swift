//MARK: Итоговое задание модуля 15 Обработка ошибок, дженерики

/*
 Создайте перечисление для ошибок. Добавьте в него 3 кейса:
 ошибка 400,
 ошибка 404,
 ошибка 500.
 */
enum HttpErrors:Error{
    case error_400
    case error_404
    case error_500
}

/*
 Далее создайте переменную, которая будет хранить в себе какую-либо ошибку (400 или 404 или 500). И при помощи do-catch сделайте обработку ошибок перечисления. 
Для каждой ошибки должно быть выведено сообщение в консоль.
 */

//Создаем переменную
var sampleError = 400

//Делаем обработку ошибок с выводом сообщения в консоль
do{
    switch sampleError{
    case 400:
        throw HttpErrors.error_400
    case 404:
        throw HttpErrors.error_404
    case 500:
        throw HttpErrors.error_500
    default:
        print("Неизвестная ошибка")
    }
}
catch HttpErrors.error_400{
    print("400 Bad Request ")
}
catch HttpErrors.error_404{
    print("404 Not Found")
}
catch HttpErrors.error_500{
    print("500 Internal Server Error")
}

/*
 Теперь добавьте проверку переменных в генерирующую функцию и обрабатывайте её!
 */

//Объявляем функцию
func httpError()throws{
    switch sampleError{
    case 400:
        throw HttpErrors.error_400
    case 404:
        throw HttpErrors.error_404
    case 500:
        throw HttpErrors.error_500
    default:
        print("Неизвестная ошибка")
    }
}

// Делаем обработку функции
do{
    try httpError()
}
catch HttpErrors.error_400{
    print("400 Bad Request ")
}
catch HttpErrors.error_404{
    print("404 Not Found")
}
catch HttpErrors.error_500{
    print("500 Internal Server Error")
}

/*
 Напишите функцию, которая будет принимать на вход два разных типа и проверять: если типы входных значений одинаковые, 
то вывести сообщение “Yes”, в противном случае — “No”.
 */

func comparingTypes<T, T1>(paramOne:T, paramTwo:T1) ->Void{
    if type(of: paramOne) == type(of: paramTwo){
        print("Yes")
    }else{
        print("No")
    }
}


/*
 Реализуйте то же самое, но если тип входных значений различается, выбросите исключение. 
Если тип одинаковый — тоже выбросите исключение, но оно уже будет говорить о том, что типы одинаковые. Не бойтесь этого. Ошибки — это не всегда про плохой результат.
 */

//объявим перечисление ошибок сравнения протоколов
enum ComparingTypeError:Error{
    case sameTypes
    case differentTypes
}

// объявим функцию, которая будет сравнивать типы и выбрасывать ошибку
func comparingTypesWithError<T, T1>(paramOne:T, paramTwo:T1)throws ->Void{
    if type(of: paramOne) == type(of: paramTwo){
        throw ComparingTypeError.sameTypes
    }else{
        throw ComparingTypeError.differentTypes
    }
}

// Проверим как работает
do{
    try comparingTypesWithError(paramOne: 2, paramTwo: 3.0)
}
catch ComparingTypeError.sameTypes{
    print("Hurray! Yes!")
}
catch ComparingTypeError.differentTypes{
    print("Oh, NO!")
}


/*
 Напишите функцию, которая принимает на вход два любых значения и сравнивает их при помощи оператора равенства ==
 */

func compareTwoThings<T:Equatable>(thingOne:T, thingTwo:T)->Bool{
    if thingOne == thingTwo{
        print("Same Things")
        return true
    }else{
        print("Thing are different")
        return false
    }
}
