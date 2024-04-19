//
//  LocationItem.swift
//  LetsEat
//
//  Created by J. M. Hinckley on 4/17/24.
//

import Foundation

struct LocationItem {
    let city:String?
    let state:String?
}

extension LocationItem {
    init(dict:[String:String]) {
        self.city = dict["city"]
        self.state = dict["state"]
    }
    
    var cityAndState: String {
        guard let city = self.city, let state = self.state else {
            return ""
        }
        return "\(city), \(state)"
    }
}
