//
//  Factory.swift
//  Challenge
//
//  Created by Hassan on 22/11/2021.
//

import Foundation
class Factory {
    
    static func getAirLinesUseCase() -> AirlinesUseCase
    {
        let repository = GetAirLinesRepository.getAirLinesRepository(remoteDataSource: GetAirLinesRemoteDataSource.sharedInstance)
        return AirlinesUseCase(repository: repository)
    }
    static func addAirLinesUseCase() -> AddNewAirLineUseCase
    {
        let repository = AddAirLinesRepository.addAirLinesRepository(remoteDataSource: AddAirLinesRemoteDataSource.sharedInstance)
        return AddNewAirLineUseCase(repository: repository)
    }
}
