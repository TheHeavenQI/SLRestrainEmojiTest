//
//  VerifyEmoji.swift
//  SLRestrainEmoji
//
//  Created by MagicBeans2 on 2018/5/17.
//  Copyright © 2018年 Sloan. All rights reserved.
//

import Foundation

struct SLVerifyEmoji {
    // 验证字符串是否包含emoji
    static func isContainEmoji(_ str: String?) -> Bool{
        
        var returenValue : Bool = false
        if str == nil {
            returenValue = false
            return returenValue
        }
        
        for (_, item) in str!.enumerated() {
            let value : Bool = item.description.containsEmoji
            if value == true {
                returenValue = true
                break
            }
        }
        
        return returenValue
    }
    
    // 屏蔽掉emoji
    static func replceEmoji(_ str:String) -> String {
        
        var charaterArr : [Character] = []
        var allItems : [Character] = []
        
        var newStr : String = ""
        
        for (_, item) in str.enumerated() {
            allItems.append(item)
            let value : Bool = item.description.containsEmoji
            if value == true {
                charaterArr.append(item)
                continue
            }
        }
        
        for item in charaterArr {
            let index : Int = allItems.index(of: item)!
            allItems.remove(at: index)
        }
        
        for item in allItems {
            newStr += item.description
        }
        return newStr
    }
}

// 验证单个字符是否包含emoji
extension String {
    var containsEmoji:Bool {
        for scalar in unicodeScalars {
            print(scalar.value)
            if SLRestrainEmojiManager.sharedManager.emojiArr.contains(NSNumber.init(value: scalar.value)) {
                return true
            }
            
        }
        return false
    }
    
}

