//
//  CustomButton.swift
//  khalo demo
//
//  Created by Furqan on 05/12/2022.
//

import SwiftUI

struct CustomButton: ButtonStyle {
    var color:LinearGradient
    func makeBody(configuration: Configuration) -> some View
    {
        HStack
        {
            Spacer()
            configuration.label.foregroundColor(.white)   
            Spacer()
        }.padding(12)
         .background(color.cornerRadius(5))
         .frame(width: 300)
         
            
    }
}

