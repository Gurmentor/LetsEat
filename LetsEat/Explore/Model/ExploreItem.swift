//
//  ExploreItem.swift
//  LetsEat
//
//  Created by John on 4/4/24.
//

import Foundation

struct ExploreItem {
    let name : String?
    let image : String?
}

extension ExploreItem {
    init (dict:[String: String]) {
        self.name = dict["name"]
        self.image = dict["image"]
    }
}
