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
    public static func getGuestList() {
        let customerController = CustomerController()
        let list = customerController.getInvitationListFromCustomerRecords()
        print(list)
    }
}
