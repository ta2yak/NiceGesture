//
//  NCGesturePromise.swift
//  NiceGesture
//
//  Created by 卓同学 on 16/4/3.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import UIKit


open class NCGesturePromise<T:UIGestureRecognizer>: NSObject {
    
    public typealias ncGestureHandler = (_ gestureRecognizer:T)->Void

    var beganHandler:ncGestureHandler = { _ in }
    var cancelledHandler:ncGestureHandler = { _ in }
    var changedHandler:ncGestureHandler = { _ in }
    var endedHandler:ncGestureHandler = { _ in }
    var failedHandler:ncGestureHandler = { _ in }

    
    override init(){
        super.init()
    }
    
    func gesureRecognizerHandler(_ gestureRecognizer:UIGestureRecognizer){
        switch gestureRecognizer.state {
        case .began:
            beganHandler(gestureRecognizer as! T)
        case .cancelled:
            cancelledHandler(gestureRecognizer as! T)
        case .changed:
            changedHandler(gestureRecognizer as! T)
        case .ended:
            endedHandler(gestureRecognizer as! T)
        case .failed:
            failedHandler(gestureRecognizer as! T)
        case .possible:
            break
        }
    }
    
    /**
     one handler for many states
     
     - parameter states:  UIGestureRecognizerStates
     
     */
    open func whenStatesHappend(_ states:[UIGestureRecognizerState],handler:@escaping ncGestureHandler)->NCGesturePromise<T>{
        for state in states{
            switch state {
            case .began:
                beganHandler=handler
            case .cancelled:
                cancelledHandler=handler
            case .changed:
                changedHandler=handler
            case .ended:
                endedHandler=handler
            case .failed:
                failedHandler=handler
            case .possible:
                break
            }
        }
        return self
    }
    
    open func whenBegan(_ handler:@escaping ncGestureHandler)->NCGesturePromise<T>{
        beganHandler=handler
        return self
    }
    
    open func whenCancelled(_ handler:@escaping ncGestureHandler)->NCGesturePromise<T>{
        cancelledHandler=handler
        return self
    }
    
    open func whenChanged(_ handler:@escaping ncGestureHandler)->NCGesturePromise<T>{
        changedHandler=handler
        return self
    }
    
    open func whenEnded(_ handler:@escaping ncGestureHandler)->NCGesturePromise<T>{
        endedHandler=handler
        return self
    }
    
    open func whenFailed(_ handler:@escaping ncGestureHandler)->NCGesturePromise<T>{
        failedHandler=handler
        return self
    }
    
    
}
