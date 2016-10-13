//
//  NCLongPressGestureRecognizer.swift
//  NiceGesture
//
//  Created by 卓同学 on 16/4/3.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import UIKit

public typealias ncLongPressHandler=(_ gestureRecognizer:UILongPressGestureRecognizer)->()

class NCLongPressGestureRecognizer: UILongPressGestureRecognizer {
    
    var promise = NCGesturePromise<UILongPressGestureRecognizer>()

    init(config:ncLongPressHandler={ _ in }){
        super.init(target: promise, action: #selector(NCGesturePromise.gesureRecognizerHandler(_:)))
        config(self)
    }
    
}
