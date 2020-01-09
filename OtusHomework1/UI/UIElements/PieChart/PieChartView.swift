//
//  PieChartView.swift
//  OtusHomework1
//
//  Created by 7Winds on 08/10/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import UIKit

@IBDesignable
class PieChartView: UIView {
    
    private lazy var textAttributes: [NSAttributedString.Key: Any] = [
        .font               : UIFont.systemFont(ofSize: 14),
        .foregroundColor    : UIColor.black
    ]
    
    var pies = [Pie]() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private var diameter: CGFloat = 0
    private var spacing: CGFloat = 1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let diameter = min(frame.width, frame.height)
        setSize(diameter: diameter)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        setChart()
    }
    
    override func prepareForInterfaceBuilder() {
        setNeedsDisplay()
    }
    
    func setSize(diameter: CGFloat, spacing: CGFloat = 1) {
        self.diameter = diameter
        self.spacing = spacing
        setChart()
    }
    
    func update(values: [Pie]) {
        self.pies = values
        setChart()
    }
    
    private func setChart() {
        guard let ctx = UIGraphicsGetCurrentContext() else {
            return
        }
        layer.backgroundColor = backgroundColor?.cgColor
        
        let radius: CGFloat
        let leastLength: CGFloat = min(frame.width, frame.height)
        if diameter > 0 && diameter < leastLength {
            radius = diameter / 2
        } else {
            radius = leastLength / 2
        }
        
        let textPositionOffset: CGFloat = 0.5
        let viewCenter = bounds.center
        
        let totalSegmentsValue = pies.map({ $0.value }).reduce(0, +)
        var startAngle = -CGFloat.pi / 2
        
        for segment in pies {
            ctx.setFillColor(segment.color.cgColor)
            
            let endAngle = startAngle + 2 * .pi * (segment.value / totalSegmentsValue)
            ctx.move(to: viewCenter)
            ctx.addArc(center: viewCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            ctx.fillPath()
            
            ctx.move(to: viewCenter)
            ctx.addLine(to: CGPoint(center: viewCenter, radius: radius, degrees: endAngle))
            ctx.setStrokeColor(UIColor.black.cgColor)
            ctx.setLineWidth(1)
            ctx.strokePath()
            
            let halfAngle = startAngle + (endAngle - startAngle) * 0.5
            let segmentCenter = viewCenter.projected(by: radius * textPositionOffset, angle: halfAngle)
            let textToRender = titleFor(segment)
            let renderRect = CGRect(centeredOn: segmentCenter, size: textToRender.size())
            textToRender.draw(in: renderRect)
            startAngle = endAngle
        }
    }
    
    
    private func titleFor(_ segment: Pie) -> NSAttributedString {
        
        let segmentPercent: Int = {
            let totalValue = pies.reduce(0, { $0 + $1.value })
            return Int((segment.value / totalValue) * 100)
        }()
        
        let mainTextRow = NSAttributedString.init(string: segment.title, attributes: textAttributes)
        let subTextRow = NSAttributedString.init(string: "\(segmentPercent) %", attributes: textAttributes)
        
        let result = NSMutableAttributedString.init(attributedString: mainTextRow)
        result.append(NSAttributedString(string: "\n"))
        result.append(subTextRow)
        
        return result
    }
}


extension CGFloat {
    var radiansToDegrees: CGFloat {
        return self * 180 / .pi
    }
}

extension CGPoint {
    init(center: CGPoint, radius: CGFloat, degrees: CGFloat) {
        self.init( x: cos(degrees) * radius + center.x,
                   y: sin(degrees) * radius + center.y)
    }
    
    func projected(by value: CGFloat, angle: CGFloat) -> CGPoint {
        return CGPoint(x: x + value * cos(angle),
                       y: y + value * sin(angle))
    }
}

extension CGRect {
    init(centeredOn center: CGPoint, size: CGSize) {
        self.init( origin: CGPoint(x: center.x - size.width * 0.5,
                                   y: center.y - size.height * 0.5),
                   size: size )
    }
    var center: CGPoint {
        return CGPoint( x: width / 2 + origin.x,
                        y: height / 2 + origin.y )
    }
}
