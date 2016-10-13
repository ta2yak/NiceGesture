//
//  NCTapPromise.swift
//  NiceGesture
//
//  Created by 卓同学 on 16/4/3.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import UIKit

open class NCTapPromise: NSObject {
    
    var tapHandler:ncTapGestrueHandler?
    
    override init() {
        super.init()
    }
    
    init(tapHandler:@escaping ncTapGestrueHandler){
        self.tapHandler=tapHandler
        super.init()
    }
    
    func tapGestureRecognizerHandler(_ recognizer:UITapGestureRecognizer){
        if let handler = tapHandler {
            handler(recognizer)
        }
    }
    
    open func whenTapped(_ handler:@escaping ncTapGestrueHandler){
        tapHandler=handler
    }
    
}
