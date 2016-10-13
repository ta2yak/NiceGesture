//
//  NCPinchGestureRecognizer.swift
//  NiceGesture
//
//  Created by 卓同学 on 16/4/4.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import UIKit

public typealias ncPinchHandler=(_ gestureRecognizer:UIPinchGestureRecognizer)->()

class NCPinchGestureRecognizer: UIPinchGestureRecognizer {
    
    var promise = NCGesturePromise<UIPinchGestureRecognizer>()
    
    init(config:ncPinchHandler={ _ in }){
        super.init(target: promise, action: #selector(NCGesturePromise.gesureRecognizerHandler(_:)))
        config(self)
    }
}
