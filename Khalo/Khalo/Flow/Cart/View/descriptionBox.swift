//
//  descriptionBox.swift
//  Khalo
//
//  Created by Furqan on 30/12/2022.
//

import SwiftUI

struct descriptionBox: View {
    @State var val:Bool = true
    var body: some View {
        HStack
        {
          
          Rectangle()
            .frame(height: val == true ? 50 : 300)
            .foregroundColor(.white)
            .padding()
            .overlay(alignment:.top)
            {
                HStack(alignment: .center,spacing: 150){
                    Text("Delivery Instruction")
                        .font(.headline)
                    Image(systemName: val == true ? "arrow.down":"arrow.up")
                }
                .onTapGesture {
                    val.toggle()
                }
                .frame(height:50)
                .background(.white)
                    .padding()
                
               
                
                if val
                {
                    TextFieldDesign(value:"", text: "E.g:Don't ring bell")
                        .hidden()
                }
                else{
                    TextFieldDesign(value:"", text: "E.g:Don't ring bell")
                        .offset(y: 50)
                        
                }
            }
            
    }
}
}

struct descriptionBox_Previews: PreviewProvider {
    static var previews: some View {
        descriptionBox()
    }
}
