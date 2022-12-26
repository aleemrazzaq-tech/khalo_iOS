//
//  DetailPageView.swift
//  Khalo
//
//  Created by Furqan on 22/12/2022.
//

import SwiftUI

struct DetailPageView: View {
    @Environment(\.dismiss)var dismiss
    @State var totalItems = 1
    var itemPrice:Double
    @State var totalPrice:Double = 0
    var itemName:String
    @ObservedObject var object:PickUpViewModel
    init(itemName:String  , itemPrice:Double , object:PickUpViewModel)
    {
        print("Item price\(itemPrice)")
        self.itemPrice = itemPrice
        self.itemName = itemName
        self.object = object
        
    }
    var body: some View
    {
        VStack(alignment: .center)
        {
         Image("burger")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 250)
            ScrollView{
                VStack(alignment: .leading , spacing: 10)
               {
                  Text("\(itemName)")
                       .fontWeight(.bold)
                       .font(.title)
                       .padding(.horizontal)
                 
                   
                   HStack
                   {
                       Text("PKR \(itemPrice)")
                           .fontWeight(.black)

                       Spacer()
                       RoundedRectangle(cornerRadius: 20)
                           .frame(width: 130, height: 40)
                           .foregroundColor(.white)
                           .shadow(radius: 10)
                           .overlay(
                              HStack
                              {
                                  Button(action:{
                                      if totalItems > 1
                                      {
                                    
                                       totalPrice = totalPrice - itemPrice
                                       totalItems -= 1
                                      }
                                  })
                                  {
                                      Image(systemName: "minus")
                                          .font(.system(size: 16, weight: .heavy))
                                          .foregroundColor(.black)
                                  }
                                  Text("\(totalItems)")
                                      .fontWeight(.heavy)
                                      .foregroundColor(.black)
                                      .padding(.vertical , 5)
                                      .padding(.horizontal ,10)
                                  Button(action:{
                                      totalItems += 1
                                      totalPrice = itemPrice * Double(totalItems)
                                      
                                  }
                                  )
                                  {
                                      Image(systemName: "plus")
                                          .font(.system(size: 16, weight: .heavy))
                                          .foregroundColor(.red)
                                      
                                  }
                              }
                           )
                   }.padding(.horizontal)
                 
           }
                Divider().padding()
                
                VStack(alignment: .leading , spacing: 10)
                {
                    Text("Item Title")
                         .fontWeight(.bold)
                         .font(.title)
                         .padding(.horizontal)
                    Text("Flat round mass of minced meat or vegetables, which is fried sweet,sour salt with a bit of crunch")
                        .padding(.horizontal)
                    HStack
                    {Spacer()}
                }
                Divider().padding()
            }
            
            RoundedRectangle(cornerRadius: 0)
                .frame(width:UIScreen.main.bounds.width,height: 60)
                .foregroundColor(.red)
                .overlay(
                    HStack
                    {
                    Text("Add to cart")
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .onTapGesture {
                            print("Item price2\(itemPrice)")
                            object.addToCart(name: itemName, totalItem: self.totalItems, price: itemPrice, calculatedValue: totalPrice == Double(0)  ? itemPrice:totalPrice)
                           dismiss()
                        }

                    Spacer()
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 130, height: 40)
                        .foregroundColor(Color.black.opacity(0.3))
                        .shadow(radius: 10)
                        .overlay(
                            Text("PKR \(totalPrice == 0 ? totalPrice+itemPrice: totalPrice)")
                                .foregroundColor(.white)
                        )
                    }.padding()
                )
            
           
        
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                HStack(spacing:20)
                    {
                        
                        Button(action:{dismiss()})
                        {
                             Image(systemName: "chevron.backward")
                                .scaledToFit()
                                .foregroundColor(.black)
                        }.padding(.leading)
                        
                       
                        Text("Nashta Washta - Gulberg")
                            .bold()
                      
                        
                    }
                  
                
            }
        }
    }
}

struct DetailPageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPageView(itemName: "Dummy", itemPrice: 10 , object: PickUpViewModel())
    }
}
