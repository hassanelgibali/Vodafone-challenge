//
//  AlamofireClient.swift
//  Challenge
//
//  Created by Hassan on 22/11/2021.
//

import Foundation
import Alamofire

struct AlamofireClient:APIClient {

    
    
    //MARK: Shared Instance
    
    static let sharedInstance =  AlamofireClient()
    
    fileprivate init() {
        
    }

    func executeRequest(url:String,method:HTTPMethod,parameters: [String:Any]?,header : HTTPHeaders,compilationHandler:@escaping (Any?,Error?) -> Void){
    
        AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: header ).responseJSON { (response:DataResponse<Any, AFError>) in
            
            switch(response.result) {
            case .success(_):
                if let data = response.data{
                    print(response.result)
                    compilationHandler(data,nil)
                }
                break
                
            case .failure(_):
                compilationHandler(response.response?.statusCode,response.error as! Error)
                print(response.result)
                break
                
            }
        }
    }

    
    
}
