//
//  Storage.swift
//  BankApp
//
//  Created by Алексей Журавлев on 31.05.2022.
//

import Foundation
import RealmSwift

class Balance:Object{
    @objc dynamic var balance:Float = 0.0
}

class OperationsHystory:Object{
    @objc dynamic var data:String = ""
    @objc dynamic var operation:String = ""
    @objc dynamic var amount:Float = 0.0
}

