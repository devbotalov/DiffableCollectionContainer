//
//  DiffableCollectionView.swift
//  DiffableCollectionContainer
//
//  Created by Максим Боталов on 13.11.2024.
//

import UIKit

public final class DiffableCollectionView<Section: Hashable & Sendable, Item:  Hashable & Sendable>: UICollectionView, UICollectionViewDelegate {

    typealias DiffableDataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias DiffableSnapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    private var diffableDataSource: DiffableDataSource!
    private var diffableSnapshot: DiffableSnapshot!
    
    private weak var diffableDelegate: DiffableCollectionViewDelegate!
    
    init(
        backgroundColor: UIColor,
        layout: UICollectionViewCompositionalLayout,
        delegate: DiffableCollectionViewDelegate
    ) {
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.diffableDelegate = delegate
        self.backgroundColor = backgroundColor
        
        collectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        diffableDelegate.didSelectItemAt(didSelectItemAt: indexPath)
    }
}

public extension DiffableCollectionView {
    func add(section: Section, items: [Item]) {
        diffableSnapshot.appendSections([section])
        diffableSnapshot.appendItems(items, toSection: section)
        diffableDataSource.apply(diffableSnapshot, animatingDifferences: true)
    }
}

private extension DiffableCollectionView {
    func collectionView() {
        delegate = self
        translatesAutoresizingMaskIntoConstraints = false
        
        setupDataSource()
        setupShapshot()
    }
    
    func setupDataSource() {
        diffableDataSource = DiffableDataSource(collectionView: self) { [unowned self] collectionView, indexPath, itemIdentifier in
            diffableDelegate?.cellForItemAt(sections: diffableSnapshot.sectionIdentifiers, indexPath: indexPath)
        }
    }
    
    func setupShapshot() {
        diffableSnapshot = NSDiffableDataSourceSnapshot()
        diffableDataSource.apply(diffableSnapshot, animatingDifferences: true)
    }
}
