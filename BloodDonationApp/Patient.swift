//
//  Patient.swift
//  BloodDonationApp
//
//  Created by Alexandre Scheer Bing on 14/03/19.
//  Copyright © 2019 Alexandre Scheer Bing. All rights reserved.
//

import Foundation

struct Patient: Person, Receiver{
    let name: String
    let cpf: Int
    let bloodType: BloodType
    var hospital: Hospital
    var bloodNeeded: Bool
    
    mutating func alertBloodNeed(bloodType: [BloodType]) {
        self.bloodNeeded = true
    }
    
    mutating func endAlert() {
        self.bloodNeeded = false
    }
}
