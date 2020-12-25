//
//  main.swift
//  lesson-3
//
//  Created by S D on 21.12.2020.
//

import Foundation

/*
1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.
*/

enum engineState: String {
    case start = "заведен"
    case stop = "заглушен"
}

enum windowsState: String {
    case open = "открыты"
    case close = "закрыты"
}

enum loadUpload {
    case load(v1: Int)
    case upload(v2: Int)
}

struct SportCar {
    
    let brand: String
    let yearOfIssue: Int
    let fullVolume: Int
    var engine: engineState
    var windows: windowsState
    var loadVolume: Int
    
    
    
    mutating func startEngine(engineState: engineState) {
        
        print("Марка: \(brand), Год выпуска: \(yearOfIssue), Объем багажника: \(fullVolume),Статус мотора: \(engine.rawValue), Статус окон: \(windows.rawValue), загруженный объем багажника: \(loadVolume)")
        
        if engineState == .start {
            self.engine = .start
            self.windows = .open
            print("Двигатель \(brand) запущен. Окна открыты.")
        } else if  engineState == .stop {
            self.engine = .stop
            self.windows = .close
            print("Двигатель \(brand) заглушен. Окна закрыты.")
        }
        
    }

    
}

var camaro = SportCar(brand: "Camaro", yearOfIssue: 2018, fullVolume: 255, engine: .stop, windows: .close, loadVolume: 0)


var honda = SportCar(brand: "Honda", yearOfIssue: 2015, fullVolume: 260, engine: .start, windows: .open, loadVolume: 0)

// когда двигатель запущен - окна открываются, когда заглушен - окна закрываюся
camaro.startEngine(engineState: .start)
honda.startEngine(engineState: .stop)




struct TrunkCar {
    
    let brand: String
    let yearOfIssue: Int
    let fullVolume: Int
    var engine: engineState
    var windows: windowsState
    var loadVolume: Int
    
    
     
    mutating func load(loadVolume: Int) {
        
        self.loadVolume = loadVolume
        print("Марка: \(brand), Год выпуска: \(yearOfIssue), Объем кузова: \(fullVolume),Статус мотора: \(engine.rawValue), Статус окон: \(windows.rawValue), загруженный объем кузова: \(loadVolume)")
        
            if fullVolume == loadVolume{
                print("Грузовик загружен. Можно ехать!") }
            else if (fullVolume < loadVolume) {
                print("Грузовик перегружен. Требуется разгрузка!")
            }
            else if (fullVolume > loadVolume) {
                print("Грузовик полностью не загружен. Ожидается загрузка!")
            }

   }
    
    
}

var gazel = TrunkCar(brand: "Gazel", yearOfIssue: 2019, fullVolume: 6000, engine: .stop, windows: .close, loadVolume: 0)

// вводим количество заполненного объема кузова
// если грузовик полностью загружен, тогда можно ехать
gazel.load(loadVolume: 5000)


var hyundai = TrunkCar(brand: "Hyundai", yearOfIssue: 2017, fullVolume: 7000, engine: .start, windows: .open, loadVolume: 0)

// вводим количество заполненного объема кузова
hyundai.load(loadVolume: 7000)

