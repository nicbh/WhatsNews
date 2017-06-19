//
//  Util.swift
//  WhatsNews
//
//  Created by nicbh on 2017/6/5.
//  Copyright © 2017年 nicbh. All rights reserved.
//

import Foundation

struct MyRegex {
    private let regex: NSRegularExpression?
    
    init(_ pattern: String) {
        regex = try? NSRegularExpression(pattern: pattern)
    }
    
    func match(input: String) -> Bool {
        if let matches = regex?.matches(in: input, options: [],
                                        range: NSRange(location: 0, length: (input as NSString).length)) {
            return matches.count > 0
        } else {
            return false
        }
    }
}
