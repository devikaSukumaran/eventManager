//
//  Customer.swift
//  
//
//  Created by Devika Sukumaran on 07/05/20.
//

import Foundation

struct Customer {
    let id : Int
    let name : String?
    var isInvited : Bool
    private let latitude : Double?
    private let longitude : Double?
    /*
     Initialises the customer object
     */
    init(id: Int = 0, name: String?, latitude: Double?, longitude: Double?) {
        let isCustomerInvited = DistanceCalculator().checkIfCustomerIsInvited(with: latitude ?? 0, longitude: longitude ?? 0)
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.isInvited = isCustomerInvited
    }
}
