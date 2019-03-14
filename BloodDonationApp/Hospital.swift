//
//  Hospital.swift
//  BloodDonationApp
//
//  Created by Alexandre Scheer Bing on 14/03/19.
//  Copyright © 2019 Alexandre Scheer Bing. All rights reserved.
//

import Foundation

struct Hospital: Receiver{
    var idNumber: Int
    var cep: Int
    var addressNumber: Int
    var institutionName: String
    var phone: String
    var website: String
    var bloodNeeded: Bool
    var bloodTypesNeeded: [BloodType]
    
    mutating func alertBloodNeed(bloodType: [BloodType]) {
        self.bloodTypesNeeded = bloodType
        self.bloodNeeded = true
    }
    
    mutating func endAlert() {
        self.bloodNeeded = false
        self.bloodTypesNeeded = []
    }
    
    mutating func editAlert(bloodType: [BloodType]){
        self.bloodTypesNeeded = bloodType
    }
}
