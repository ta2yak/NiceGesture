//
//  NCPanGestureRecognizer.swift
//  NiceGesture
//
//  Created by 卓同学 on 16/4/4.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import UIKit

public typealias ncPanHandler=(_ gestureRecognizer:UIPanGestureRecognizer)->()

open class NCPanGestureRecognizer: UIPanGestureRecognizer {
    var promise = NCGesturePromise<UIPanGestureRecognizer>()
    
    init(config:ncPanHandler={ _ in }){
        super.init(target: promise, action: #selector(NCGesturePromise.gesureRecognizerHandler(_:)))
        config(self)
    }
    
}
