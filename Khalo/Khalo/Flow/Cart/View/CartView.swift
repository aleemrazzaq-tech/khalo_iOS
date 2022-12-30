//
//  CartView.swift
//  Khalo
//
//  Created by Furqan on 20/12/2022.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var item:PickUpViewModel
    @Environment(\.dismiss)var dismiss
    @State var binding:String = ""
    @State private var showGreeting = true
    @State private var select = true
    @State private var select2 = false
    
    var body: some View
    {
        VStack()
        {
            Section(header: Text("PickUp Location").offset(x:(UIScreen.main.bounds.size.width/3) * -1).padding())
           {
            HStack
            {
                Image(systemName: "airtag.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .padding()
                TextField("User Location", text: $binding)
                customshape()
                    .frame(width: 30, height: 30)
                    .padding()
            }
            .frame(width:UIScreen.main.bounds.size.width-14, height: 70)
            .background(.white)
         }
        .shadow(radius: 10)
        ScrollView
        {
            
            Section(header: Text("Cart").offset(x:(UIScreen.main.bounds.size.width/2.5) * -1).font(.title2))
               {
           
                   ZStack(alignment: .center)
                   {
                       
                       RoundedRectangle(cornerRadius: 2)
                        .frame(width:UIScreen.main.bounds.size.width-14)
                       .foregroundColor(.white)
                       .padding()
    
                       VStack()
                       {
                           HStack(alignment:.center)
                           {
                               Image("pizza")
                                   .resizable()
                                   .scaledToFit()
                                   .frame(width: 75, height: 75)
                                   .padding(.leading)
                                   
           
                               Text("Flaming Wok-Gulberg")
                                   .multilineTextAlignment(.leading)
                               Spacer()
                               Button(action:{})
                               {
                                   Text("Clear")
                                       .foregroundColor(.red)
                                       .padding(.horizontal)
                               }
           
                           }
                           .frame(width: UIScreen.main.bounds.size.width-10)
                           .padding(.horizontal)
//                           .padding([.leading, .trailing])
                           ForEach(0..<item.cartItem.count , id:\.self)
                           {
                               itr in
                               ItemView(name: item.cartItem[itr].name, quantity:  item.cartItem[itr].totalItem, price:  Int(item.cartItem[itr].price))
                                   .frame(width:UIScreen.main.bounds.size.width-10,height: 50)
                                   .padding(.horizontal)
                               Divider()
                           }
           
                           HStack
                           {
                               Text("Subtotal")
                                   .foregroundColor(.gray)
                                   .padding([.horizontal])
                               Spacer()
                               Text("PKR \(PickUpViewModel.totalPrice)")
                                   .padding([.horizontal])
           
                           }
                           .frame(width: UIScreen.main.bounds.size.width-10)
                           .padding(.horizontal)
                           Divider()
                           HStack
                           {
                               Text("Total")
                                   .foregroundColor(.gray)
                                   .padding([.horizontal])
                               Spacer()
                               Text("PKR \(PickUpViewModel.totalPrice)")
                                   .padding([.horizontal])
           
                           }
                           .frame(width: UIScreen.main.bounds.size.width-10)
                           .padding(.horizontal)
                           Divider()
                           HStack
                           {
                               Text("Promo/Referral Code")
                                   .foregroundColor(.red)
                                   .padding()
                                 
                               Spacer(minLength: 10)
                               Text(">")
                                   .foregroundColor(.red)
                                   .padding([.horizontal])
           
                           }
                           .frame(width: UIScreen.main.bounds.size.width-10)
                           .padding()
           
                       }.padding()
           
                   }
               }
            
            Section(header: Text("Payment").offset(x:(UIScreen.main.bounds.size.width/3) * -1).font(.title2))
               {
           
                   ZStack(alignment: .center)
                   {
                       RoundedRectangle(cornerRadius: 2)
                       .foregroundColor(.white)
                       .frame(width: UIScreen.main.bounds.size.width-10 , height: 200)
                       .padding(.horizontal)
                      
                       
                      
                       
                       VStack()
                       {
                          
                           
                           HStack
                           {
                               Text("Use Wallet")
                                   .fontWeight(.black)
                                   .font(.title3)
                                   .padding(.horizontal)
                                  
                               Spacer()
                               HStack(spacing:5)
                               {
                                   Text("PKR0.00")
                                       .fontWeight(.black)
                                       .foregroundColor(.green)
                                       
                                   
                                   Toggle("", isOn: $showGreeting)
                                       .frame(width: 20)
                                       .padding(.horizontal)
                               }
                               
                           }
                           .frame(width: UIScreen.main.bounds.size.width-20)
                           .padding(.horizontal)
                          
                         
                           HStack(spacing:10)
                           {
                            RectangularButton(isSelected: $select)
                                   .onTapGesture {
                                       select.toggle()
                                       select2.toggle()
                                   }
                                   
                            RectangularButton(isSelected: $select2)
                                   .onTapGesture {
                                       select2.toggle()
                                       select.toggle()
                                   }
                           }
                           .frame(width: UIScreen.main.bounds.size.width-20)
                          
                          
                           
                           .padding(.horizontal)
                           Label("Order prepration will start after payment", systemImage: "exclamationmark.circle")
                            .font(.subheadline)
                           .foregroundColor(.red)
                           .padding()
                           
                         
                           
                       }.padding()

                       
                   }
                   descriptionBox()
                     
                      
               }
            
           
            
          
        }.background(.gray.opacity(0.2))
            
        
            //scroll
        Slider()
                .frame(height:75)
                .clipShape(Rectangle())
        
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
    

struct RectangularButton:View
{
    @Binding var isSelected:Bool
    var body:some View
    {
        
        ZStack
        {
        if isSelected
            {
            RoundedRectangle(cornerRadius: 5)
            .foregroundColor(.red)
            .frame(width:  (UIScreen.main.bounds.size.width-20)/2, height:65)
           
            
       
        }
            else{
               
                RoundedRectangle(cornerRadius: 5)
                .stroke()
                .foregroundColor(.black.opacity(0.2))
                .shadow(radius: 10)
                .frame(width:  (UIScreen.main.bounds.size.width-14)/2, height:65)
               

            }
       
        VStack
        {
            Text("Cash")
                .foregroundColor(isSelected ? .white:.black)
            Text("on PickUp")
                .foregroundColor(isSelected ? .white:.black)
        }
        }
    }
}



struct CartView_Previews: PreviewProvider {
   
    static var previews: some View {
       
        CartView(item:PickUpViewModel(), binding: "Lahore johar town lahore ")
        
        
       
           
           
    }
}
