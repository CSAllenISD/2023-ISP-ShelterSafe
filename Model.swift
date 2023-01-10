//
//  Model.swift
//  ShelterSafe
//
//  Created by Onik Houqe on 12/29/22.
//

import Foundation

struct TaskEntry: Codable {
    let id: Int
    let title: String
    let completed: Bool
}
