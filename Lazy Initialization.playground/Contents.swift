//: Playground - noun: a place where people can play

import UIKit



class CarList {
    
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
