//
//  ReuseBase+UICollectionView.swift
//  AnyReusableCell
//
//  Created by 刘栋 on 2018/8/30.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

#if canImport(UIKit)
import UIKit

extension ReuseBase where Base: UICollectionView {
    
    public enum ElementKind: RawRepresentable {
        
        case sectionHeader
        case sectionFooter
        
        public init(rawValue: String) {
            switch rawValue {
            case UICollectionView.elementKindSectionHeader:
                self = .sectionHeader
            case UICollectionView.elementKindSectionFooter:
                self = .sectionFooter
            default:
                fatalError()
            }
        }
        
        public var rawValue: String {
            switch self {
            case .sectionHeader:
                return UICollectionView.elementKindSectionHeader
            case .sectionFooter:
                return UICollectionView.elementKindSectionFooter
            }
        }
    }
}

// MARK: UICollectionView + Register
extension ReuseBase where Base: UICollectionView {
    
    public func registerClass<T>(cell type: T.Type) where T: UICollectionViewCell, T: ReusableCell {
        base.register(type.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    public func registerNib<T>(cell type: T.Type, in bundle: Bundle = .main) where T: UICollectionViewCell, T: ReusableCell {
        let nib = UINib(nibName: type.reuseIdentifier, bundle: bundle)
        base.register(nib, forCellWithReuseIdentifier: type.reuseIdentifier)
    }
    
    public func registerClass<T>(supplementaryView type: T.Type, for kind: ElementKind) where T: UICollectionViewCell, T: ReusableCell {
        base.register(type.self, forSupplementaryViewOfKind: kind.rawValue, withReuseIdentifier: type.reuseIdentifier)
    }
    
    public func registerNib<T>(supplementaryView type: T.Type, for kind: ElementKind, in bundle: Bundle = .main) where T: UICollectionViewCell, T: ReusableCell {
        let nib = UINib(nibName: type.reuseIdentifier, bundle: bundle)
        base.register(nib, forSupplementaryViewOfKind: kind.rawValue, withReuseIdentifier: type.reuseIdentifier)
    }
}

// MARK: UICollectionView + Dequeue
extension ReuseBase where Base: UICollectionView {
    
    public func dequeueCell<T>(for indexPath: IndexPath) -> T where T: UICollectionViewCell, T: ReusableCell {
        guard let cell = base.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Register Cell: \(T.reuseIdentifier) first!")
        }
        return cell
    }
    
    public func dequeueSupplementaryView<T>(kind: ElementKind, for indexPath: IndexPath) -> T where T: UICollectionReusableView, T: ReusableCell {
        guard let view = base.dequeueReusableSupplementaryView(ofKind: kind.rawValue, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Register View: \(T.reuseIdentifier) first!")
        }
        return view
    }
}
#endif
