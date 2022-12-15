//
//  customshape.swift
//  khalo demo
//
//  Created by Furqan on 14/12/2022.
//

import SwiftUI

struct triangle:Shape
{
    func path(in rect: CGRect) -> Path {
     var path = Path()
     let center = CGPoint(x: rect.midX, y: rect.midY)
     let startingPoint = CGPoint(x: rect.maxX, y: center.y)
     path.move(to: startingPoint)
     let secondPoint = CGPoint(x: center.x, y: rect.maxY)
     let thirdPoint = CGPoint(x: rect.minX , y: center.y)
     let fourthPoint = CGPoint(x: center.x, y: rect.minY)
        
     path.addLine(to: secondPoint)
     path.addLine(to: thirdPoint)
     path.addLine(to: fourthPoint)
     path.addLine(to: startingPoint)
        
     return path
    }
  
}

struct customshape: View {
    var body: some View {
        triangle()
            .foregroundColor(.red)
            .frame(width: 30, height: 30)
            .overlay{
                Image(systemName: "arrow.forward")
                    .foregroundColor(.white)
                    
                
            }
    }
}

struct customshape_Previews: PreviewProvider {
    static var previews: some View {
        customshape()
    }
}
