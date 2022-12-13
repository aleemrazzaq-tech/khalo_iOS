//
//  TextField.swift
//  khalo demo
//
//  Created by Furqan on 05/12/2022.
//

import SwiftUI

struct TextFieldDesign: View {
    @State var user = ""
    var icon:String = "person.fill"
    
    var body: some View {
        HStack
        {
            Image(systemName: icon)
                .resizable()
                .frame(width: 20, height: 20)
            TextField("Enter Name", text: $user)
                .padding(.leading,12)
                .font(.system(size: 20))
                
        }
        .padding(20)
        .background(Color("CustomColor"))
        .overlay(RoundedRectangle(
                 cornerRadius: 40)
                    .strokeBorder(Color(red: 197/255, green: 197/255, blue: 197/255),lineWidth: 2)
                    .offset(x: 2, y: 2)
                    .clipped()
                       
                                            
        )
        .cornerRadius(40)
        .frame(width: 300)
    }
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldDesign()
    }
}
