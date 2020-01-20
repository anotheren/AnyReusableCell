//
//  ReuseCompatible.swift
//  AnyReusableCell
//
//  Created by 刘栋 on 2018/8/30.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import Foundation

public protocol ReuseCompatible {
    
    associatedtype ReuseCompatibleType
    
    var reuse: ReuseBase<ReuseCompatibleType> { get }
}

extension ReuseCompatible {
    
    public var reuse: ReuseBase<Self> {
        get {
            return ReuseBase(base: self)
        }
    }
}
