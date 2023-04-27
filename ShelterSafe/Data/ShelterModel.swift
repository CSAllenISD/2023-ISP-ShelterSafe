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
    let PopulationCapacity : String
    let MaxCapacity : Int
}



enum Severity {
    case Minor
    case Moderate
    case Severe
}

enum FoodAvailability {
    case Shortage
    case Moderate
    case Surplus
}

enum PopulationCapacity {
    case Empty
    case Medium
    case Full
    case Overfilled
}

