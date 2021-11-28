//
//  APIClient.swift
//  Challenge
//
//  Created by Hassan on 22/11/2021.
//

import Foundation
import Alamofire

protocol APIClient{
    
   func executeRequest(url:String,method:HTTPMethod,parameters: [String:Any]?,header : HTTPHeaders,compilationHandler:@escaping (Any?,Error?) -> Void)
}


