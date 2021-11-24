//
//  AirlinesModel.swift
//  Challenge
//
//  Created by Hassan on 22/11/2021.
//

import Foundation

// MARK: - AirlinesModelElement
struct AirlinesModelElement: Codable {
    var id: Int?
    var name, country: String?
    var logo: String?
    var slogan, headQuaters, website, established: String?
    var requestedID: String?

    enum CodingKeys: String, CodingKey {
        case id, name, country, logo, slogan
        case headQuaters = "head_quaters"
        case website, established
        case requestedID = "requestedId"
    }
}



typealias AirlinesModel = [AirlinesModelElement]
