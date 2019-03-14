//
//  UserExecutionFlow.swift
//  BloodDonationApp
//
//  Created by Alexandre Scheer Bing on 14/03/19.
//  Copyright © 2019 Alexandre Scheer Bing. All rights reserved.
//

import Foundation
import Darwin

func userMainScreen(){
    while true{
        print("""
            \(repository.listPatientsNeeded())
            
            1 - Make a blood donation
            2 - Ask for a blood donation
            3 - Exit
            
            *Press \"r" at any time to return to previous screen
            **Press\"q" at any time to quit the application
            """)
        let input = readLine()
        switch input{
        case "1":
            donorVerification()
        case "2":
        return //metodo para solicitar doacao
        case "3":
            exit(0)
        case .none:
            fatalError("Opção inválida")
        case .some(_):
            print("Some")
        }
    }
}

func newDonor(){
    var question = """
        Welcome to the BloodDonation App
        For registration, please follow the instructions below:
        
            What is your full name:
    """
    var input = questionAndAnswer(question: question)
    let name: String = input
    question = """
    What is your blood type? Select an answer
    1 - A+
    2 - A-
    3 - AB+
    4 - AB-
    5 - B+
    6 - B-
    7 - O+
    B - O-
    """
    input = questionAndAnswer(question: question)
    let bloodType: BloodType
    switch input {
    case "1":
        bloodType = .aPositive
    case "2":
        bloodType = .aNegative
    case "3":
        bloodType = .abPositive
    case "4":
        bloodType = .abNegative
    case "5":
        bloodType = .bPositive
    case "6":
        bloodType = .bNegative
    case "7":
        bloodType = .oPositive
    case "8":
        bloodType = .oNegative
    default:
        bloodType = .abPositive
        print("Error while selecting")
        newDonor()
    }
    question = """
    What is your unique identification number (cpf)? Use digits only.
    """
    input = questionAndAnswer(question: question)
    let cpf = Int(input)
    question = """
    And finally, what is your weight? Use only digits.
    """
    input = questionAndAnswer(question: question)
    let weight: Double = Double(input)!
    var donor = Donor(name: name, cpf: cpf!, bloodType: bloodType, donations: 0, weight: weight, lastDonation: Date())
    repository.newDonor(donor: donor)
    welcomeDonor(&donor)
}

func searchRegisteredDonor(){
    while true {
        print("""
        Insert your ID (CPF):
    """)
        let input = readLine()
        let cpf = Int(input ?? "0") // turn cpf string into an integer and prevent errors
        var donor = repository.findDonor(userId: cpf!)
        welcomeDonor(&donor)
    }
}

func welcomeDonor(_ donor: inout Donor){
    print("""
        
        Welcome \(donor.name)
        
        This is your data so far:
        Donations: \(donor.donations)
        CPF: \(donor.cpf)
        BloodType: \(donor.bloodType.description)
        Weight: \(donor.weight)
        Last Donation: \(donor.lastDonation)
        
        """)
    //let user = findDonor(cpf)
    confirmeDonation(donor: &donor)
}

func donorVerification(){
    print("""
        Make blood donation

            1 - I already am registered
            2 - New donor

    """)
    let input = readLine()
    switch input {
    case "1":
        searchRegisteredDonor()
    case "2":
        newDonor()
    default:
        fatalError("Opção inváilida")
    }
}

func confirmeDonation(donor: inout Donor) {
    
    print("""
        \(repository.getHospitalList())
        
        Insert the id of the hospital you wish to donate to:
        """)
    var input = readLine()
    let hospitalId = Int(input!)
    print("""
        Would you like to confirm your donation to \(repository.findHospital(hospitalId: hospitalId!).institutionName)
    """)
    input = readLine()
    donor.Donate(hospitalId: hospitalId!, repository: repository)
}

func questionAndAnswer(question: String)->String{
    print(question)
    let input = readLine()
    return input!
}
