
Design Patterns With Swift 3.0
-------------------------------------------------------------------------

👷 Project maintained by: [@h.kishan22](https://www.linkedin.com/in/hari-kishan-upadhyay-bb58b22b/) (Hari Kishan Upadhyay)

## Table of Contents

* [Behavioral](#behavioral)
* [Creational](#creational)
* [Structural](#structural)


```swift

 Behavioral |
 [Creational](Creational) |
 [Structural](Structural)
```


Creational
==========

> In software engineering, creational design patterns are design patterns that deal with object creation mechanisms, trying to create objects in a manner suitable to the situation. The basic form of object creation could result in design problems or added complexity to the design. Creational design patterns solve this problem by somehow controlling this object creation.
>
>**Source:** [wikipedia.org](http://en.wikipedia.org/wiki/Creational_pattern)


```swift

```

🏭 Factory Method
-----------------

The factory pattern is used to replace class constructors, abstracting the process of object generation so that the type of the object instantiated can be determined at run-time.

### Example

```swift

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


// Factory Class
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
```

### Usage

```swift

let  newSedan  = CarFactory.makeCar(type: .Sedan)
print(newSedan.seatAvailble())
print(newSedan.type())
print(newSedan.features())


let  newHatchback  = CarFactory.makeCar(type: .HatchBack)
print(newHatchback.seatAvailble())
print(newHatchback.type())
print(newHatchback.features())

```



🌰 Abstract Factory Pattern
-----------------

The abstract factory pattern is used to provide a client with a set of related or dependant objects. The "family" of objects created by the factory are determined at run-time.


### Example

```swift

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

```
🃏 Prototype
------------

The prototype pattern is used to instantiate a new object by copying all of the properties of an existing object, creating an independent clone. This practise is particularly useful when the construction of a new object is inefficient.

### Example

```swift
class Service {
    var serviceName:String
    
    init(serviceName:String) {
        self.serviceName = serviceName
    }
}


class CarPart {
    var partName:String
    
    init(partName:String) {
        self.partName = partName
    }
}


class Mechanic {
    var name:String
    
    init(name:String) {
        self.name = name
    }
}



// Prototype Class
class ServiceBill: CustomStringConvertible{
    
    var customerName:String?
    var customerAddress:String?
    var customerCarNumber:String?

    var price:Double
    var services:[Service]
    var partsChange:[CarPart]
    var mechanicWorked:Mechanic
    
    init(price:Double,services:[Service],partsChange:[CarPart],mechanicWorked:Mechanic){
        self.price = price
        self.services = services
        self.partsChange = partsChange
        self.mechanicWorked = mechanicWorked
    }
    
    
    func clone() -> ServiceBill {
        
        return ServiceBill(price: self.price, services: self.services, partsChange: self.partsChange, mechanicWorked: self.mechanicWorked)
    }
    var description:String {
        return "Service Bill for Customer \n\n \(self.customerName) with address =  \(self.customerAddress) with Car Number = \(self.customerCarNumber) is charged with Rs. \(self.price) for services \(self.services.map{$0.serviceName}) and changed parts \(self.partsChange.map{$0.partName}) done  by our mechanic \(self.mechanicWorked.name) "
    }
}



//Usage
let oilChangeService = Service(serviceName: "Oil Change")
let carWashService = Service(serviceName: "Car Wash Service")


let oilFilterChange = CarPart(partName: "Oil Filter")
let airFilterChange = CarPart(partName: "Air Filter")


let mechanic = Mechanic(name:"Hari Kishan")


// Made a prototype for Basic Service Bill
let basicServiceBill  = ServiceBill(price: 1200, services: [oilChangeService,carWashService], partsChange: [oilFilterChange,airFilterChange], mechanicWorked: mechanic)


// Creatig a clone of  the prototype and customizing it as per cusotmer
let  serviceBillForCustomer1 = basicServiceBill.clone()
serviceBillForCustomer1.customerName = "Hari Kishan"
serviceBillForCustomer1.customerAddress = "New Delhi"
serviceBillForCustomer1.customerCarNumber = "DL 11234"
print(serviceBillForCustomer1.description)


// Creatig a clone of  the prototype and customizing it as per cusotmer
let  serviceBillForCustomer2 = basicServiceBill.clone()
serviceBillForCustomer2.customerName = "Lakshaya"
serviceBillForCustomer2.customerAddress = "Faridabad"
serviceBillForCustomer2.customerCarNumber = "HR 8990"
print(serviceBillForCustomer2.description)
```
👷 Builder
----------

The builder pattern is used to create complex objects with constituent parts that must be created in the same order or using a specific algorithm. 
An external class controls the construction algorithm.

### Example

```swift

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
```

💍 Singleton
------------

The singleton pattern ensures that only one object of a particular class is ever created.
All further references to objects of the singleton class refer to the same underlying instance.
There are very few applications, do not overuse this pattern!

### Example:

```swift

class SingletonClass {
    
   static let sharedInstance  = SingletonClass()
    
    var count: Int!
    
    private init (){
        
    }
}


```

### Usage:

```swift

let singletonVar1 = SingletonClass.sharedInstance
singletonVar1.count = 5
print(singletonVar1.count)               //5


let singletonVar2 = SingletonClass.sharedInstance
print(singletonVar2.count);              //It is also 5 Since Singleton Class have only one instace

```

😴 Lazy Initialization
----------

Lazy initialization (also sometimes called lazy instantiation, or lazy loading) is a technique for delaying the creation of an object or some other expensive process until it’s needed. When programming for iOS, this is helpful to make sure you utilize only the memory you need when you need it.
Swift added direct support for it with the ### lazy attribute

### Example

```swift
ass CarList {
    
    //Now in Swift, this can all be simplified down to one line:
    lazy var carNames = [String]()
    
    
    //If you wanted to add logic to your lazy initialization, Swift makes this easy by letting you define a closure after your lazy property:
    lazy var carModels: [String] = {
        var temporaryCarModels = [String]()
        temporaryCarModels.append("Alto")
        return temporaryCarModels
    }()

    
    
    //If you prefer, you can also lazily initiate your property using an instance method:
    lazy var carCompaniesName: [String] = self.companiesName()
    
    func companiesName() -> [String] {
        var company = ["Maruti"]
        return company
    }

    
    
    //If you prefer, you can also lazily initiate your property using an Class method:
    lazy var carTypes: [String] = CarList.carBuildTypes()
    
    class func carBuildTypes() -> [String] {
        var types = ["Hatchback","Sedan","Suv"]
        return types
    }

    init() {
    }
}


let list = CarList()
print(list.carNames)
print(list.carModels)
print(list.carCompaniesName)
print(list.carTypes)

/* //Output
[]
["Alto"]
["Maruti"]
["Hatchback", "Sedan", "Suv"]
 */

```


###

Info
====

📖 Descriptions from: [Gang of Four Design Patterns Reference Sheet](http://www.blackwasp.co.uk/GangOfFour.aspx)


```swift
