//
//  Person.swift
//  BloodDonationApp
//
//  Created by Alexandre Scheer Bing on 14/03/19.
//  Copyright © 2019 Alexandre Scheer Bing. All rights reserved.
//

import Foundation

protocol Person {
    var name: String {get}
    var cpf: Int {get}
    var bloodType: BloodType {get}
}
