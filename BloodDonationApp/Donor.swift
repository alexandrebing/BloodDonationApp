//
//  Donor.swift
//  BloodDonationApp
//
//  Created by Alexandre Scheer Bing on 14/03/19.
//  Copyright © 2019 Alexandre Scheer Bing. All rights reserved.
//

import Foundation

struct Donor: Person{
    let name: String
    let cpf: Int
    let bloodType: BloodType
    var donations: Int
    var weight: Double
    var lastDonation: Date
    
    func isAbleToDonate() -> Bool{
        let myDate = Calendar.current
        let currentDate = myDate.startOfDay(for: Date())
        let interval = myDate.dateComponents([.day], from: lastDonation, to: currentDate).day
        if self.weight >= 50.00 && interval! > 90{
            return true
        }
        return false
    }
    
    mutating func Donate(hospitalId: Int, repository: Repository){
        let hospital = repository.listHospitals.first{$0.idNumber == hospitalId}
        print("""
            \(self.name) registered for donation at \(hospital!.institutionName)
            
            """)
        self.donations += 1
        self.lastDonation = Date.init()
    }
}
