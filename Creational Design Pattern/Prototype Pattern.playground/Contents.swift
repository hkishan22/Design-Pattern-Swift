//: Playground - noun: a place where people can play

import UIKit



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

