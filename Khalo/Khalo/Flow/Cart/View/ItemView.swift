//
//  ItemView.swift
//  Khalo
//
//  Created by Furqan on 20/12/2022.
//

import SwiftUI

struct ItemView: View
{
    var name:String
    var quantity:Int
    var price:Int
    @State var isAnimation:Bool = false
    var body: some View
    {
        HStack(spacing:15)
        {
            ZStack
            {
               if isAnimation
                {
               HStack
                {
                    Button(action:{})
                    {
                        Image(systemName: "minus")
                            .font(.system(size: 16, weight: .heavy))
                            .foregroundColor(.black)
                    }
                    Text("\(quantity)")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .padding(.vertical , 5)
                        .padding(.horizontal ,10)
                        .background(Color.black.opacity(0.06))
                    Button(action:{})
                    {
                        Image(systemName: "plus")
                            .font(.system(size: 16, weight: .heavy))
                            .foregroundColor(.black)
                    }
                }
                .offset(x: isAnimation ? 90:0)
               }
                
                
                Rectangle()
                    .stroke()
                     .frame(width: 50, height: 50)
                    .overlay()
                 {
                    Text("\(quantity)")
                        .onTapGesture {
                            withAnimation(.default)
                            {
                                isAnimation.toggle()
                            }
                        }
                   
                }
            }
            if !isAnimation
            {
            Text("\(name)")
                .foregroundColor(.gray)
                
            }
            Spacer()
            Text("PKR \(price)")
                 .foregroundColor(.black)
           
         
            
        }
        .padding()
        
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(name: "", quantity: 100 ,price: 16)
    }
}
