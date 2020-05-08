//
//  CustomerController.swift
//  
//
//  Created by Devika Sukumaran on 08/05/20.
//

import Foundation



class CustomerController {
    /*
     Fetches customer details, filter the customer details, and returns the data
     */
    func getInvitationListFromCustomerRecords() -> [Customer] {
        let customerList = getCustomerDetails(fromFile: fileWithCustomerDetails, ofType: typeOfCustomerDetailsFile)
        var invitationList : [Customer] = [Customer]()
        if customerList.count > 0 {
            invitationList = customerList.filter({($0.isInvited)})
        }
        return invitationList
    }
    
    /*
     Fetches customer details from the txt file in bundle and saves the data
     */
    func getCustomerDetails(fromFile fileName: String, ofType type : String) -> [Customer]{
        var list = [Customer]()
        if let userRecords = JSONSerializer().readFromTextFile(fileName: fileName, ofType: type) as? [[String: Any]] {
            if userRecords.count > 0 {
                userRecords.forEach({ record in
                    var customerLatitude : Double = 0, cutomerLongitude: Double = 0
                    if let latitude = record["latitude"] as? String {
                        customerLatitude = Double(latitude) ?? 0
                    }
                    if let longitude = record["longitude"] as? String {
                        cutomerLongitude = Double(longitude) ?? 0
                    }
                    list.append(Customer(id: record["user_id"] as! Int, name: record["name"] as? String, latitude: customerLatitude, longitude: cutomerLongitude))
                })
                //sorts customes data by the ascending order of customer_id
                list = list.sorted(by: {$0.id < $1.id})
            }
        }
        return list
    }
}
