//
//  Repository.swift
//  BloodDonationApp
//
//  Created by Alexandre Scheer Bing on 14/03/19.
//  Copyright © 2019 Alexandre Scheer Bing. All rights reserved.
//

import Foundation

public class Repository {
    var listPatients : [Patient] = []
    var listHospitals : [Hospital] = []
    var listDonors : [Donor] = []

    init(listPatients : [Patient], listHospitals : [Hospital], listDonors : [Donor]) {
        self.listPatients = listPatients
        self.listHospitals = listHospitals
        self.listDonors = listDonors
    }
    
    func listPatientsNeeded () -> String{
        // montar tratamento throw para variavel result ""
        var result = ""
        
        for patient in listPatients{
            if patient.bloodNeeded{
                result += "\(patient.name) needed \(patient.bloodType) blood type"
            }
        }
        for hospital in listHospitals{
            if hospital.bloodNeeded{
                result += "\(hospital.institutionName) needed \(hospital.bloodTypesNeeded) this blood type"
            }
        }
        
        return result
    }
    
    func getHospitalList()-> String{
        var result = "Hospitals in need of donation: \n"
        for item in listHospitals{
            result += """
                Identificador: \(item.idNumber) - \(item.institutionName)
                    
                """
        }
                return result
    }
    
    func newDonor(donor: Donor){
        self.listDonors.append(donor)
    }
    
    func findDonor(userId: Int) -> Donor {
    return self.listDonors.first{ $0.cpf == userId} ?? Donor(name: "John Doe", cpf: 000000000, bloodType: .abPositive, donations: 0, weight: 80.0, lastDonation: Date())
    }
    
    func findHospital(hospitalId: Int) -> Hospital{
        return self.listHospitals.first{ $0.idNumber == hospitalId }!
    }
}
