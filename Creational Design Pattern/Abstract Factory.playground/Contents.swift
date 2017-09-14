//: Playground - noun: a place where people can play

import UIKit

// Abstract Class
protocol Car {
    func type() -> CarTypes
    func seatAvailble() -> Int
    func features()->String
}




// types of available Cars
enum CarTypes  {
    case HatchBack , Sedan, Suv
}


// Classes inherit from same Abstaract Class . Or using Same Protocol
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



// types of available Car Companies
enum CarCompainesTypes  {
    case Maruti , Hyundai
}



class CarBuilder {
    
    func getCarFactory(forComapany company:CarCompainesTypes)->AbstractCarFactory {
        switch company {
        case .Hyundai:
            return HyundiaCarFactory()
            
        case .Maruti:
            return MarutiCarFactory()
        }
    }
}




// Abstract Class for Factory
protocol AbstractCarFactory {
    
    func buildHatchBackCar()->HatchBack
    func buildSedanCar()->Sedan
    func buildSuvCar()->Suv
}




// Factory Class For Maruti Company
class MarutiCarFactory: AbstractCarFactory {
    
    func buildHatchBackCar()->HatchBack {
        return MarutiHatchBack()
    }
    func buildSedanCar()->Sedan {
        return MarutiSedan()
    }
    func buildSuvCar()->Suv {
        return MarutiSuv()
    }
}




class MarutiHatchBack:HatchBack{
    
 override   func type() -> CarTypes {
        return .Sedan
    }
    
  override  func seatAvailble() -> Int {
        return 5
    }
    
  override  func features()->String {
    return "Maruti HatchBack is " +  super.features()
    }
}



class MarutiSedan:Sedan{
  override  func type() -> CarTypes {
        return .Sedan
    }
    
  override  func seatAvailble() -> Int {
        return 6
    }
    
  override  func features()->String {
    return "Maruti Sedan is " +  super.features()
    }
}

class MarutiSuv:Suv{

   override func type() -> CarTypes {
        return .Suv
    }
    
  override  func seatAvailble() -> Int {
        return 7
    }
    
  override  func features()->String {
    return "Maruti Suv is " +  super.features()
    }
}




// Factory Class For Hyundai Company
class HyundiaCarFactory: AbstractCarFactory {
    
    func buildHatchBackCar()->HatchBack {
        return HyundiaHatchBack()
    }
    func buildSedanCar()->Sedan {
        return HyundiaSedan()
    }
    func buildSuvCar()->Suv {
        return HyundiaSuv()
    }
}



class HyundiaHatchBack:HatchBack{
    
  override  func type() -> CarTypes {
        return .HatchBack
    }
    
  override  func seatAvailble() -> Int {
        return 5
    }
    
   override func features()->String {
        return "Hyundai HatchBack is " +  super.features()
    }
}


class HyundiaSedan:Sedan{

  override  func type() -> CarTypes {
        return .Sedan
    }
    
  override  func seatAvailble() -> Int {
        return 6
    }
    
 override   func features()->String {
    return "Hyundai Sedan is " +  super.features()
    }
}

class HyundiaSuv:Suv{

 override   func type() -> CarTypes {
        return .Suv
    }
    
  override  func seatAvailble() -> Int {
        return 7
    }
    
   override func features()->String {
    return "Hyundai Suv is " +  super.features()
    }
}






//Usage

let carbuilder =  CarBuilder()

let marutiFactory = carbuilder.getCarFactory(forComapany: .Maruti)
let marutiHatchback = marutiFactory.buildHatchBackCar()
print(marutiHatchback.features())

let marutiSedan = marutiFactory.buildSedanCar()
print(marutiSedan.features())

let marutiSuv = marutiFactory.buildSuvCar()
print(marutiSuv.features())




let hyundaiFactory =  carbuilder.getCarFactory(forComapany: .Maruti)
let hyundaiHatchback = hyundaiFactory.buildHatchBackCar()
print(hyundaiHatchback.features())

let hyundaiSedan = hyundaiFactory.buildSedanCar()
print(hyundaiSedan.features())

let hyundaiSuv = hyundaiFactory.buildSuvCar()
print(hyundaiSuv.features())



