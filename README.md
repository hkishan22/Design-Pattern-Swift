
Design Patterns With Swift 3.0
-------------------------------------------------------------------------

👷 Project maintained by: [@nsmeme](https://www.linkedin.com/in/hari-kishan-upadhyay-bb58b22b/) (Hari Kishan Upadhyay)

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


Info
====

📖 Descriptions from: [Gang of Four Design Patterns Reference Sheet](http://www.blackwasp.co.uk/GangOfFour.aspx)


```swift
