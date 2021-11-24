//
//  ChallengeTests.swift
//  ChallengeTests
//
//  Created by Hassan on 22/11/2021.
//

import XCTest
@testable import Challenge

class ChallengeTests: XCTestCase {

    func testAddAirLine(repository:Repository) {
        repository.getData(requestValue: AddNewAirLineRequestValues(name: "", country: "", slogan: "", headquaters: "")){json , error in
            XCTAssertNil(error)
            guard let json = json else {
                XCTFail()
                return
            }
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
                let addNewAirLineResponse = try! JSONDecoder().decode(AddNewAirlinesModel.self, from:jsonData)
                XCTAssertNotNil(addNewAirLineResponse)
                
            } catch  {
                XCTFail(error.localizedDescription)
            }

        }
    }
    

}
