//
//  Model.swift
//  ShelterSafe
//
//  Created by Onik Houqe on 12/28/22.
//

import Foundation



struct TaskEntry: Codable {
    let id: Int
    let title: String
    let completed: Bool
}
