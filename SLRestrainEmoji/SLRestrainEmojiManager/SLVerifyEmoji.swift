//
//  VerifyEmoji.swift
//  SLRestrainEmoji
//
//  Created by MagicBeans2 on 2018/5/17.
//  Copyright © 2018年 Sloan. All rights reserved.
//

import Foundation

struct SLVerifyEmoji {
    
    static func isContainEmoji(_ str: String?) -> Bool{
        
        var returenValue : Bool = false
        
        if str == nil {
            returenValue = false
            return returenValue
        }
        
        for item in str!.enumerated() {
            print(item.element.unicodeScalars)
            switch item.element.unicodeScalars {
            default:
                break
            }
            
        }
        
        return returenValue
    }
    
}
