//
//  CustomeTextField.swift
//  khalo demo
//
//  Created by Furqan on 06/12/2022.
//

import SwiftUI

struct CustomeTextField: View {
    var placeHolder:String
    var lineColor:Color
    var width:CGFloat
    @Binding var value:String 
    var body: some View {
        VStack
        {
            TextField(self.placeHolder , text: $value)
                .padding()
                .font(.title)
            
            Rectangle()
                .frame(height: self.width)
                .padding(.horizontal , 10)
                .foregroundColor(self.lineColor)
        }
    }
}


