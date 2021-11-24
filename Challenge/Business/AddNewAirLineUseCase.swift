//
//  AddNewAirLineUseCase.swift
//  Challenge
//
//  Created by Hassan on 23/11/2021.
//

import Foundation
struct AddNewAirLineUseCase: UseCase {
    var repository: Repository
    func executeUseCase(requestValues: RequestValues, compilationHandler:@escaping (ResponseValues?,Error?) -> Void){
        repository.getData(requestValue: requestValues, compilationHandler: compilationHandler)
        
    }
}

struct AddNewAirLineRequestValues: RequestValues{
    let name:String
    let country:String
    let slogan:String
    let headquaters:String
}

struct AddNewAirLineResponseValues: ResponseValues {
  let result:AddNewAirlinesModel

}
