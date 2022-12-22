//
//  DetailCard.swift
//  Khalo
//
//  Created by Furqan on 19/12/2022.
//

import SwiftUI

struct DetailCard: View {
    var name:String
    var price:Double
    var body: some View {
        ZStack
        {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width-10, height: 170)
                .shadow(radius: 5)
                .overlay()
                {
                    HStack() {
                      
                            VStack(alignment: .leading)
                            {
                                Text(name)
                                    .bold()
                                    .font(.title2)
                                Spacer()
                                
                                HStack
                                {
                                    Image(systemName: "star.fill")
                                       .foregroundColor(.orange)
                                    Text("4.5 (40)")
                                }
                                Spacer()
                                Text("Two eggs cooked with a mix of mozzarella and cheddar cheese")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                Spacer()
  
                                
                                Text("PKR\(String(format: "%.2f", price))")
                                    .padding(.bottom)
                                 
                                
                          }
                            
                            .offset(x:10 )
                        Image("pizza")
                             .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 130)
                            .clipShape(Circle())
                            
                    }
                }

       
        }
    }
}

struct DetailCard_Previews: PreviewProvider {
    static var previews: some View {
        DetailCard(name: "Resturant 1", price:10.0)
        DetailCard(name: "Resturant 1", price:10.0)
            .preferredColorScheme(.dark)
        
    }
}
