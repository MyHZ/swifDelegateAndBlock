//: Playground - noun: a place where people can play

import UIKit
import Foundation

class Viechle{
    var speed = 0
    var desc : String{
        return "\(speed)km/h"
    }
    func makeNoise(){
        
    }
}

class Bike:Viechle{
    var hasBasket = false
    
}

let aBike = Bike()
aBike.speed = 30
aBike.desc
aBike.hasBasket

class CRH: Viechle{
    override func makeNoise() {
        print("嘟嘟嘟")
    }
}

let crh = CRH()
crh.makeNoise()

