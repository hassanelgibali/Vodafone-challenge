//
//  AddNewAirLineViewModel.swift
//  Challenge
//
//  Created by Hassan on 23/11/2021.
//

import Foundation
class AddNewAirLineViewModel:NSObject {
    
    var addNewAirLineUseCase: AddNewAirLineUseCase?
   

    
    private(set) var newAirLinesData : AddNewAirlinesModel! {
        didSet {
            self.bindAddNewAirLineViewModelToController()
        }
    }

    private(set) var message : String! {
        didSet {
            self.bindAddNewAirLineViewModelToController()
            
        }
    }

    
    var bindAddNewAirLineViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
      
        addNewAirLineUseCase = Factory.addAirLinesUseCase()
        
    }
    
    func getAirLinesData(name:String, country:String, slogan:String, headquaters:String)
    
    {
        addNewAirLineUseCase?.executeUseCase(requestValues:AddNewAirLineRequestValues(name: name, country: country, slogan: slogan, headquaters: headquaters), compilationHandler: { [weak self] (response, error) in
            guard let responseValue = response as? AddNewAirLineResponseValues else{
                // TODO :// Handle any type of errors
                if let responseValue = response as? GenricResponseValues {
                    self?.message = responseValue.message
                }

                return
            }
            self?.message = "Success"
        })
    }
    

}
