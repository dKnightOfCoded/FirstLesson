//
//  main.swift
//  lesson-7
//
//  Created by S D on 17.01.2021.
//

import Foundation

struct Address {
    
    let name: String
    let price: Int
    
}

enum MinibusError: Error {
    
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    
}

extension MinibusError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidSelection: return "Таких клиентов нет"
        case let .insufficientFunds(coinsNeeded): return "Не хватает \(coinsNeeded)"
        
        }
        
    }
    
}

class Minibus {
    
    var coinsDeposited = 0
    
    var customers: [String: Address] = [
    
        "Mike": .init(name: "Бабушкинская", price: 45),
        "Bob": .init(name: "Медведково", price: 35),
        "Piter": .init(name: "Свиблово", price: 55)
    
    ]
    
    
    func send(customer name: String) -> (address: Address?, error: MinibusError?) {
        
                      
        guard let address = customers[name] else {
            return (nil, .invalidSelection)
        }
        
        guard address.price <= coinsDeposited else {
            
            let notSifficient = address.price - coinsDeposited
            return (nil, .insufficientFunds(coinsNeeded: notSifficient))
        }
        
        
        
        return (address, nil)
    }
   
        
}

let minibus = Minibus()
minibus.coinsDeposited = 10
let m1 = minibus.send(customer: "Bob")

if let m1 = m1.address {
    print(m1.name)
} else if let error = m1.error {
    print(error.localizedDescription)
}



/* Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch. */

enum StackError: Error {
    
    case empty
    case tooMuchElements
    
}

extension StackError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .empty: return "Забрать эелементы не могу т.к. стек пуст"
        case .tooMuchElements: return "Элементов больше 3"
        
        }
        
    }
    
}




class Rectangle {
    var sideA: Double
    var sideB: Double
     
    init(sideA: Double, sideB: Double) {
        self.sideA = sideA
        self.sideB = sideB
    }
}
struct Stack {
    
    private var elements: [Rectangle] = []
        
    mutating func push(_ element: Rectangle) throws {
        
// если элементов в массиве больше 3 - то выходит ошибка
        guard elements.count <= 3 else {
            throw StackError.tooMuchElements
        }
        
        elements.append(element)
    }
    
    
    
    mutating func pop() throws -> Rectangle {
        
        guard  !elements.isEmpty else {
            throw StackError.empty
        }
        return elements.removeLast()
    }
}
var stack = Stack()
print(stack)

try stack.push(Rectangle(sideA: 10, sideB: 20))
try stack.push(Rectangle(sideA: 2, sideB: 2))
try stack.push(Rectangle(sideA: 17, sideB: 90))
try stack.push(Rectangle(sideA: 11, sideB: 3))


print("4 добавили \(stack)")


do {
    try stack.push(Rectangle(sideA: 10, sideB: 3))
    print(stack)
} catch StackError.tooMuchElements {
    print("Элементов больше 3")
}


//извлекаем элементы
let st1 = try stack.pop()
let st2 = try stack.pop()
let st3 = try stack.pop()
let st4 = try stack.pop()


print("4 убрали \(stack)")

do {
    let st5 = try stack.pop()
    print(st5)
} catch StackError.empty {
    print("Нечего извлекать так как стек пуст")
}


print(stack)


