import Foundation

//MARK: Выполнение задания хакатона после модуля 15

/*
 Реализована имитация взаимодействия пользователя с банкоматом. Пользователь может проверить баланас карты или депозита,
 пополнить баланс телефона (из разных источников), пополнить баланс карты или депозита (с выбором источника поступления средств),
 снять наличные деньги (с выбором источника поступления средств).
 */

//MARK: Объявляем протокол пользователя
protocol UserData {
  var userName: String { get }    //Имя пользователя
  var userCardId: String { get }   //Номер карты
  var userCardPin: Int { get }       //Пин-код
  var userPhone: String { get }       //Номер телефона
  var userCash: Float { get set }   //Наличные пользователя
  var userBankDeposit: Float { get set }   //Банковский депозит
  var userPhoneBalance: Float { get set }    //Баланс телефона
  var userCardBalance: Float { get set }    //Баланс карты
}

//MARK: Объявляем перечисление возможных действий пользователя
enum UserActions {
    case userPressedCardBalance // пользователь нажал кнопку "Показать баланс карты"
    case userPressedDepositBalance // пользователь нажал кнопку "Показать баланс депозита"
    case userPressedTopUpAccount// пользователь нажал кнопку "Пополнить баланс"
    case userPressedWithdrawCash // пользователь нажал кнопку "Снять деньги
    case userPressedTopUpCard //пользователь решил пополнить карту
    case userPressedTopUpPhone(phone:String) // пользователь нажал кнопку "Пополнить баланс телефона"
}

//MARK: Объявляем перечисление с текстом выбранных операций пользователя
enum DescriptionTypesAvailableOperations: String {
    case showBalanceCard = "Вы выбрали запрос баланса карты"
    case showBalanceDeposit = "Вы выбрали запрос баланса депозита"
    case topUpPhone = "Вы выбрали операцию пополнения баланса телефона"
    case withdrawalCard = "Вы выбрали операцию снятия наличных c карты"
    case withdrawalDeposit = "Вы выбрали операцию снятия наличных c депозита"
    case topUpDeposit = "Вы выбрали операцию пополнения депозита"
    case topUpCard = "Вы выбрали операцию пополнения карты"
}

//MARK: Объявляем методы платежа
enum PaymentMethod {
    case cash(cash:Float) // платеж наличными деньгами
    case deposit(deposit:Float) // платеж с депозита
    case card(card:Float) //платеж с карты
}

//MARK: Объявляем перечисление с текстом ошибок (текст, который будет выводиться на экран банкомата (в консоль))
enum TextErrors: String {
    case userCardOrPinIncorrect = "Данные карты введены неверно"
    case userPhoneIncorrect = "Введен неверный номер телефона"
    case userPoorCash = "У Вас недостаточно наличных"
    case userPoorCard = "У Вас недостаточно средств на карте"
    case userPoorDeposit = "У Вас недостаточно средств на депозите"
}

//MARK: объявляем протокол банка
protocol BankApi {
    func showUserCardBalance()
    func showUserDepositBalance()
    func showUserToppedUpMobilePhoneCash(cash: Float)
    func showUserToppedUpMobilePhoneCard(card: Float)
    func showUserToppedUpMobilePhoneDeposit(deposit: Float)
    func showWithdrawalCard(cash: Float)
    func showWithdrawalDeposit(cash: Float)
    func showTopUpCard(cash: Float)
    func showTopUpCardFromDeposit(deposit: Float)
    func showTopUpDeposit(cash: Float)
    func showTopUpDepositFromCard (cash:Float)
    func showError(error: TextErrors)
 
    func checkUserPhone(phone: String) -> Bool
    func checkMaxUserCash(cash: Float) -> Bool
    func checkMaxUserCard(withdraw: Float) -> Bool
    func checkMaxUserDeposit(deposit: Float) -> Bool
    func checkCurrentUser(userCardId: String, userCardPin: Int) -> Bool
 
