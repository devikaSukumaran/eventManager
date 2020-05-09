//
//  CustomerController.swift
//  
//
//  Created by Devika Sukumaran on 08/05/20.
//

import Foundation


protocol InvitationListCreatable {
    func getInvitationListFromCustomerRecords() -> [Customer]
}

class CustomerController: InvitationListCreatable {
    
    private let serialiser: JSONSerializable
    private let distanceCalculator: DistanceCalculatable
    
    init(with serialiser: JSONSerializable,
         distanceCalculator: DistanceCalculatable) {
        self.serialiser = serialiser
        self.distanceCalculator = distanceCalculator
    }
    
    /*
     Fetches customer details, filter the customer details, and returns the data
     */
    func getInvitationListFromCustomerRecords() -> [Customer] {
        let customerList = getCustomerDetails(fromFile: fileWithCustomerDetails, ofType: typeOfCustomerDetailsFile)
        var invitationList : [Customer] = [Customer]()
        
        if customerList.count > 0 {
            invitationList = customerList.filter {
                distanceCalculator.checkIfCustomerIsInvited(with: $0.latitude ?? 0.0, longitude: $0.longitude ?? 0.0, compareWithOfficeLocation: officeLocationLatitude, officeLocationLongitude: officeLocationLongitude)
            }
        }
        
        return invitationList
    }
    
    /*
     Fetches customer details from the txt file in bundle and saves the data
     */
    private func getCustomerDetails(fromFile fileName: String, ofType type : String) -> [Customer] {
        var list = [Customer]()
        if let userRecords = serialiser.readFromTextFile(fileName: fileName, ofType: type) as? [[String: Any]] {
            list = userRecords.compactMap { Customer(with: $0) }.sorted(by: { $0.id < $1.id })
        }
        return list
    }
}
