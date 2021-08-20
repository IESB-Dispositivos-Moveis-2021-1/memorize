//
//  Timer.swift
//  Memorize
//
//  Created by Pedro Henrique on 19/08/21.
//

import SwiftUI

struct Timer: Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(startAngle.radians, endAngle.radians)
        }
        set {
            startAngle = Angle(radians: newValue.first)
            endAngle = Angle(radians: newValue.second)
        }
    }
    
    
    func path(in rect: CGRect) -> Path {
        let center = rect.center
        let radius = min(rect.width, rect.height) / 2
        let startingPoint = CGPoint(
            x: center.x + radius * cos(CGFloat(startAngle.radians)),
            y: center.y + radius * sin(CGFloat(startAngle.radians))
        )
        
        var circle = Path()
        circle.move(to: center)
        circle.addLine(to: startingPoint)
        circle.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        circle.addLine(to: center)
        
        return circle
    }
    
}

fileprivate extension CGRect {
    
    var center: CGPoint {
        CGPoint(x: self.midX, y: self.midY)
    }
}

