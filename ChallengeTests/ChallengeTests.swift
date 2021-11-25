//
//  ChallengeTests.swift
//  ChallengeTests
//
//  Created by Hassan on 22/11/2021.
//

import XCTest
@testable import Challenge

class ChallengeTests: XCTestCase {
    
    var addNewAirLineRepo: Repository?
    
    override func setUp() {
        addNewAirLineRepo = AddAirLinesRepository.addAirLinesRepository(remoteDataSource: AddAirLinesRemoteDataSource.sharedInstance)
    }

    func testAddAirLine() {
        addNewAirLineRepo!.getData(requestValue: AddNewAirLineRequestValues(name: "rasdsg", country: "rdg", slogan: "zg", headquaters: "zgxf"), compilationHandler: {json , error in
            
            XCTAssertNil(json)
            guard let json = json else {
                XCTFail()
                return
            }
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
                let addNewAirLineResponse = try! JSONDecoder().decode([Int].self, from:jsonData)
                XCTAssertNotNil(addNewAirLineResponse)
                
            } catch  {
                XCTFail(error.localizedDescription)
            }

            
        })

        }

    }
    
  

 
