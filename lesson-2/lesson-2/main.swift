//
//  main.swift
//  lesson-2
//
//  Created by S D on 17.12.2020.
//

import Foundation

// 1. Написать функцию, которая определяет, четное число или нет.
// Напишем функцию, определяющую четное число в массиве и записывающую его в новый массив

func evenOrNot(array: [Int]) -> [Int] {
    var newarray = [Int]()
        for element in array where element % 2 == 0 {
                newarray.append(element)
        }
    return newarray
}

let array1 = [1, 3, 4, 6, 7, 10]
let array2 = [12, 31, 40, 61, 70, 101]

let even = evenOrNot(array: array1)
let even2 = evenOrNot(array: array2)

print(even)
print(even2)


//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
// Напишем функцию, определяющую число в массиве, которое делится без остатка на 3  и записывающую его в новый массив

func divideByThree(array: [Int]) -> [Int]{
    var newarray = [Int]()
        for element in array where element % 3 == 0 {
                newarray.append(element)
        }
    return newarray
}

let array3 = [1, 3, 4, 63, 7, 12, 72]
let byThree = divideByThree(array: array3)

print(byThree)

//3. Создать возрастающий массив из 100 чисел.

var incArray = [Int]()

for a in (1...100) {
    incArray.append(a)
}
print(incArray)


//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for element in incArray where (element % 2 == 0) || !(element % 3 == 0)  {
    if let index = incArray.firstIndex(of: element) {
        incArray.remove(at: index)
    }
}
print(incArray)

