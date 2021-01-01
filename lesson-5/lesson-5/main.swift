//
//  main.swift
//  lesson-5
//
//  Created by S D on 01.01.2021.
//

import Foundation


protocol Car {
    
    var brand: String { get  }
    var yearOfIssue: Int { get  }
    var fullVolume: Int { get  }

    func startEngine(engineState: EngineState)
    
}


enum EngineState: String {
    case start = "заведен"
    case stop = "заглушен"
}

extension Car {
    
    func openWindows() {
        print("Окна открыты!")
    }
    
    func closeWindows() {
        print("Окна закрыты!")
    }
    
}

enum RoofState: String {
    case open = "кабриолет"
    case close = "c закрытой крышей"
}
    

class SportСar: Car {
    
    var brand: String = "Camaro"

    var yearOfIssue: Int = 2020

    var fullVolume: Int = 500
    
    func startEngine(engineState: EngineState) {
        
        if engineState == .start {
            print("Двигатель \(brand) \(yearOfIssue) года \(engineState.rawValue)!")
            print("Rrrrrr")
        } else if  engineState == .stop {
            print("Двигатель \(brand) \(yearOfIssue) года \(engineState.rawValue)!")
        }
        
        
    }
        
    
    let roofState: RoofState
    
    init(roofState: RoofState) {
        self.roofState = roofState
    }
    
}

enum BodyType: String {
    case van = "Фургон"
    case dumpTruck = "Самосвал"
    case cargoPlatform = "Грузовая платформа"
}
    
class TrunkCar: Car {
    
    var brand: String = "Gazel"

    var yearOfIssue: Int = 2018

    var fullVolume: Int = 4000
    
    func startEngine(engineState: EngineState) {
        if engineState == .start {
            print("Двигатель \(brand) \(yearOfIssue) года \(engineState.rawValue)!")
            print("Br br br")
        } else if  engineState == .stop {
            print("Двигатель \(brand) \(yearOfIssue) года \(engineState.rawValue)!")
        }
}
    let bodyType: BodyType
    
    init(bodyType: BodyType) {
        self.bodyType = bodyType
    }
    
}


extension SportСar: CustomStringConvertible {
    var description: String {
        return "Спорткар \(roofState.rawValue):"
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Грузовик \(bodyType.rawValue):"
    }
}

let sportCar1 = SportСar(roofState: .open)
print(sportCar1.description)
print(sportCar1.startEngine(engineState: .start))
print(sportCar1.openWindows())


let sportCar2 = SportСar(roofState: .close)
print(sportCar2.description)
print(sportCar2.startEngine(engineState: .stop))
print(sportCar2.closeWindows())


////////



let trunkCar1 = TrunkCar(bodyType: .van)
print(trunkCar1.description)
print(trunkCar1.startEngine(engineState: .start))
print(trunkCar1.openWindows())


let trunkCar2 = TrunkCar(bodyType: .cargoPlatform)
print(trunkCar2.description)
print(trunkCar2.startEngine(engineState: .stop))
print(trunkCar2.closeWindows())






