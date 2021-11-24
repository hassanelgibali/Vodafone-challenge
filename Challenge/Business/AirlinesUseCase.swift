//
//  AirlinesUseCase.swift
//  Challenge
//
//  Created by Hassan on 22/11/2021.
//

import Foundation
struct AirlinesUseCase: UseCase {
    var repository: Repository
    func executeUseCase(requestValues: RequestValues, compilationHandler:@escaping (ResponseValues?,Error?) -> Void){
        repository.getData(requestValue: requestValues, compilationHandler: compilationHandler)
        
    }
}

struct AirlinesRequestValues: RequestValues{
 
}

struct AirlinesResponseValues: ResponseValues {
  let result:AirlinesModel


}
