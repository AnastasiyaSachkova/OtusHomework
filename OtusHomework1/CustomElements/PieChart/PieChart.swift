//
//  PieChart.swift
//  OtusHomework1
//
//  Created by 7Winds on 08/10/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation
import UIKit

struct Pie {
    let value: CGFloat
    let title: String
    let color: UIColor
    
    init(title: String, value: CGFloat, color: UIColor) {
        self.title = title
        self.value = value
        self.color = color
    }
}
