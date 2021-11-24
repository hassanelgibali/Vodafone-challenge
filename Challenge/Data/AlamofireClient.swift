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
    func executeGetRequest(url:String,parameters: [String:Any]?,header : HTTPHeaders,compilationHandler:@escaping (Any?,Error?) -> Void){
    
        
        AF.request(url, parameters: parameters, headers: header).responseJSON { (response:DataResponse<Any, AFError>) in
            switch(response.result) {
            case .success(_):
                if let data = response.data{
                    print(response.result)
                    compilationHandler(data,nil)
                }
                break
                
            case .failure(_):
                print (response.response?.description ?? "default value")
                compilationHandler(response.response?.statusCode,nil)

                break
                
            }
        }
    }
    
    func executePostRequest(url:String,parameters: [String:Any]?,header : HTTPHeaders,compilationHandler:@escaping (Any?,Error?) -> Void){
    
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header ).responseJSON { (response:DataResponse<Any, AFError>) in
            
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
