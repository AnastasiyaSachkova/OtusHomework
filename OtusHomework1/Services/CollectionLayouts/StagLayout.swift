//
//  StagLayout.swift
//  OtusHomework1
//
//  Created by MacMini Elis on 25/09/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation
import UIKit

public class StagLayout: UICollectionViewLayout {
    
    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        let sectionInsets = collectionView.contentInset
        return collectionView.bounds.width - (sectionInsets.left + sectionInsets.right)
    }
    
    private var frameHolder: StagLayoutFrameHolder!
    
    public init(widthHeightRatios: [(CGFloat, CGFloat)], itemSpacing: CGFloat) {
        super.init()
        frameHolder = StagLayoutFrameHolder(
            widthHeightRatios: widthHeightRatios,
            itemSpacing: itemSpacing
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public var collectionViewContentSize: CGSize {
        return frameHolder.collectionViewContentSize
    }
    
    override public func prepare() {
        super.prepare()
        guard frameHolder.prepared, let collectionView = collectionView else { return }
        frameHolder.prepare(itemCount: collectionView.numberOfItems(inSection: 0), contentWidth: contentWidth)
    }
    
    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return frameHolder.layoutAttributesForElements(in: rect)
    }
    
    override public func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return frameHolder.layoutAttributesForItem(at: indexPath)
    }
    
    override public func invalidateLayout() {
        super.invalidateLayout()
        frameHolder.invalidateLayout()
    }
}

class StagLayoutFrameHolder {
    
    var cache = [UICollectionViewLayoutAttributes]()
    
    private let widthHeightRatios: [(CGFloat, CGFloat)]
    private var contentWidth: CGFloat = 0
    private var contentHeight: CGFloat = 0
    private let itemSpacing: CGFloat
    
    var prepared: Bool { return cache.isEmpty }
    
    var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    public init(widthHeightRatios: [(CGFloat, CGFloat)], itemSpacing: CGFloat) {
        self.widthHeightRatios = widthHeightRatios
        self.itemSpacing = itemSpacing
    }
    
    public func prepare(itemCount: Int, contentWidth: CGFloat) {
        self.contentWidth = contentWidth
        
        var xOffset: CGFloat = 0
        var yOffset: CGFloat = 0
        var previousItemFrame: CGRect?
        var ratioIndex = 0
        
        for index in 0..<itemCount {
            if ratioIndex >= widthHeightRatios.count { ratioIndex = 0 }
            
            let ratios = widthHeightRatios[ratioIndex]
            precondition(
                ratios.0 >= 0.0 && ratios.1 >= 0.0 && ratios.0 <= 1.0,
                "Width ratio should be in [0.0, 1.0], with height ratio being in [0.0, ∞)"
            )
            
            let isFullWidth = ratios.0 == 1.0
            let halfItemSpacing = itemSpacing * 0.5
            let (width, height) = (
                (contentWidth * ratios.0) - (isFullWidth ? 0 : halfItemSpacing),
                contentWidth * ratios.1
            )
            
            var frame = CGRect(x: xOffset, y: yOffset, width: width, height: height)
            
            let indexPath = IndexPath(item: index, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame
            cache.append(attributes)
            
            contentHeight = max(contentHeight, frame.maxY)
            
            let hasReachedEnd = xOffset + width >= contentWidth
            let isItemNextToIt: Bool
            if let previousItemFrame = previousItemFrame {
                let isThereSpaceNextToIt = frame.maxY <= previousItemFrame.maxY
                isItemNextToIt = !isFullWidth && (frame.maxY - itemSpacing) <= previousItemFrame.maxY
                
                if !isThereSpaceNextToIt && isItemNextToIt {
                    frame = CGRect(x: xOffset, y: yOffset, width: width, height: height - itemSpacing)
                    attributes.frame = frame
                    cache.removeLast()
                    cache.append(attributes)
                }
            } else {
                isItemNextToIt = false
            }
            
            if isFullWidth || hasReachedEnd || isItemNextToIt {
                xOffset = 0
            } else {
                xOffset += frame.width + itemSpacing
            }
            
            if isFullWidth {
                yOffset = frame.maxY + itemSpacing
            } else {
                if let previousItemFrame = previousItemFrame {
                    yOffset = min(frame.maxY, previousItemFrame.maxY) + itemSpacing
                }
            }
            
            previousItemFrame = frame
            ratioIndex += 1
        }
    }
    
    public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        for attributes in cache where attributes.frame.intersects(rect) {
            visibleLayoutAttributes.append(attributes)
        }
        return visibleLayoutAttributes
    }
    
    public func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
    
    public func invalidateLayout() { cache.removeAll() }
}