    mutating func topUpPhoneBalanceCash(pay: Float)
    mutating func topUpPhoneBalanceCard(pay: Float)
    mutating func topUpPhoneBalanceDeposit(pay: Float)
    mutating func getCashFromDeposit(cash: Float)
    mutating func getCashFromCard(cash: Float)
    mutating func putCashDeposit(topUp: Float)
    mutating func putCardDeposit(topUp: Float)
    mutating func putCashCard(topUp: Float)
    mutating func putDepositCard(topUp: Float)
    
}

//MARK: Объявляем протокол банкомата
class ATM {
    private let userCardId: String
    private let userCardPin: Int
    private var someBank: BankApi
    private let action: UserActions
    private let paymentMethod: PaymentMethod?
 
    init(userCardId: String, userCardPin: Int, someBank: BankApi, action: UserActions, paymentMethod: PaymentMethod? = nil) {
        self.userCardId = userCardId
        self.userCardPin = userCardPin
        self.someBank = someBank
        self.action = action
        self.paymentMethod = paymentMethod
        
    sendUserDataToBank(userCardId: userCardId, userCardPin: userCardPin, actions: action, payment: paymentMethod)
  }
 
  public final func sendUserDataToBank(userCardId: String, userCardPin: Int, actions: UserActions, payment: PaymentMethod?) {
      //проводим верификацию пользователя
      let isUserExist = someBank.checkCurrentUser(userCardId: userCardId, userCardPin: userCardPin)
      //если верификация пройдена
      if isUserExist{
          //начинаем "перебирать" возможные варианты действий пользователя
          switch actions{
          case .userPressedTopUpCard: //пополнение карты (далее нужно будет проверить источник поступления средств
              if let payment = payment { // проверяем указан ли источник пополнения карты
                  switch payment{
                  case let .cash(cash: money):
                      if someBank.checkMaxUserCash(cash: money){
                          someBank.putCashCard(topUp: money)
                          someBank.showTopUpCard(cash: money)
                      }else{
                          someBank.showError(error: .userPoorCash)
                      }
                  case let .deposit(deposit: money):
                      if someBank.checkMaxUserDeposit(deposit: money){
                          someBank.putCardDeposit(topUp: money)
                          someBank.showTopUpCardFromDeposit(deposit: money)
                      } else {
                          someBank.showError(error: .userPoorDeposit)
                      }
                  case .card(card: _): //пополнять карту с самой себя глупо, но на тот случай, если это случайно выбрано
                      print("Укажите иной способ пополнения карты")
                  }
              }else {
                  print("Укажите источник пополнения баланса карты") //если забыли выбрать источник
          }
          case .userPressedCardBalance: //показать баланс карты
              someBank.showUserCardBalance()
          case .userPressedDepositBalance: //показать баланс депозита
              someBank.showUserDepositBalance()
          case let .userPressedTopUpPhone(phone: phone): //пополнить телефон (далее указываем источник пополнения
              if someBank.checkUserPhone(phone: phone){
                  if let payment = payment {
                      switch payment{
                      case let .cash(cash: payment):
                          if someBank.checkMaxUserCash(cash: payment){
                              someBank.topUpPhoneBalanceCash(pay: payment)
                              someBank.showUserToppedUpMobilePhoneCash(cash: payment)
                          }else{
                              someBank.showError(error: .userPoorCash)
                          }
                      case let .deposit(deposit: payment):
                          if someBank.checkMaxUserDeposit(deposit: payment){
                              someBank.topUpPhoneBalanceDeposit(pay: payment)
                              someBank.showUserToppedUpMobilePhoneDeposit(deposit: payment)
                          }else{
                              someBank.showError(error: .userPoorDeposit)
                          }
                      case let .card(card: payment):
                          if someBank.checkMaxUserCard(withdraw: payment){
                              someBank.topUpPhoneBalanceCard(pay: payment)
                              someBank.showUserToppedUpMobilePhoneCard(card: payment)
                          }else{
                              someBank.showError(error: .userPoorCard)
                          }
                      }
                  }else{
                      print("Необходимо выбрать метод платежа")
                  }
              }else{
                  someBank.showError(error: .userPhoneIncorrect) //если указан неверный (?) номер телефона
              }
          case .userPressedWithdrawCash: //снятие наличных (далее указываем откуда снимаем)
              if let payment = payment {
                  switch payment{
                  case let .card(card: money):
                      if someBank.checkMaxUserCard(withdraw: money){
                          someBank.getCashFromCard(cash: money)
                          someBank.showWithdrawalCard(cash: money)
                      }else{
                          someBank.showError(error: .userPoorCard)
                      }
                  case let .deposit(deposit: money):
                      if someBank.checkMaxUserDeposit(deposit: money){
                          someBank.getCashFromDeposit(cash: money)
                          someBank.showWithdrawalDeposit(cash: money)
                      }else{
                          someBank.showError(error: .userPoorDeposit)
                      }
                  case .cash(cash: _):
                      print("Укажите иной ресурс снятия наличных")
                  }
              }else{
                  print("Укажите откуда снимать деньги")
              }
          case .userPressedTopUpAccount: //пополнить депозит (далее указываем откуда пополняем депозит
              if let payment = payment {
                  switch payment{
                  case let .cash(cash: money):
                      if someBank.checkMaxUserCash(cash: money){
                          someBank.putCashDeposit(topUp: money)
                          someBank.showTopUpDeposit(cash: money)
                      }else{
                          someBank.showError(error: .userPoorCash)
                      }
                  case let .card(card: money):
                      if someBank.checkMaxUserCard(withdraw: money){
                          someBank.putDepositCard(topUp: money)
                          someBank.showTopUpDepositFromCard(cash: money)
                      }else{
                          someBank.showError(error: .userPoorCash)
                      }
                  case .deposit(deposit: _):
                      print("Укажите иной способ пополнения депозита")
                  }
              }else{
                  print("Укажите ресурс пополнения депозита")
              }
    // Добавить сюда пополнение карты с депозита и налом
          }
      }else {
          someBank.showError(error: .userCardOrPinIncorrect)
      }
      }
  }


