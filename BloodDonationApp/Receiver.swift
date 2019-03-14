//
//  Receiver.swift
//  BloodDonationApp
//
//  Created by Alexandre Scheer Bing on 14/03/19.
//  Copyright © 2019 Alexandre Scheer Bing. All rights reserved.
//

import Foundation

protocol Receiver {
    var bloodNeeded: Bool {get}
    
    mutating func alertBloodNeed(bloodType : [BloodType])
    mutating func endAlert()
}
