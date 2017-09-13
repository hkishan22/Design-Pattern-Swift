//: Playground - noun: a place where people can play

import UIKit

protocol CarPlan {
    
    func setCarBody(body:String)
    func setCarEngine(engine:String)
    func setCarWheel(carWheel:String)
    func setCarPaint(color:String)
}

class Car: CarPlan,CustomStringConvertible {
    
    private var carBody :String?
    private var carEngine :String?
    private var carWheel :String?
    private var carPaintColor :String?

    func setCarPaint(color: String) {
        self.carPaintColor = color
    }

    func setCarWheel(carWheel: String) {
        self.carWheel = carWheel

    }

    func setCarEngine(engine: String) {
        self.carEngine = engine

    }

    func setCarBody(body: String) {
        self.carBody = body

    }
    
    var description:String {
        return  "Built Car has \(self.carBody) with \(self.carPaintColor) color with \(self.carWheel) Wheel and  \(self.carEngine) Engine"
    }

}

// Abstract Class of Builder Object
protocol CarBuilder {
    
    func buildCarBody()
    func buildCarEngine()
    func buildCarWheel()
    func buildCarPaint()
    func getCar()->Car
}

// Implemeting Protocol to build a Builder Class for Old Red Car
class OldRedCarBuilder: CarBuilder {

    private var car:Car!
    
    init() {
        self.car = Car()
    }
    
    func buildCarBody(){
        self.car.setCarBody(body: "Old Body")
    }
    
    func buildCarEngine(){
        self.car.setCarEngine(engine: "1.0L petrol Engine")
    }
    
    func buildCarWheel(){
        self.car.setCarWheel(carWheel: "Non Alloy Wheel")
    }
    
    func buildCarPaint(){
        self.car.setCarPaint(color: "Red")
    }
    
    func getCar()->Car {
        return self.car!
    }
}

// Implemeting Protocol to build a Builder Class for New Blue Car
class NewBlueCarBuilder: CarBuilder {
    
    private var car:Car!
    
    init() {
        self.car = Car()
    }
    
    func buildCarBody(){
        self.car.setCarBody(body: "New Body")
    }
    
    func buildCarEngine(){
        self.car.setCarEngine(engine: "3.0L Diesel Engine")
    }
    
    func buildCarWheel(){
        self.car.setCarWheel(carWheel: "Alloy Wheel")
    }
    
    func buildCarPaint(){
        self.car.setCarPaint(color: "Blue")
    }
    
    func getCar()->Car {
        return self.car!
    }
}

// Class that use Builder Object to get a New object
// In this case Engineet user Car builder to make a new Car
class CarEngineer {
    
    private var carBuilder : CarBuilder
    
    init(withCarbuilder builder: CarBuilder) {
        self.carBuilder = builder
    }
    
    func getCar()->Car {
        return self.carBuilder.getCar()
    }
    
    func makeCar(){
        self.carBuilder.buildCarBody()
        self.carBuilder.buildCarPaint()
        self.carBuilder.buildCarWheel()
        self.carBuilder.buildCarEngine()
    }
}



//USAGE

let oldCarbuidler = OldRedCarBuilder()

let engineer = CarEngineer(withCarbuilder: oldCarbuidler)
engineer.makeCar()

let oldCar  = engineer.getCar()
print(oldCar.description)


let newCarbuidler = NewBlueCarBuilder()
let engineer2 = CarEngineer(withCarbuilder: newCarbuidler)
engineer2.makeCar()

let newCar  = engineer2.getCar()
print(newCar.description)
