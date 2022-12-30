//
//  TextField.swift
//  khalo demo
//
//  Created by Furqan on 05/12/2022.
//

import SwiftUI

struct TextFieldDesign: View {
    @State var user:String
    var infoText:String
    init(value:String , text:String)
    {
        user = value
        self.infoText = text
    }
  
   
    var body: some View {
        HStack
        {
           
            TextField(infoText, text: $user)
                .padding(.leading,12)
                .font(.system(size: 20))
                .foregroundColor(.black)
                
                
        }
        .shadow(radius: 10)
        .cornerRadius(40)
        .frame(width: 300 , height: 50)
    }
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldDesign(value:"", text: "E.g:Don't ring bell")
    }
}
