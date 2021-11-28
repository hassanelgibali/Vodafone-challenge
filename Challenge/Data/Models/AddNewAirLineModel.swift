//
//  AddNewAirLineModel.swift
//  Challenge
//
//  Created by Hassan on 23/11/2021.
//

import Foundation
 struct AddNewAirlinesModel: Codable {
    var name, country, logo, slogan: String?
    var headQuaters, website, established: String?
    var id: Int?
    var requestedID: String?

    enum CodingKeys: String, CodingKey {
        case name, country, logo, slogan
        case headQuaters = "head_quaters"
        case website, established, id
        case requestedID = "requestedId"
    }
}
