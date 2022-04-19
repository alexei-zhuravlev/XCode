//
//  Model.swift
//  MyToDoListMVC
//
//  Created by Алексей Журавлев on 19.04.2022.
//

import Foundation
import UIKit

//MARK: Здесь производим все вычисления и обработки для нашего приложения

//MARK: объявляем класс описывающий содержание ячейки

class Item{
    var string:String //собственно содержимое ячейки
    var completed:Bool //маркер выполнена задача или нет
    
    init(string:String, completed:Bool){
        self.string = string
        self.completed = completed
    }
}

//MARK: объявляем класс модели, в которой будем проводить все вычисления

class Model{
    
    var editButtonClicked:Bool = false //нажатие на кнопку редактирования
    
//    создаем массив задач, которые будут появляться при открытии приложения
    var toDoItems: [Item] = [
                            Item(string: "Какое-то задание", completed: false),
                            Item(string: "Еще одно дело", completed: true),
                            Item(string: "Нечто неотложное", completed: false),
                            ]
    
    var sortedAscending: Bool = true //сортировка задач по возрастанию (названия)
    
//    добавление новой задачи в список
    func addItem(itemName:String, isCompleted:Bool = false){
        toDoItems.append(Item(string: itemName, completed: isCompleted))
    }
    
//    удаление задачи
    func removeItem( at index:Int){
        toDoItems.remove(at: index)
    }
    
//    редактирование задачи
    func updateItem(at index:Int, with string:String){
        toDoItems[index].string = string
    }
    
//    отметить задачу выполненной
    func changeState(at index:Int) -> Bool{
        toDoItems[index].completed = !toDoItems[index].completed
        return toDoItems[index].completed
    }
    
//    сортировка задач
    func sortByTitle(){
        toDoItems.sort{
            sortedAscending ? $0.string < $1.string : $0.string > $1.string
        }
    }
    
}
