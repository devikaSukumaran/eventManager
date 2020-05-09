//
//  OrganiserTests.swift
//  OrganiserTests
//
//  Created by Devika Sukumaran on 08/05/20.
//  Copyright © 2020 Devika Sukumaran. All rights reserved.
//

import XCTest
@testable import Organiser
@testable import InvitationManager

class OrganiserTests: XCTestCase {
    
    //Testing the location values of the customer who lives within 100km of the office location
    func testCustomerWithin100KM() throws {
        let latitudeInput = 53.1302756
        let longitudeInput = -6.2397222
        let officeLocationLatitude = 53.339428
        let officeLocationLongitude = -6.257664
        let output = DistanceCalculator().checkIfCustomerIsInvited(with: latitudeInput, longitude: longitudeInput, compareWithOfficeLocation: officeLocationLatitude, officeLocationLongitude: officeLocationLongitude)
        XCTAssertEqual(output, true, "Customer who lives within 100km scenario has failed")
        
    }
    //Testing the location values of the customer who lives outside 100km of the office location
    func testCustomerOutside100KM() {
          let latitudeInput = 51.92893
          let longitudeInput = -10.27699
          let officeLocationLatitude = 53.339428
          let officeLocationLongitude = -6.257664
        let output = DistanceCalculator().checkIfCustomerIsInvited(with: latitudeInput, longitude: longitudeInput, compareWithOfficeLocation: officeLocationLatitude, officeLocationLongitude: officeLocationLongitude)
          XCTAssertEqual(output, false, "Customer who lives outside 100km scenario has failed")
      }
}
