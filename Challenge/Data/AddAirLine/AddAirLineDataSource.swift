//
//  AddAirLineDataSource.swift
//  Challenge
//
//  Created by Hassan on 23/11/2021.
//

import Foundation
protocol AddAirLineDataSource {
    
    func addNewAirLine(requestValue: RequestValues,compilationHandler:@escaping (Any?,Error?) -> Void)
}