//MARK: Объявим структуру банка

struct SomeBank:BankApi{
    
    private var user:UserData
    
    init(user:UserData){
        self.user = user
    }
    
    func showUserCardBalance() {
        let report = """
                     Здравствуйте, \(user.userName)!
                     \(DescriptionTypesAvailableOperations.showBalanceCard.rawValue)
                     Баланс Вашей карты составляет - \(user.userCardBalance) руб.
                     Хорошего дня!
                     """
        print(report)
    }
    
    func showUserDepositBalance() {
        let report = """
                     Здравствуйте, \(user.userName)!
                     \(DescriptionTypesAvailableOperations.showBalanceDeposit.rawValue)
                     На Вашем депозите \(user.userBankDeposit) руб.
                     Хорошего дня!
                     """
        print(report)
    }
    
    func showUserToppedUpMobilePhoneCash(cash: Float) {
        let report = """
                     Здравствуйте, \(user.userName)!
                     \(DescriptionTypesAvailableOperations.topUpPhone.rawValue)
                     Вы пополнили баланс телефона на сумму \(cash) руб.
                     У Вас осталось \(user.userCash) руб. наличными
                     Баланс Вашего телефона составляет \(user.userPhoneBalance)
                     Хорошего дня!
                     """
        print(report)
    }
    
    func showUserToppedUpMobilePhoneCard(card: Float) {
        let report = """
                     Здравствуйте, \(user.userName)!
                     \(DescriptionTypesAvailableOperations.topUpPhone.rawValue)
                     Вы пополнили баланс телефона на сумму \(card) руб.
                     На Вашей карте осталось \(user.userCardBalance) руб.
                     Баланс Вашего телефона составляет \(user.userPhoneBalance)
                     Хорошего дня!
                     """
        print(report)
    }
    
    func showUserToppedUpMobilePhoneDeposit(deposit: Float) {
        let report = """
                     Здравствуйте, \(user.userName)!
                     \(DescriptionTypesAvailableOperations.topUpPhone.rawValue)
                     Вы пополнили баланс телефона на сумму \(deposit) руб.
                     На Вашем депозите осталось \(user.userBankDeposit) руб.
                     Баланс Вашего телефона составляет \(user.userPhoneBalance)
                     Хорошего дня!
                     """
        print(report)
    }
    
