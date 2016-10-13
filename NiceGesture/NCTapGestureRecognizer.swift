//
//  NCTapGestureRecognizer.swift
//  NiceGesture
//
//  Created by 卓同学 on 16/4/3.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import UIKit

public typealias ncTapGestrueHandler=(_ tapGestureRecognizer:UITapGestureRecognizer)->()

class NCTapGestureRecognizer: UITapGestureRecognizer {
    
    var tapPromise = NCTapPromise()

    init(config:ncTapGestrueHandler={ _ in }){
        super.init(target: tapPromise, action: #selector(NCTapPromise.tapGestureRecognizerHandler(_:)) )
        config(self)
    }
    
    init(handler:@escaping ncTapGestrueHandler){
        super.init(target: tapPromise, action: #selector(NCTapPromise.tapGestureRecognizerHandler(_:)) )
        tapPromise.tapHandler=handler
    }
}
