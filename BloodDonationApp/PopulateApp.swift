//
//  PopulateApp.swift
//  BloodDonationApp
//
//  Created by Alexandre Scheer Bing on 14/03/19.
//  Copyright © 2019 Alexandre Scheer Bing. All rights reserved.
//

import Foundation

func PopulateApp()-> Repository{
    
    let standardLastDonation = Calendar.current.date(byAdding: .month, value: -4, to: Date())
    
    //HOSPITAL
    var santaCasa = Hospital(idNumber: 1, cep: 90987122, addressNumber: 580, institutionName: "Santa Casa de Misericórdia", phone: "(51)3332-9089", website: "https://santacasa.org.br", bloodNeeded: true, bloodTypesNeeded: [.oNegative, .oPositive])
    
    var Clinicas = Hospital(idNumber: 2, cep: 91988321, addressNumber: 123, institutionName: "Hospital de Clinicas", phone: "(44) 3456-4443", website: "https://hopital-clinicas.org.br", bloodNeeded: true, bloodTypesNeeded: [.abNegative, .aNegative])
    
    //DONORS
    
    let Andre = Donor(name: "Andre", cpf: 92549326040, bloodType: .abNegative, donations: 0, weight: 53, lastDonation: Date())
    let Camila = Donor(name: "Camila", cpf: 76474114037, bloodType: .bNegative, donations: 0, weight: 70, lastDonation: Date())
    let Fernanda = Donor(name: "Fernanda", cpf: 44763631055, bloodType: .abPositive, donations: 0, weight: 48, lastDonation: standardLastDonation!)
    
    //PatientS
    
    let Tereza = Patient(name: "Tereza", cpf: 32202244077, bloodType: .abNegative, hospital: santaCasa, bloodNeeded: true)
    let Joao = Patient(name: "João", cpf: 21709422033, bloodType: .abPositive, hospital: santaCasa, bloodNeeded: true)
    let Nadia = Patient(name: "Nádia", cpf: 26579781009, bloodType: .oNegative, hospital: santaCasa, bloodNeeded: true)
    let Luiz = Patient(name: "Luiz", cpf: 76797972000, bloodType: .bPositive, hospital: Clinicas, bloodNeeded: true)
    let Cleide = Patient(name: "Cleide", cpf: 58048309025, bloodType: .oPositive, hospital: Clinicas, bloodNeeded: true)
    let Alexandre = Patient(name: "Alexandre", cpf: 76985120024, bloodType: .aNegative, hospital: Clinicas, bloodNeeded: true)
    
    let repository = Repository.init(listPatients: [Tereza, Joao, Nadia, Luiz, Cleide, Alexandre], listHospitals: [santaCasa, Clinicas], listDonors: [Andre, Camila, Fernanda])
    
    return repository
}
