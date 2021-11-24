//
//  HomeViewModel.swift
//  Challenge
//
//  Created by Hassan on 22/11/2021.
//

import Foundation
class HomeViewModel:NSObject {
    
    var airLinesUseCase: AirlinesUseCase?
   

    
    private(set) var airLinesData : AirlinesModel! {
        didSet {
            self.bindHomeViewModelToController()
        }
    }

    private(set) var errorMessage : String! {
        didSet {
            self.bindHomeViewModelToController()
            
        }
    }

    
    var bindHomeViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
      
        airLinesUseCase = Factory.getAirLinesUseCase()
        getAirLinesData()
    }
    
    func getAirLinesData()
    {
        airLinesUseCase?.executeUseCase(requestValues:AirlinesRequestValues(), compilationHandler: { [weak self] (response, error) in
            guard let responseValue = response as? AirlinesResponseValues else{
                // TODO :// Handle any type of errors
                self?.errorMessage = "A problem with AirLines"
                return
            }
            self?.airLinesData = responseValue.result
        })
    }
    

}
