//
//  MapDataManager.swift
//  LetsEat
//
//  Created by John on 4/8/24.
//

import Foundation

class MapDataManager : DataManager {
    private var items: [RestaurantItem] = []
    var annotations: [RestaurantItem] {
        items
    }
    
//    private func loadData() -> [[String: AnyObject]] {
//        guard let path = Bundle.main.path(forResource: "MapLocations", ofType: "plist"),
//              let itemsData = FileManager.default.contents(atPath: path),
//              let items = try! PropertyListSerialization.propertyList(from: itemsData, format: nil) as? [[String:AnyObject]] else { return [[:]]}
//        return items
//    }
    
    func fetch(completion: (_ annotations:[RestaurantItem]) -> ()) {
        if !items.isEmpty {
            items.removeAll()
        }
        
        for data in loadPlist(file: "MapLocations") {
            items.append(RestaurantItem(dict: data))
        }
        
        completion(items)
    }
}
