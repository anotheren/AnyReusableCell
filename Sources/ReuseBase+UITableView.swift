//
//  ReuseBase+UITableView.swift
//  AnyReusableCell
//
//  Created by 刘栋 on 2018/8/30.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

#if canImport(UIKit)
import UIKit

// MARK: UITableView + Register
extension ReuseBase where Base: UITableView {
    
    public func registerClass<T>(cell type: T.Type) where T: UITableViewCell, T: ReusableCell {
        base.register(type.self, forCellReuseIdentifier: type.reuseIdentifier)
    }
    
    public func registerClass<T>(headerFooterView type: T.Type) where T: UITableViewHeaderFooterView, T: ReusableCell {
        base.register(type.self, forHeaderFooterViewReuseIdentifier: type.reuseIdentifier)
    }
    
    public func registerNib<T>(cell type: T.Type, in bundle: Bundle = .main) where T: UITableViewCell, T: ReusableCell {
        let nib = UINib(nibName: type.reuseIdentifier, bundle: bundle)
        base.register(nib, forCellReuseIdentifier: type.reuseIdentifier)
    }
    
    public func registerNib<T>(headerFooterView type: T.Type, in bundle: Bundle = .main) where T: UITableViewHeaderFooterView, T: ReusableCell {
        let nib = UINib(nibName: type.reuseIdentifier, bundle: bundle)
        base.register(nib, forHeaderFooterViewReuseIdentifier: type.reuseIdentifier)
    }
}

// MARK: UITableView + Dequeue
extension ReuseBase where Base: UITableView {
    
    public func dequeueCell<T>(for indexPath: IndexPath) -> T where T: UITableViewCell, T: ReusableCell {
        guard let cell = base.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Register Cell: \(T.reuseIdentifier) first!")
        }
        return cell
    }
    
    public func dequeueHeaderFooterView<T>() -> T where T: UITableViewHeaderFooterView, T: ReusableCell {
        guard let view = base.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Register HeaderFooterView: \(T.reuseIdentifier) first!")
        }
        return view
    }
}
#endif
