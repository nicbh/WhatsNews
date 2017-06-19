//
//  User.swift
//  WhatsNews
//
//  Created by nicbh on 2017/6/18.
//  Copyright © 2017年 nicbh. All rights reserved.
//

import Foundation

class Collection {
    var collection: [Array<NewsDetail>] = [[]]
    
    func append(_ item: NewsDetail) {
        collection[0].insert(item, at: 0)
    }
    
    func contains(_ citem: NewsItem) ->Bool {
        for item in collection[0] {
            if item.equal(citem) {
                return true
            }
        }
        return false
    }
    
    func delete(_ item: NewsItem) {
        if let index = collection[0].index(where: { item.equal($0) }) {
            collection[0].remove(at: index)
        }
    }
}

class User {
    var username: String?
    
    var collection = Collection()
    
    init(name: String) {
        username = name
    }
}
