//: Playground - noun: a place where people can play

import UIKit

protocol Car {
    
    func type() -> CarTypes
    func seatAvailble() -> Int
    
    func features()->String
}

enum CarTypes  {
    case HatchBack , Sedan, Suv
}


class HatchBack: Car {

    func type() -> CarTypes {
        return .HatchBack
    }
    
    func seatAvailble() -> Int {
        return 5
    }
    
    func features()->String {
        return "Small car with 5 seating capabilites, Good for a small family for  city drive"
    }
}


class Suv: Car {
    
    func type() -> CarTypes {
        return .Suv
    }
    
    func seatAvailble() -> Int {
        return 7
    }
    
    func features()->String {
        return "Big car with 7 seating capabilites, Good for big families"
    }
}


class Sedan: Car {
    
    func type() -> CarTypes {
        return .Sedan
    }
    
    func seatAvailble() -> Int {
        return 6
    }
    
    func features()->String {
        return "Big car with 6 seating capabilites, comfortable for long journey"
    }
}

class CarFactory {

    static func makeCar(type:CarTypes)-> Car {
        
        
        switch type {
        case .HatchBack:
            return HatchBack()

        case .Suv:
            return Suv()

        case .Sedan:
            return Sedan()
        }
    }
}


let  newCar  = CarFactory.makeCar(type: .Sedan)
    print(newCar.seatAvailble())
    print(newCar.type())
    print(newCar.features())


