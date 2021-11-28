//
//  ChallengeTests.swift
//  ChallengeTests
//
//  Created by Hassan on 22/11/2021.
//

import XCTest
import Alamofire

@testable import Challenge

class ChallengeTests: XCTestCase {
    
    var viewModel:AddNewAirLineViewModel!
   

    override func setUp() {
       viewModel = AddNewAirLineViewModel()
    }
    
    override func  tearDown() {
        super.tearDown()
        viewModel = nil
    }

    func testAddAirLine() {

        
       

            let expectations = expectation(description: "The Response result match the expected results")
        
        viewModel.addNewAirLineUseCase?.executeUseCase(requestValues:AddNewAirLineRequestValues(name: "gvhvhg", country: "safa", slogan: "asf", headquaters: "asfa"), compilationHandler: {(response, error) in
            XCTAssertNotNil(response)
            
            
     
            //XCTAssertNil(response)
            expectations.fulfill()

            
           

            })
        waitForExpectations(timeout: 10, handler: { (error) in
            if let error = error {
                print("Failed : \(error.localizedDescription)")
            }

    

        

        })

    }
    
  
}
 