    func showWithdrawalCard(cash: Float) {
        let report = """
                     Здравствуйте, \(user.userName)!
                     \(DescriptionTypesAvailableOperations.withdrawalCard.rawValue)
                     Вы сняли с Вашей карты сумму в размере \(cash) руб.
                     На Вашей карте осталось \(user.userCardBalance) руб.
                     Сумма наличных сейчас составляет \(user.userCash) руб.
                     Хорошего дня!
                     """
        print(report)
    }
    
    func showWithdrawalDeposit(cash: Float) {
        let report = """
                     Здравствуйте, \(user.userName)!
                     \(DescriptionTypesAvailableOperations.withdrawalDeposit.rawValue)
                     Вы сняли с Вашего депозита сумму в размере \(cash) руб.
                     На Вашем депозите осталось \(user.userBankDeposit) руб.
                     Сумма наличных сейчас составляет \(user.userCash) руб.
                     Хорошего дня!
                     """
        print(report)
    }
    
    func showTopUpCard(cash: Float) {
        let report = """
                     Здравствуйте, \(user.userName)!
                     \(DescriptionTypesAvailableOperations.topUpCard.rawValue)
                     Вы пополнили баланс Вашей карты на сумму \(cash) руб.
                     Баланс Вашей карты составляет \(user.userCardBalance) руб.
                     Сумма наличных сейчас составляет \(user.userCash) руб.
                     Хорошего дня!
                     """
        print(report)
    }
    
    func showTopUpDeposit(cash: Float) {
        let report = """
                     Здравствуйте, \(user.userName)!
                     \(DescriptionTypesAvailableOperations.topUpDeposit.rawValue)
                     Вы пополнили баланс Вашего депозита на сумму \(cash) руб.
                     На Вашем депозите сейчас \(user.userBankDeposit) руб.
                     Сумма наличных сейчас составляет \(user.userCash) руб.
                     Хорошего дня!
                     """
        print(report)
    }
    
    func showTopUpDepositFromCard (cash:Float) {
        let report = """
                     Здравствуйте, \(user.userName)!
                     \(DescriptionTypesAvailableOperations.topUpDeposit.rawValue)
                     Вы пополнили баланс Вашего депозита на сумму \(cash) руб.
                     На Вашем депозите сейчас \(user.userBankDeposit) руб.
                     Остаток на карте составляет \(user.userCardBalance) руб.
                     Хорошего дня!
                     """
        print(report)
    }
    
    func showTopUpCardFromDeposit(deposit: Float) {
        let report = """
                     Здравствуйте, \(user.userName)!
                     \(DescriptionTypesAvailableOperations.topUpCard.rawValue)
                     Вы пополнили баланс Вашей карты на сумму \(deposit) руб.
                     На Вашей карте сейчас - \(user.userCardBalance) руб.
                     Остаток на Вашем депозите составляет - \(user.userBankDeposit) руб.
                     Хорошего дня!
                     """
        print(report)
    }
    
    func showError(error: TextErrors) {
        let report = """
                    Уважаемый \(user.userName)!
                    \(error.rawValue).
                    Хорошего дня!
                    \u{1F608}
                    """
        print(report)
    }
    
    func checkUserPhone(phone: String) -> Bool {
        if phone == user.userPhone{
            return true
        }else{
            return false
        }
    }
    
    func checkMaxUserCash(cash: Float) -> Bool {
        if cash <= user.userCash{
            return true
        }else{
            return false
        }
    }
    
    func checkMaxUserCard(withdraw: Float) -> Bool {
        if withdraw <= user.userCardBalance{
            return true
        }else{
            return false
        }
    }
    
    func checkMaxUserDeposit(deposit: Float) -> Bool {
        if deposit <= user.userBankDeposit{
            return true
        }else{
            return false
        }
    }
    
    func checkCurrentUser(userCardId: String, userCardPin: Int) -> Bool {
        if (userCardId == user.userCardId) && (userCardPin == user.userCardPin){
            return true
        }else{
            return false
        }
    }
    
