//
//  NWS_API_Model.swift
//  ShelterSafe
//
//  Created by Onik Houqe on 3/28/23.
//

import Foundation

struct NWSAlert: Codable {
    let type: String
    //let features: [NWSAlertFeature]
    let title: String
    let updated: String
}

struct NWSAlertFeature: Codable {
    let id : String
    let type: String
  //  let geometry: NWSAlertGeometry
  //  let properties: NWSAlertProperties
}
/*
struct NWSAlertGeometry: Codable {
    let type: String
    let coordinates: [Double]
}

struct NWSAlertProperties: Codable {
    let event: String
    let severity: String
    let certainty: String
    let headline: String
    let description: String
    let instruction: String
    let expires: String
    let sent: String
    let areaDesc: String
    let geocode: NWSAlertGeocode
}

struct NWSAlertGeocode: Codable {
    let same: [String]?
    let ugc: [String]?
}
*/

