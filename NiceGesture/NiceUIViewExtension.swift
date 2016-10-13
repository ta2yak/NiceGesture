//
//  NiceUIViewExtension.swift
//  NiceGesture
//
//  Created by 卓同学 on 16/4/3.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import Foundation


extension UIView{
    
    // MARK:Tap
    public func nc_addTapGestureWithConfigClosure(_ config:ncTapGestrueHandler)->NCTapPromise{
        let tapRecognizer=NCTapGestureRecognizer(config: config)
        addGestureRecognizer(tapRecognizer)
        return tapRecognizer.tapPromise
    }
    
    public func nc_whenTapped(_ handler:ncTapGestrueHandler){
        let tapRecognizer=NCTapGestureRecognizer(handler: handler)
        addGestureRecognizer(tapRecognizer)
    }
    
    // MARK:LongPress
    public func nc_addLongPressGestureWithConfigClosure(_ config:ncLongPressHandler)->NCGesturePromise<UILongPressGestureRecognizer>{
        let recognizer = NCLongPressGestureRecognizer(config: config)
        addGestureRecognizer(recognizer)
        return recognizer.promise
    }
    
    public func nc_addLongPressGesture()->NCGesturePromise<UILongPressGestureRecognizer>{
        return nc_addLongPressGestureWithConfigClosure({ _ in })
    }
    
    
    // MARK:Pan
    public func nc_addPanGestureWithConfigClosure(_ config:ncPanHandler)->NCGesturePromise<UIPanGestureRecognizer>{
        let recognizer = NCPanGestureRecognizer(config: config)
        addGestureRecognizer(recognizer)
        return recognizer.promise
    }
    
    public func nc_addPanGesture()->NCGesturePromise<UIPanGestureRecognizer>{
        return nc_addPanGestureWithConfigClosure({ _ in })
    }
    
    // MARK:Pinch
    public func nc_addPinchGestureWithConfigClosure(_ config:ncPinchHandler)->NCGesturePromise<UIPinchGestureRecognizer>{
        let recognizer = NCPinchGestureRecognizer(config: config)
        addGestureRecognizer(recognizer)
        return recognizer.promise
    }
    
    public func nc_addPinchGesture()->NCGesturePromise<UIPinchGestureRecognizer>{
        return nc_addPinchGestureWithConfigClosure({ _ in })
    }
    
    // MARK:Rotation
    public func nc_addRotationGestureWithConfigClosure(_ config:ncRotationHandler)->NCGesturePromise<UIRotationGestureRecognizer>{
        let recognizer = NCRotationGestureRecognizer(config: config)
        addGestureRecognizer(recognizer)
        return recognizer.promise
    }
    
    public func nc_addRotationGesture()->NCGesturePromise<UIRotationGestureRecognizer>{
        return nc_addRotationGestureWithConfigClosure({ _ in })
    }
    
    // MARK:Swipe
    public func nc_addSwipeGestureWithConfigClosure(_ config:ncSwipeHandler)->NCGesturePromise<UISwipeGestureRecognizer>{
        let recognizer = NCSwipeGestureRecognizer(config: config)
        addGestureRecognizer(recognizer)
        return recognizer.promise
    }
    
    public func nc_addSwipeGesture()->NCGesturePromise<UISwipeGestureRecognizer>{
        return nc_addSwipeGestureWithConfigClosure({ _ in })
    }
    
    public func nc_whenSwipedInDirection(_ direction:UISwipeGestureRecognizerDirection,gestureRecognizer:ncSwipeHandler){
        nc_addSwipeGestureWithConfigClosure { (swipeGestureRecognizer) in
            swipeGestureRecognizer.direction=direction
        }.whenEnded(gestureRecognizer)
    }
    
    // MARK:ScreenEdgePan
    public func nc_addScreenEdgePanGestureWithConfigClosure(_ config:ncEdgePanchHandler)->NCGesturePromise<UIScreenEdgePanGestureRecognizer>{
        let recognizer = NCScreenEdgePanGestureRecognizer(config: config)
        addGestureRecognizer(recognizer)
        return recognizer.promise
    }
    
    public func nc_addScreenEdgePanGesture()->NCGesturePromise<UIScreenEdgePanGestureRecognizer>{
        return nc_addScreenEdgePanGestureWithConfigClosure({ _ in })
    }
    
    
    
    
    
    
    
    
}
