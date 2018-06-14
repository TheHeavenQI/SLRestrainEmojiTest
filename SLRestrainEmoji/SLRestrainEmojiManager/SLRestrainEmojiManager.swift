//
//  SLRestrainEmojiManager.swift
//  SLRestrainEmoji
//
//  Created by MagicBeans2 on 2018/5/17.
//  Copyright © 2018年 Sloan. All rights reserved.
//

import UIKit

class SLRestrainEmojiManager: NSObject {

    static var sharedManager : SLRestrainEmojiManager {
        struct Once {
            static let manager : SLRestrainEmojiManager = SLRestrainEmojiManager()
        }
        return Once.manager;
    }
    
    var emojiArr:[NSNumber]! {
        get{
            if arr != nil {
                return arr
            }else {
                let path = Bundle.main.path(forResource: "SLEmoji", ofType: "plist")
                let arr1 : [NSNumber]? = NSArray.init(contentsOfFile: path!) as? [NSNumber]
                
                arr = arr1
                return arr1
            }
            
        }
    }
    
    private var arr : [NSNumber]?
    
    override init() {
        super.init()
        
    }
    
    var isEnabled : Bool? {
        didSet{ setIsEnabled() }
    }
    
 
    deinit {
        self.deReigster()
    }
    
    private func setIsEnabled() {
        
        guard let item = self.isEnabled else { return }
        
        if item == true {
            register()
        }else {
            deReigster()
        }
    }
    
}

// registerNotification
extension SLRestrainEmojiManager {
    
    private func register() {
        // 注册之前先清除, 避免多次注册
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UITextFieldTextDidChange, object: nil)
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UITextViewTextDidChange, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(textField2TextChange(noti:)), name: Notification.Name.UITextFieldTextDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(textField2TextChange(noti:)), name: Notification.Name.UITextViewTextDidChange, object: nil)
        
    }
    
    private func deReigster() {
        
        NotificationCenter.default.removeObserver(self)
        
    }
    
    @objc func textField2TextChange(noti:Notification) {
        
        switch noti.object {
        case let textField as UITextField :
            let isContain : Bool = SLVerifyEmoji.isContainEmoji(textField.text)
            if isContain {
                textField.text = SLVerifyEmoji.replceEmoji(textField.text ?? "")
            }
            break
        case let textView as UITextView :
            textView.text = SLVerifyEmoji.replceEmoji(textView.text ?? "")
            break
        default:
            break
        }
    }
}
