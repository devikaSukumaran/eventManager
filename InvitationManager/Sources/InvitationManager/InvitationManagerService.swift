//
//  InvitationManagerService.swift
//  EventManager
//
//  Created by Devika Sukumaran on 07/05/20.
//  Copyright © 2020 Devika Sukumaran. All rights reserved.
//

import Foundation

var invitedCustomersList : [Customer]?
let fileWithCustomerDetails : String = "customers", typeOfCustomerDetailsFile : String = "txt"
let officeLocationLatitude : Double = 53.339428, officeLocationLongitude : Double = -6.257664

public struct InvitationManagerService {
    //Returns the list of customer invited for food and drinks
    public static func getGuestList()-> [[String: Any]] {
        let serialiser = JSONSerializer()
        let distanceCalculator = DistanceCalculator()
        let customerController = CustomerController(with: serialiser, distanceCalculator: distanceCalculator)
        let list = customerController.getInvitationListFromCustomerRecords().compactMap({$0.output})
        return list
    }
}
