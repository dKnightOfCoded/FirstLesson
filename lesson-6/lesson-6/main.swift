//
//  main.swift
//  lesson-6
//
//  Created by S D on 11.01.2021.
//

import Foundation

protocol Idable {
    var id: Int { get }
}

class Circle: Idable {
    var radius: Double
    var id: Int
    func calculatePerimiter() -> Double {
        return 2.0 * Double.pi * radius
    }
    init(radius: Double, id: Int) {
        self.radius = radius
        self.id = id
    }
}
class Rectangle: Idable {
    var sideA: Double
    var sideB: Double
    var id: Int
    func calculatePerimiter() -> Double {
        return sideA + sideB
    }
    init(sideA: Double, sideB: Double, id: Int) {
        self.sideA = sideA
        self.sideB = sideB
        self.id = id
    }
}
struct Queue<T: Idable> {
    
    var elements: [T] = []
        
    //  Очередь Queue<T> представляет собой динамическую типизированную коллекцию, в которой элементы обслуживаются по принципу “первым пришел, первым вышел” (FIFO).
    
    //  Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
    
    
    func filter(array: [T], predicate: (T) -> Bool ) -> [T] {
        var tmpArray = [T]()               // создает временный массив
        for element in array {
            if predicate(element) {         // вызываем замыкание, чтобы проверить элемент
                tmpArray.append(element)
            }
        }
        return tmpArray                     // возвращаем отфильтрованный массив
    }

    //Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
    
        subscript(index: Int) -> Int? {
            
            if let c = (elements.count > index ? elements[index].id : nil) as Int? {
                return c
            } else {
                return nil
            }

        }

    
    mutating func push(_ element: T) {      // добавляем элемент типа Т
        elements.append(element)
    }
    mutating func pop() -> T? {           // извлекаем элемент типа Т
        return elements.isEmpty ? .none : elements.removeFirst()
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
                    
            var string: String = ""
            for element in elements {
                string += "\(element.id)"
            }
        
            if string.isEmpty {
                return "stack empty"
            } else {
                return string
            }
    }
    
}

var queueRectangle = Queue<Rectangle>()  // создаем очередь типа Rectangle
var queueCircle = Queue<Circle>()       // создаем очередь типа Circle
// добавляем элементы

print(queueRectangle)
queueRectangle.push(Rectangle(sideA: 10, sideB: 20, id: 1))
queueRectangle.push(Rectangle(sideA: 2, sideB: 2, id: 2))
queueRectangle.push(Rectangle(sideA: 3, sideB: 5, id: 3))
queueRectangle.push(Rectangle(sideA: 8, sideB: 10, id: 4))
queueRectangle.push(Rectangle(sideA: 8, sideB: 11, id: 6))
print("Добавили 5 элементов  \(queueRectangle)")

print("Проверяем работу сабскрипта")
let sub = queueRectangle[3]
print(sub ?? "nil")


var a = queueRectangle.elements



let filteredArray = queueRectangle.filter(array: a, predicate: {$0.id % 2 == 0})
print("Отфильтруем массив по четным id")
filteredArray.forEach({print($0.id)})

let filteredArray2 = queueRectangle.filter(array: a, predicate: {$0.id % 2 != 0})
print("Отфильтруем массив по нечетным id")
filteredArray2.forEach({print($0.id)})



let s1 = queueRectangle.pop()
let s2 = queueRectangle.pop()
let s3 = queueRectangle.pop()
 
print("Удалим первые 3 элемента  \(queueRectangle)")


