//
//  AddAirLineRepository.swift
//  Challenge
//
//  Created by Hassan on 23/11/2021.
//

import Foundation
class AddAirLinesRepository: Repository
{
    // MARK: - Shared Instance
    private static var addAirLinesRepository: AddAirLinesRepository?
    
    // MARK: - data source Instance
    private final var remoteDataSource: AddAirLineDataSource?
    
    // MARK: - get Shared Instance
    static func addAirLinesRepository(remoteDataSource: AddAirLineDataSource ) -> AddAirLinesRepository{
        
        if addAirLinesRepository == nil {
            addAirLinesRepository = AddAirLinesRepository(remoteDataSource: remoteDataSource)
        }
        
        return addAirLinesRepository!
    }
   private init(remoteDataSource: AddAirLineDataSource) {
        
        self.remoteDataSource = remoteDataSource
    }
    
    
    // MARK: - implement Repository Protocol
    
    func getData(requestValue: RequestValues, compilationHandler:@escaping (ResponseValues?,Error?) -> Void){
        
        remoteDataSource?.addNewAirLine(requestValue: requestValue, compilationHandler: { (response, error) in
            
            if Reachability.isConnectedToNetwork() {
                guard let data = response as? Data else { return }
                
                do {
                    let response = try! JSONDecoder().decode(AddNewAirlinesModel.self, from:data)
                    let  responseValue = AddNewAirLineResponseValues.init(result:response)
                    compilationHandler(responseValue,error)

                    
                                    
                }
                catch {
                    print("JSONSerialization error:")
                }

            }else{
                let  responseValue = GenricResponseValues.init(message:"no Internet")
                compilationHandler(responseValue ,error)

            }
            
        }
        )
        
    }
}
