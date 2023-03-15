//
//  RawData.swift
//  ShelterSafe
//
//  Created by Onik Hoque on 3/15/23.
//

import Foundation
import UIKit
import SwiftUI


class RawData {
    func getUsers(completion:@escaping ([User]) -> ()) {
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                let users = try! JSONDecoder().decode([User].self, from: data!)
                print(users)
                
                DispatchQueue.main.async {
                    completion(users)
                }
            }
            .resume()
        }

}




