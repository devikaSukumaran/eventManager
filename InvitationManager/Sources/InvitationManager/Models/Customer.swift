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
    let latitude : Double?
    let longitude : Double?
    
    init?(with json: [String: Any]) {
        guard let id = json["user_id"] as? Int else {
            return nil
        }
        self.id = id
        self.name = json["name"] as? String
        
        var latitude : Double = 0, longitude : Double = 0
        if let customerLocationLatitude = json["latitude"] as? String {
            latitude = Double(customerLocationLatitude) ?? 0
        }
        self.latitude = latitude
        
        if let customerLocationLongitude = json["longitude"] as? String {
            longitude = Double(customerLocationLongitude) ?? 0
        }
        self.longitude = longitude
    }
    
    //Returns the id and name from the customer object
    var output: [String: Any] {
        var jsonOutput = [String: Any]()
        jsonOutput["id"] = self.id
        jsonOutput["name"] = self.name
        return jsonOutput
    }
}
