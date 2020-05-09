//
//  JSONSerializer.swift
//  
//
//  Created by Devika Sukumaran on 08/05/20.
//

import Foundation

protocol JSONSerializable {
    func readFromTextFile(fileName: String, ofType  type : String) -> Any?
}

struct JSONSerializer: JSONSerializable {
    
    //Reads and returns the content of a customer record text file
    func readFromTextFile(fileName: String, ofType  type : String) -> Any?{
        var fileContents : Any = ""
        if let path = Bundle.main.path(forResource: fileName, ofType: type){
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: [])
                fileContents =  jsonResult
            } catch {
                print("json error: \(error.localizedDescription)")
            }
        }
        return fileContents
    }
}
