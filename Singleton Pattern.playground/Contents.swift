//: Playground - noun: a place where people can play

import UIKit

class SingletonClass {
    
   static let sharedInstance  = SingletonClass()
    
    var count: Int!
    
    private init (){
        
    }
}


let singletonVar1 = SingletonClass.sharedInstance
singletonVar1.count = 5
print(singletonVar1.count)               //5


let singletonVar2 = SingletonClass.sharedInstance
print(singletonVar2.count);              //It is also 5 Since Singleton Class have only one instace