    mutating func topUpPhoneBalanceCash(pay: Float) {
        user.userPhoneBalance += pay
        user.userCash -= pay
    }
    
    mutating func topUpPhoneBalanceCard(pay: Float) {
        user.userPhoneBalance += pay
        user.userCardBalance -= pay
    }
    
    mutating func topUpPhoneBalanceDeposit(pay: Float) {
        user.userPhoneBalance += pay
        user.userBankDeposit -= pay
    }
    
    mutating func getCashFromDeposit(cash: Float) {
        user.userBankDeposit -= cash
        user.userCash += cash
    }
    
    mutating func getCashFromCard(cash: Float) {
        user.userCardBalance -= cash
        user.userCash += cash
    }
    
    mutating func putCashDeposit(topUp: Float) {
        user.userBankDeposit += topUp
        user.userCash -= topUp
    }
    
    mutating func putCashCard(topUp: Float) {
        user.userCardBalance += topUp
        user.userCash -= topUp
    }
    
    mutating func putDepositCard(topUp: Float) {
        user.userBankDeposit += topUp
        user.userCardBalance -= topUp
    }
    
    mutating func  putCardDeposit(topUp: Float) {
        user.userCardBalance += topUp
        user.userBankDeposit -= topUp
    }
    
}

//MARK: Объявим структуру пользователя
struct User:UserData{
    var userName: String
    var userCardId: String
    var userCardPin: Int
    var userPhone: String
    var userCash: Float
    var userBankDeposit: Float
    var userPhoneBalance: Float
    var userCardBalance: Float
}

//MARK: Теперь сделаем экземпляры банка, банкомата и пользователя и потестим
//пользователь
let userVasya = User(userName: "Вася", userCardId: "0000 0000 0000 0001", userCardPin: 1234, userPhone: "8 905 372 33 35", userCash: 2357.75, userBankDeposit: 10000.3, userPhoneBalance: -34.5, userCardBalance: 1300.00)

//банк
let bankOfVasya = SomeBank(user: userVasya)

//MARK: Тестируем написанное, объявляя экземпляры сессий взаимодействия с банкоматом

//Посмотреть баланс депозита
let userVasyaATMSessionOne = ATM(userCardId: "0000 0000 0000 0001", userCardPin: 1234, someBank: bankOfVasya, action: .userPressedDepositBalance, paymentMethod: .none)

/*Здравствуйте, Вася!
 Вы выбрали запрос баланса депозита
 На Вашем депозите 10000.3 руб.
 Хорошего дня!
*/

//пополнить карту с депозита
let userVasyaATMSessionTwo = ATM(userCardId: "0000 0000 0000 0001", userCardPin: 1234, someBank: bankOfVasya, action: .userPressedTopUpCard, paymentMethod: .deposit(deposit: 400))

/*Здравствуйте, Вася!
 Вы выбрали операцию пополнения карты
 Вы пополнили баланс Вашей карты на сумму 400.0 руб.
 На Вашей карте сейчас - 1700.0 руб.
 Остаток на Вашем депозите составляет - 9600.3 руб.
 Хорошего дня!*/

//пополнить счет телефона наличными
let userVasyaATMSessionThree = ATM(userCardId: "0000 0000 0000 0001", userCardPin: 1234, someBank: bankOfVasya, action: .userPressedTopUpPhone(phone: "8 905 372 33 35"), paymentMethod: .cash(cash: 400))

/*Здравствуйте, Вася!
 Вы выбрали операцию пополнения баланса телефона
 Вы пополнили баланс телефона на сумму 400.0 руб.
 У Вас осталось 1957.75 руб. наличными
 Баланс Вашего телефона составляет 365.5
 Хорошего дня!*/

//пополнить телефон с карты, но сумма больше, чем есть на карте
let userVasyaATMSessionFour = ATM(userCardId: "0000 0000 0000 0001", userCardPin: 1234, someBank: bankOfVasya, action: .userPressedTopUpPhone(phone: "8 905 372 33 35"), paymentMethod: .card(card: 10000))

/*Уважаемый Вася!
 У Вас недостаточно средств на карте.
 Хорошего дня!
 😈*/

