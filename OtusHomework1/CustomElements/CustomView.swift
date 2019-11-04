//
//  CustomView.swift
//  OtusHomework1
//
//  Created by MacMini Elis on 28/08/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    @IBInspectable var bgColor: UIColor? {
        didSet {
            backgroundColor = bgColor
        }
    }
    
    @IBInspectable var radius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = radius
        }
    }
        
    
    
    func loadNib(){
        guard let nib = Bundle.main.loadNibNamed("CustomView", owner: nil, options: nil) else {return}
        guard let view = nib.first as? UIView else {return}
        addSubview(view)
    }
}
