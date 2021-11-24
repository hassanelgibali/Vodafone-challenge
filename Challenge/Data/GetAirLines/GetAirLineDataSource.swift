//
//  GetAirLineDataSource.swift
//  Challenge
//
//  Created by Hassan on 22/11/2021.
//

import Foundation
protocol GetAirLineDataSource {
    
    func getAirLine(requestValue: RequestValues,compilationHandler:@escaping (Any?,Error?) -> Void)
}
