//
//  DistanceCalculator.swift
//  
//
//  Created by Devika Sukumaran on 08/05/20.
//

import Foundation

protocol DistanceCalculatable {
    func checkIfCustomerIsInvited(with latitude: Double, longitude: Double, compareWithOfficeLocation officeLocationLatitude: Double, officeLocationLongitude: Double) -> Bool
}

struct DistanceCalculator: DistanceCalculatable {
    
    /*
     Returns if customer lives within 100 kilometers of the office
     */
    func checkIfCustomerIsInvited(with latitude: Double, longitude: Double, compareWithOfficeLocation officeLocationLatitude: Double, officeLocationLongitude: Double) -> Bool {
        let officeLatitudeInRadian = convertToRadians(from: officeLocationLatitude)
        let customerLatitudeInRadian = convertToRadians(from: latitude)
        
        return 1.609344 * 3963.0 * acos(sin(officeLatitudeInRadian) * sin(customerLatitudeInRadian) +
            (cos(officeLatitudeInRadian) * cos(customerLatitudeInRadian) * cos(convertToRadians(from: longitude) - convertToRadians(from: officeLocationLongitude)))) < 100
    }
    
    /*
     Convert degree to radian
     */
    func convertToRadians(from degree: Double) -> Double {
        return degree * .pi/180
    }
}
