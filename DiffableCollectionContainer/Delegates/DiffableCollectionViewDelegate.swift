//
//  DiffableCollectionViewDelegate.swift
//  DiffableCollectionContainer
//
//  Created by Maksim Botalov on 13.11.2024.
//

import UIKit

protocol DiffableCollectionViewDelegate: AnyObject {
    func cellForItemAt<Section>(sections: [Section], indexPath: IndexPath) -> UICollectionViewCell
    func didSelectItemAt(didSelectItemAt indexPath: IndexPath)
}
