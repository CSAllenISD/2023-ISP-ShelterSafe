//
//  ShelterModel.swift
//  ShelterSafe
//
//  Created by Onik Hoque on 3/30/23.
//

import Foundation

struct Shelter: Codable {
    let id : Int
    let name : String
    let latitude : Double
    let longitude : Double
    let description: String
    let foodAvailability : String
    let populationCapacity : String
    let maxCapacity : Int
}


