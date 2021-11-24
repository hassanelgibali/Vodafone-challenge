//
//  GetAirLinesRemoteDataSource.swift
//  Challenge
//
//  Created by Hassan on 22/11/2021.
//

import Foundation
import Alamofire
class GetAirLinesRemoteDataSource: GetAirLineDataSource {
    
    static let sharedInstance = GetAirLinesRemoteDataSource()
    let apiClient = AlamofireClient.sharedInstance
    
    // MARK: - implement ProfileDataSource Protocol

        func getAirLine(requestValue: RequestValues,compilationHandler:@escaping (Any?,Error?) -> Void){
            let url = Constants.airLinesBaseURL
                
            var headers: HTTPHeaders = [:]
            headers["Accept"] = "application/json"
                

                apiClient.executeGetRequest(url: url, parameters: nil, header: headers, compilationHandler: compilationHandler)
            }
            

}
