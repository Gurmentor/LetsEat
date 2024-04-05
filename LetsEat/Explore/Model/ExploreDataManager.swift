//
//  ExploreDataManager.swift
//  LetsEat
//
//  Created by John on 4/5/24.
//

import Foundation

class ExploreDataManager {
    
    private var exploreItems : [ExploreItem] = []   // declare an array of ExploreItem(s)
    
    func fetch() {
        for data in loadData() {
            //print(data) // print the contents of each dictionary to the debug area
            
            exploreItems.append(ExploreItem(dict: data))    // call the custom initializer in ExploreItem, passing the 2-element dictionary
        }
    }
    
    private func loadData() -> [[String:String]]{       // returns an array of dictionaries.  Dictionary composed of elements with String keys and values.
        
        let decoder = PropertyListDecoder() // used to decode the data in ExploreData.plist
        
        if let path = Bundle.main.path(forResource: "ExploreData", ofType: "plist"),            // attempt to get the path to ExploreData.plist in the app bundle and assign it to path
           let exploreData = FileManager.default.contents(atPath: path),                        // attempt to get the file at path (ExploreData.plist) and assign it to exploreData
           let exploreItems = try? decoder.decode([[String:String]].self, from: exploreData)    // attempt to create an array (exploreItems) from the data in exploreData
        {
            // The above attempts must all be successful, for the following statement to be executed.
            return exploreItems     // if the optional binding is successful, return an array of dictionaries.
        }
        
        return [[:]]    // if the optional binding is unsuccessful, return an empty array of dictionaries.
    }
    
    // Determines the number of cells displayed by the collection view.
    func numberOfExploreItems() -> Int {
        exploreItems.count
    }
    
    // Returns an ExploreItem instance the correspons to the cell's position in the collection view.
    func exploreItem(at index: Int) -> ExploreItem {
        exploreItems[index]
    }
}
