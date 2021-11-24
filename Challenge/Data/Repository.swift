//
//  Repository.swift
//  Challenge
//
//  Created by Hassan on 22/11/2021.
//

import Foundation

protocol Repository {
    
    func getData(requestValue: RequestValues, compilationHandler:@escaping (ResponseValues?,Error?) -> Void)
}
