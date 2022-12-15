//
//  Custome Card.swift
//  khalo demo
//
//  Created by Furqan on 12/12/2022.
//

import SwiftUI

struct Custome_Card: View {
    var image:String
    var name:String
    var review:Double
    var time:Int
    var body: some View {
       
                ZStack(alignment: .top)
               {
        
                       RoundedRectangle(cornerRadius: 10)
                       .strokeBorder(lineWidth:1)
                       .frame(width: UIScreen.main.bounds.width - 10, height: 320)
                       .padding()
                    
                       VStack
                       {
                       
                           Image(image)
                               .scaledToFill()
                               .frame(width: UIScreen.main.bounds.width - 10, height: 250)
                               .cornerRadius(7)
                       
                       
                           HStack
                           {
                               Text(name)
                                   .font(.title3)
                                   .bold()
                               Spacer()
                               HStack
                               {
                                Image(systemName: "star.fill")
                                   .frame(width: 20, height: 20)
                                   .foregroundColor(.orange)
                                Text("\(review)(2.k+)")
                                       .font(.subheadline)
                                       .bold()
                               }
                       
                       
                           }.padding(.horizontal)
                       
                           HStack
                           {
                               Image(systemName: "person.fill")
                               Text("\(time)mins")
                                   .opacity(0.5)
                               Spacer()
                               Image(systemName: "info.circle")
                                   
                       
                           }.padding(.horizontal)
                       
                           
                   }
                    .padding()
                  
    
            
               }
    }
}

struct Custome_Card_Previews: PreviewProvider {
    static var previews: some View {
        Group
        {
            Custome_Card(image: "abc", name: "aaa", review: 1.2, time: 12)
                .padding(.horizontal)
            Custome_Card(image: "abc", name: "aaa", review: 1.2, time: 12)
               
        }
       
            .previewLayout(.fixed(width: 360, height: 380))
            
    }
}


