import Cocoa

var str = "Hello, playground"

//
//  main.swift
//  Lesson1
//
//  Created by S D on 12.12.2020.
//

import Foundation

print("Hello, World!")

// Решим квадратное уравнение x2 − 8x + 12 = 0;

let a = 1
let b = -8
let c = 12
let D = b * b - 4 * a * c
print("Дискриминант D равен \(D)")

let doubleD = Double(D) //D стал дабл
let sqrtD = Int(sqrt(doubleD)) // корень из дабл и приводим к Int
print("Корень квадратный от D равен \(sqrtD)")

let x1 = (-b + sqrtD)/(2 * a)
let x2 = (-b - sqrtD)/(2 * a)

print("Первый корень уравнения равен \(x1)")
print("Второй корень уравнения равен \(x2)")


//  S = (a * b)/2
//  P = a + b + c,   c - гипотенуза
//  с = корень из a * a + b * b

let firstSide = 3
let doubleFirstSide = Double(firstSide)
let powDoubleFirstSide = pow(doubleFirstSide, 2)

let secondSide = 4
let doubleSecondSide = Double(secondSide)
let powDoubleSecondSide = pow(doubleSecondSide, 2)


let square = (firstSide * secondSide)/2
print("Площадь прямоугольного треугольника равна \(square)")

let hypo = Int(sqrt(powDoubleFirstSide + powDoubleSecondSide))
print("Гипотенуза прямоугольного треугольника равна \(hypo)")

let perim = firstSide + secondSide + hypo
print("Периметр прямоугольного треугольника равен \(perim)")


// Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

let deposit = 100000
let doubleDeposit = Double(deposit)

let percent = 8
let doublePercent = Double(percent)

let numberOfYears = 5

let incomeForOneYear = Int(doubleDeposit * doublePercent/100)
print("Доход за один год \(incomeForOneYear)")

// сумма вклада через 5 лет
let depositInFiveYears = deposit + incomeForOneYear * numberOfYears
print("Сумма вклада через 5 лет \(depositInFiveYears)")






