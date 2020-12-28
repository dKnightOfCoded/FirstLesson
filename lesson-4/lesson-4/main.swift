//
//  main.swift
//  lesson-4
//
//  Created by S D on 26.12.2020.
//

import Foundation


/*
1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.
*/


enum EngineState: String {
    case start = "заведен"
    case stop = "заглушен"
}

enum WindowsState: String {
    case open = "открыты"
    case close = "закрыты"
}


class Car {
        
    let brand: String
    let yearOfIssue: Int
    let fullVolume: Int
    var engine: EngineState
    var windows: WindowsState
    var loadVolume: Int
    
    init(brand: String, yearOfIssue: Int, fullVolume: Int, engine: EngineState, windows: WindowsState, loadVolume: Int) {
        self.brand = brand
        self.yearOfIssue = yearOfIssue
        self.fullVolume = fullVolume
        self.engine = engine
        self.windows = windows
        self.loadVolume = loadVolume
                       
    }
    
    // при включенном двигателе - окна открываются
    // при выключенном двигателе - окна закрываются
    func startEngine(engineState: EngineState) {
        

        if engineState == .start {
            self.engine = .start
            self.windows = .open
            print("Двигатель \(brand) запущен.")
        } else if  engineState == .stop {
            self.engine = .stop
            self.windows = .close
            print("Двигатель \(brand) заглушен.")
        }

        
    }

    
}

enum BodyType: String {
    case van = "Фургон"
    case dumpTruck = "Самосвал"
    case cargoPlatform = "Грузовая платформа"
}

enum RoofState: String {
    case open = "Кабриолет"
    case close = "Закрыта"
}

class TrunkCar: Car {
    let bodyType: BodyType
    
    init(brand: String, yearOfIssue: Int, fullVolume: Int, engine: EngineState, windows: WindowsState, loadVolume: Int, bodyType: BodyType) {
        self.bodyType = bodyType
        super.init(brand: brand, yearOfIssue: yearOfIssue, fullVolume: fullVolume, engine: engine, windows: windows, loadVolume: loadVolume)
    }
    override func startEngine(engineState: EngineState) {
        super.startEngine(engineState: engineState)
        // Звук двигателя при включении
        if engineState == .start{
        print("Br br br ph") // Sound of engine
        }
    }
     
}

class SportСar: Car {
    let roofState: RoofState
    
    init(brand: String, yearOfIssue: Int, fullVolume: Int, engine: EngineState, windows: WindowsState, loadVolume: Int, roofState: RoofState) {
        self.roofState = roofState
        super.init(brand: brand, yearOfIssue: yearOfIssue, fullVolume: fullVolume, engine: engine, windows: windows, loadVolume: loadVolume)
    }
    override func startEngine(engineState: EngineState) {
        super.startEngine(engineState: engineState)
        // Звук двигателя при включении
        if engineState == .start{
        print("Rrrrrrrrr") // Sound of engine
        }
    }
    
}

//Двигатель заглушен - окна закрыты
let trunkCar1 = TrunkCar(brand: "MAN", yearOfIssue: 2005, fullVolume: 5000, engine: .stop, windows: .close, loadVolume: 4000, bodyType: .van)

//Двигатель запускаем - окна открываются
trunkCar1.startEngine(engineState: .start)
print("Марка: \(trunkCar1.brand), Год выпуска: \(trunkCar1.yearOfIssue), Объем багажника: \(trunkCar1.fullVolume),Статус мотора: \(trunkCar1.engine.rawValue), Статус окон: \(trunkCar1.windows.rawValue), загруженный объем багажника: \(trunkCar1.loadVolume), тип кузова: \(trunkCar1.bodyType.rawValue)")

//Двигатель работает - окна открыты
let trunkCar2 = TrunkCar(brand: "Gazel", yearOfIssue: 2010, fullVolume: 6000, engine: .start, windows: .open, loadVolume: 6000, bodyType: .cargoPlatform)

//Двигатель заглушаем - окна закрыты
trunkCar2.startEngine(engineState: .stop)
print("Марка: \(trunkCar2.brand), Год выпуска: \(trunkCar2.yearOfIssue), Объем багажника: \(trunkCar2.fullVolume),Статус мотора: \(trunkCar2.engine.rawValue), Статус окон: \(trunkCar2.windows.rawValue), загруженный объем багажника: \(trunkCar2.loadVolume), тип кузова: \(trunkCar2.bodyType.rawValue)")


////////////

//Двигатель заглушен - окна закрыты
let sportСar1 = SportСar(brand: "Camaro", yearOfIssue: 2008, fullVolume: 400, engine: .stop, windows: .close, loadVolume: 0, roofState: .open)

// заводим двигатель - окна открваются
sportСar1.startEngine(engineState: .start)
print("Марка: \(sportСar1.brand), Год выпуска: \(sportСar1.yearOfIssue), Объем багажника: \(sportСar1.fullVolume),Статус мотора: \(sportСar1.engine.rawValue), Статус окон: \(sportСar1.windows.rawValue), загруженный объем багажника: \(sportСar1.loadVolume), тип крыши: \(sportСar1.roofState.rawValue)")


//Двигатель работает - окна открыты
let sportСar2 = SportСar(brand: "BMW", yearOfIssue: 2019, fullVolume: 500, engine: .start, windows: .open, loadVolume: 0, roofState: .close)

//Двигатель глушим - окна закрываюся
sportСar2.startEngine(engineState: .stop)
print("Марка: \(sportСar2.brand), Год выпуска: \(sportСar2.yearOfIssue), Объем багажника: \(sportСar2.fullVolume),Статус мотора: \(sportСar2.engine.rawValue), Статус окон: \(sportСar2.windows.rawValue), загруженный объем багажника: \(sportСar2.loadVolume), тип крыши: \(sportСar2.roofState.rawValue)")

