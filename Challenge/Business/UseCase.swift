//
//  UseCase.swift
//  Challenge
//
//  Created by Hassan on 22/11/2021.
//

import Foundation
protocol UseCase {
    func executeUseCase(requestValues: RequestValues, compilationHandler:@escaping (ResponseValues?,Error?) -> Void)
    
    
}

protocol RequestValues {
    
}


protocol ResponseValues {

}

struct GenricResponseValues: ResponseValues {
    let message: String
    
}
