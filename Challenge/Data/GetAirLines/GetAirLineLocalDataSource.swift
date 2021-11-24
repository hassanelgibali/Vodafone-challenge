//
//  GetAirLineLocalDataSource.swift
//  Challenge
//
//  Created by Hassan on 23/11/2021.
//

import Foundation
import CoreData
class GetAirLineLocalDataSource: GetAirLineDataSource {
    static let sharedInstance = GetAirLineLocalDataSource()
    func getAirLine(requestValue: RequestValues, compilationHandler: @escaping (Any?, Error?) -> Void) {
        
        DispatchQueue.main.async {
            var airLinesData = [AirLinesData]()
            let fetchRequest:NSFetchRequest<AirLinesData> = AirLinesData.fetchRequest()
            do {
                airLinesData = try context.fetch(fetchRequest)
                if airLinesData.count == 0{
                    compilationHandler(nil,nil)
                }else{
                    compilationHandler(airLinesData,nil)
                }
                
            } catch  {
                print("no data")
                compilationHandler(nil,nil)
            }
        }
    }
}
