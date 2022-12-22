//
//  ItemView.swift
//  Khalo
//
//  Created by Furqan on 20/12/2022.
//

import SwiftUI

struct ItemView: View {
    var name:String
    var quantity:Int
    var body: some View {
        HStack(spacing:15)
        {
            Image("pizza")
                .resizable()
                .aspectRatio(contentMode:.fill)
                .frame(width: 130, height: 130)
                .cornerRadius(15)
            VStack(alignment: .leading, spacing: 10)
            {
                Text(name)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                HStack(spacing: 15)
                {
                    Text("food")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                     Spacer(minLength: 0)
                    
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
            }
            
        }
        .padding()
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(name: "", quantity: 100)
    }
}
