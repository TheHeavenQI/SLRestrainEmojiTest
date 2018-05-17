//
//  SLNoitificationManager.swift
//  SLRestrainEmoji
//
//  Created by MagicBeans2 on 2018/5/17.
//  Copyright © 2018年 Sloan. All rights reserved.
//

import Foundation

fileprivate struct SLNoitificationName {
    static let textFieldNoName = "SLTextFieldNotificationName"
    static let textViewNoName = "SLTextViewNotificationName"
}

class SLNoitificationManager : NSObject {
    
    public static func textFieldPost(obj:Any?, userinfo:[AnyHashable : Any]?) {
        self.postNotification(name: SLNoitificationName.textFieldNoName, obj: obj, userinfo: userinfo)
    }
    
    public static func textViewFieldPost(obj:Any?, userinfo:[AnyHashable : Any]?) {
        self.postNotification(name: SLNoitificationName.textViewNoName, obj: obj, userinfo: userinfo)
    }
    
    private static func postNotification(name:String, obj:Any?, userinfo:[AnyHashable : Any]?) {
        NotificationCenter.default.post(name: Notification.Name.init(name), object: obj, userInfo: userinfo)
    }
    
}
