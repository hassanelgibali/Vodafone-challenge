//
//  APIClient.swift
//  Challenge
//
//  Created by Hassan on 22/11/2021.
//

import Foundation
import Alamofire

protocol APIClient{
    
    func executeGetRequest(url:String,parameters: [String:Any]?,header : HTTPHeaders,compilationHandler:@escaping (Any?,Error?) -> Void)
    
    func executePostRequest(url:String,parameters: [String:Any]?,header : HTTPHeaders,compilationHandler:@escaping (Any?,Error?) -> Void)
}
