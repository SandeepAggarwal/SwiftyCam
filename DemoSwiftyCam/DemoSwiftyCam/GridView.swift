//
//  GridView.swift
//  DemoSwiftyCam
//
//  Created by Sandeep Aggarwal on 29/11/17.
//  Copyright © 2017 Cappsule. All rights reserved.
//

import Foundation
import UIKit

class GridView: UIView
{
    var lineWidth: CGFloat!
    var numberOfColumns: Int!
    var numberOfRows: Int!
    
    init()
    {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func draw(_ rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(lineWidth)
        context?.setStrokeColor(UIColor.white.withAlphaComponent(0.7).cgColor)
        
        let columnWidth = bounds.size.width / (CGFloat)(numberOfColumns + 1)
        let rowHeight = bounds.size.height / (CGFloat)(numberOfRows + 1)
        
        for i in 1...numberOfColumns
        {
            var startPoint = CGPoint()
            startPoint.x = columnWidth * (CGFloat)(i)
            startPoint.y = 0.0
            
            var endPoint = CGPoint()
            endPoint.x = startPoint.x
            endPoint.y = bounds.size.height
            
            context?.move(to: startPoint)
            context?.addLine(to: endPoint)
            context?.strokePath()
        }
        
        for i in 1...numberOfRows
        {
            var startPoint = CGPoint()
            startPoint.x = 0.0
            startPoint.y = rowHeight * (CGFloat)(i)
            
            var endPoint = CGPoint()
            endPoint.x = bounds.size.width
            endPoint.y = startPoint.y
            
            context?.move(to: startPoint)
            context?.addLine(to: endPoint)
            context?.strokePath()
        }
    }
    
    func setup()
    {
        backgroundColor = .clear
        lineWidth = 0.5
    }
}
