//
//  DataManager.swift
//  LetsEat
//
//  Created by John on 4/8/24.
//

import Foundation

protocol DataManager {
    func loadPlist( file name: String)-> [[String: AnyObject]]
}

extension DataManager {
    func loadPlist(file name:String)->[[String:AnyObject]] {
        guard let path = Bundle.main.path(forResource: name, ofType: "plist"),
              let itemsData = FileManager.default.contents(atPath: path),
              let items = try! PropertyListSerialization.propertyList(from: itemsData, format: nil) as? [[String:AnyObject]]
        else {
            return [[:]]
        }
        return items
    }
}
