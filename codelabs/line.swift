//
//  Line.swift
//  codelabs
//
//  Created by dzakifa on 09/08/19.
//  Copyright © 2019 dzakifa. All rights reserved.
//

import UIKit

class Line: UIView {

    var line = UIBezierPath()
    func graph() {
        line.move(to: .init(x: 0, y: bounds.height / 5))
        line.addLine(to: .init(x: bounds.width, y: bounds.height / 5))
        UIColor.white.setStroke()
        line.lineWidth = 2
        line.stroke()
    }
    
    override func draw(_ rect: CGRect) {
        graph()
    }

}
