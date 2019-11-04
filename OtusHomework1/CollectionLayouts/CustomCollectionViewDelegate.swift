//
//  CustomCollectionViewDelegate.swift
//  OtusHomework1
//
//  Created by MacMini Elis on 25/09/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation
import UIKit

protocol CustomCollectionViewDelegate: class {
    func numberOfItemsInCollectionView() -> Int
}

class CustomCollectionViewLayout: UICollectionViewLayout {
    private var numberOfColumns = 3
    private var cellPadding: CGFloat = 5
    private let cellHeight: CGFloat = 150
    
    weak var delegate: CustomCollectionViewDelegate?
    
    private var cache = [UICollectionViewLayoutAttributes]()
    
    private var contentHeight: CGFloat = 0
    
    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        guard
            cache.isEmpty,
            let collectionView = collectionView
            else { return }
        
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffset = [CGFloat]()
        
        for column in 0..<numberOfColumns {
            
            if column == 0 {
                xOffset.append(0)
            } else if column == 1 {
                xOffset.append(2 * columnWidth)
            } else if column == 2 {
                xOffset.append(columnWidth)
            }
            
        }
        
        var column = 0
        var yOffset = [CGFloat]()
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            
            for column in 0..<numberOfColumns {
                switch column {
                case 0:
                    yOffset.append(2 * cellPadding)
                case 1:
                    yOffset.append(2 * cellPadding)
                case 2:
                    yOffset.append(cellPadding + cellHeight)
                default:
                    break
                }
            }
            
            let height = cellPadding * 2 + cellHeight
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: columnWidth)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            contentHeight = max(collectionView.frame.height + 10, frame.maxY)
            
            yOffset[column] = yOffset[column] + 2 * (height - cellPadding)
            
            let numberOfItems = delegate?.numberOfItemsInCollectionView()
            
            
            if
                let numberOfItems = numberOfItems,
                indexPath.item == numberOfItems - 1
            {
                switch column {
                case 0:
                    column = 2
                case 2:
                    column = 0
                case 1:
                    column = 2
                default:
                    return
                }
            } else  {
                column = column < (numberOfColumns - 1) ? (column + 1) : 0
            }
        }
        
    }
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        for attribute in cache {
            if attribute.frame.intersects(rect) {
                visibleLayoutAttributes.append(attribute)
            }
        }
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
    
}
