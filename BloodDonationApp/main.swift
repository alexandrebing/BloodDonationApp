//
//  main.swift
//  BloodDonationApp
//
//  Created by Alexandre Scheer Bing on 14/03/19.
//  Copyright © 2019 Alexandre Scheer Bing. All rights reserved.
//

import Foundation
import Darwin

var repository = PopulateApp()

while true{
    
    print("""
    Welcome to BloodDonate App

        I am:
        1 - a Donor
        2 - an Hospital

    *** Press \"q" at any time to quit this application
    """)// O Negative App - because it is the universal donor
    
    let input = readLine()
    if input == "q"{
        print("Thank you, see you later!")
        exit(0)
    } else if input == "1"{
        userMainScreen()
    } else if input == "2"{
        hospitalMainScreen()
    }
}





//Repository.init(listPatients: [Tereza, Joao, Nadia, Luiz, Cleide, Alexandre], listHospitals: [santaCasa, Clinicas], listDonors: [Andre, Camila, Fernanda])


