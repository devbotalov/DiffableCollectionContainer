//
//  UICollectionView+Registration.swift
//  DiffableCollectionContainer
//
//  Created by Максим Боталов on 13.11.2024.
//

import UIKit

extension UICollectionView {
    final func register<Cell: UICollectionViewCell>(_: Cell.Type) where Cell: ReusableView {
        register(Cell.self, forCellWithReuseIdentifier: Cell.reusableID)
    }
    
    final  func dequeueReusableCell<Cell: UICollectionViewCell>(for indexPath: IndexPath) -> Cell where Cell: ReusableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: Cell.reusableID, for: indexPath) as? Cell else {
            fatalError("Could not dequeue cell with ID: \(Cell.reusableID)")
        }
        
        return cell
    }
    
    final func registerHeader<View: UICollectionReusableView>(_: View.Type) where View: ReusableView {
        register(View.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: View.reusableID)
    }
    
    final func dequeueHeader<View: UICollectionReusableView>(for indexPath: IndexPath) -> View where View: ReusableView {
        guard let view = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: View.reusableID, for: indexPath) as? View else {
            fatalError("Could not dequeue header with ID: \(View.reusableID)")
        }
        
        return view
    }
    
    final func registerFooter<View: UICollectionReusableView>(_: View.Type) where View: ReusableView {
        register(View.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: View.reusableID)
    }
    
    final func dequeueFooter<View: UICollectionReusableView>(for indexPath: IndexPath) -> View where View: ReusableView {
        guard let view = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: View.reusableID, for: indexPath) as? View else {
            fatalError("Could not dequeue header with ID: \(View.reusableID)")
        }
        
        return view
    }
    
    final func registerBackground<View: UICollectionReusableView>(_: View.Type, forDecorationViewOfKind: String) where View: ReusableView {
        collectionViewLayout.register(View.self, forDecorationViewOfKind: forDecorationViewOfKind)
    }
}
