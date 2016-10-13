//
//  NCScreenEdgePanGestureRecognizer.swift
//  NiceGesture
//
//  Created by 卓同学 on 16/4/4.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import UIKit

public typealias ncEdgePanchHandler=(_ gestureRecognizer:UIScreenEdgePanGestureRecognizer)->()


class NCScreenEdgePanGestureRecognizer: UIScreenEdgePanGestureRecognizer {
    var promise = NCGesturePromise<UIScreenEdgePanGestureRecognizer>()
    
    init(config:ncEdgePanchHandler={ _ in }){
        super.init(target: promise, action: #selector(NCGesturePromise.gesureRecognizerHandler(_:)))
        config(self)
    }
}
