//
//  ReusableCell.swift
//  AnyReusableCell
//
//  Created by 刘栋 on 2018/8/30.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import Foundation

public protocol ReusableCell: class {
    
    static var reuseIdentifier: String { get }
}

extension ReusableCell {
    
    public static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
