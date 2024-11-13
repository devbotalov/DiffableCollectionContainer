//
//  ReusableView.swift
//  DiffableCollectionContainer
//
//  Created by Максим Боталов on 13.11.2024.
//

import UIKit

protocol ReusableView: AnyObject {}

extension ReusableView where Self: UIResponder {
    static var reusableID: String { return String(describing: self) }
}
