//
//  School.swift
//  FieldTrip7
//
//  Created by tim on 2015-09-17.
//  Copyright © 2015 Sbrew. All rights reserved.
//

import Foundation
import Alamofire

public class School {
    static var schoolList = [School?]()
    public static var userName = "curse"
    public static var password = "password"
    public static var serverName = "localhost:3000"
    
    public let name: String
    public let schoolType: String
    
    class func getSchools(callback: ([School?]) -> Void) {
        print("School: \(serverName)")
        let urlString = "http://\(serverName)/api/schools/list.json"
        let request = addAuthentication(Alamofire.request(.GET, urlString))
        request.response {(req, resp, d, e) in
            do {
                if let urlData = d {
                    let jsonData = try NSJSONSerialization.JSONObjectWithData(urlData, options:NSJSONReadingOptions.MutableContainers ) as! NSArray

                    schoolList = jsonData.map {
                        if let name = $0["name"] as? String {
                            let school_type = $0["school_type"] as? String
                            return School(name: name, type: school_type!)
                        }
                        return nil
                    }
                    callback(schoolList)
                } else {
                    print("No data")
                }
            } catch {
                print("Failure!")
            }
        }
    }
    
    class func createFieldTrip(name: String, forSchoolNamed: String, callback: (Int?) -> Void ) {
        print("Creating \(name) for \(forSchoolNamed)")
        let urlString = "http://\(serverName)/api/field_trips/create.json"
        let parameters = ["school" : forSchoolNamed, "name" : name]
        addAuthentication(Alamofire.request(.POST, urlString, parameters: parameters)).response { (req, resp, d, e) in
            print(resp?.statusCode)
            callback(resp?.statusCode)
        }
    }
    
    init(name: String, type: String) {
        self.name = name
        self.schoolType = type
    }
    
    private class func addAuthentication(var request: Request) -> Request {
        if userName != "" && password != "" {
            request = request.authenticate(user: userName, password: password)
        }
        return request
    }
}