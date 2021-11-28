//
//  AddAirLineRemoteDataSource.swift
//  Challenge
//
//  Created by Hassan on 23/11/2021.
//

import Foundation
import Alamofire
class AddAirLinesRemoteDataSource: AddAirLineDataSource {
    
    static let sharedInstance = AddAirLinesRemoteDataSource()
    let apiClient = AlamofireClient.sharedInstance
    
    // MARK: - implement ProfileDataSource Protocol

        func addNewAirLine(requestValue: RequestValues,compilationHandler:@escaping (Any?,Error?) -> Void){
            let requstValue = requestValue as! AddNewAirLineRequestValues
        
            let parameters = [
                "name": requstValue.name,
                "country": requstValue.country,
                "slogan":requstValue.slogan,
                "head_quaters":requstValue.headquaters,
                ]as [String : Any]
            
            let url = Constants.airLinesBaseURL
                
            var headers: HTTPHeaders = [:]
            headers["Accept"] = "application/json"
                

            apiClient.executeRequest(url: url, method: .post, parameters: parameters, header: headers, compilationHandler: compilationHandler)
            }
            

}
