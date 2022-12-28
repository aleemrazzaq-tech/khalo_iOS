//
//  PickUPView.swift
//  Khalo
//
//  Created by Furqan on 15/12/2022.
//

import SwiftUI

struct PickUPView: View {
    @Environment(\.dismiss)var dismiss
    @State var currentTab:Int = 0
    @State var showOptions:Bool = false
    @State var showcart:Bool = true
    @State var index:Int = 0
    var item = PickUpViewModel()
    var segment:[Segment]
    var body: some View
    {
            VStack()
                {
                 
                    HStack
                    {
                        
                        Button(action:{dismiss()})
                        {
                             Image(systemName: "chevron.backward")
                                .scaledToFit()
                                .foregroundColor(.black)
                        }.padding(.leading)
                        Spacer()
                        Text("Nashta Washta - Gulberg")
                            .bold()
                        Spacer()
                    }
                    
                    Spacer()
                    Spacer()
                    VStack
                    {
                        TabBarView(currentTab:$currentTab,segment:self.segment)
                        .frame(height: 40)
                        .offset(y:20)
                    }
                    
                    Divider().padding()
                        .offset(y:21)
                    
                    
                TabView(selection:$currentTab)
                {
                    ForEach(0..<segment.count , id:\.self)
                    {
                        itr in
                        dummyView(dishes: segment[itr].dishes, obj: item).tag(itr)
                    }

                }
                .tabViewStyle(.page(indexDisplayMode:.never))
                    
                 if showcart
                    {
                     RoundedRectangle(cornerRadius: 0)
                         .frame(width:UIScreen.main.bounds.width,height: 60)
                         .foregroundColor(.red)
                         .overlay(
                             HStack
                             {
                                 NavigationLink(destination: CartView(item: self.item))
                                 {
                                  Text("Checkout(items)")
                                 .fontWeight(.black)
                                 .foregroundColor(.white)
                                 }
                                 

                             Spacer()
                             RoundedRectangle(cornerRadius: 20)
                                 .frame(width: 130, height: 40)
                                 .foregroundColor(Color.black.opacity(0.3))
                                 .shadow(radius: 10)
                                 .overlay(
                                    Text("PKR \(item.allPrice)")
                                         .foregroundColor(.white)
                                 )
                             }.padding()
                         )
                    
                
                 }
                   
            }.navigationBarHidden(true)
        
        
            
            
    }
    
    
    @ViewBuilder
    func dummyView(dishes:[Dish] , obj:PickUpViewModel)->some View
    {
        
        ScrollView
        {
            ForEach((0..<dishes.count), id:\.self)
            {
                content in
                NavigationLink(destination:DetailPageView(itemName: dishes[content].name, itemPrice:  dishes[content].price,object:item))
                {
                   DetailCard(name:dishes[content].name, price: dishes[content].price)
                    .padding()
                }.foregroundColor(.black)
                    
                   
                       
            }
           
           
        }
    }
}

struct PickUPView_Previews: PreviewProvider {
    static var previews: some View {
        PickUPView(segment: [])
    }
}
struct TabBarView:View
{
    @Binding var currentTab:Int
    var segment:[Segment]
    var items:[String] = ["Dummy"]
    init(currentTab:Binding<Int> ,segment:[Segment])
    {
        self._currentTab = currentTab
        self.segment = segment
        items =  segment.map{(resturant) -> String in return resturant.name}
    }
    @Namespace var namespace
    var body:some View
    {
       
        VStack
        {
        ScrollViewReader {
            proxy
            in
        ScrollView(.horizontal , showsIndicators: false)
        {
           
              
                HStack(alignment:.center,spacing:30)
                {
                    ForEach(0..<items.count,id:\.self)
                    {
                        item in
                        let _ = print("DATA\(items.count)")
                        TabBarItem(currentItem: $currentTab, namespace: self.namespace, tabBarItemName: items[item], tab: item)
                        {
                            currentItem in
                            proxy.scrollTo(currentItem ,anchor: .center)
                        }
                          
                        
                    }
                        
                    
                }
                .padding(.horizontal)
      }
            
            
         }
            .frame(height:80)
            .edgesIgnoringSafeArea(.all)
            .font(.title2)
            
            
        }
            
            
    }
    
}
struct TabBarItem:View
{
    @Binding var currentItem:Int
    let namespace:Namespace.ID
    var tabBarItemName:String
    var tab:Int
    var scroll:(Int)->Void
    
    var body:some View
    {
        Button()
        {
            self.currentItem = tab
            scroll(currentItem)
        }
       label:{
           VStack
           {
            Spacer()
            
           if currentItem == tab{
               Text(tabBarItemName)
                      .foregroundColor(.red)
               Color.red.frame(height:2)
                   .matchedGeometryEffect(id: "under", in:  self.namespace , properties: .frame)
               
           }
           else{
               Text(tabBarItemName)
                      .foregroundColor(.gray)
               Color.clear.frame(height:2)
           }
        }
       }
    }
}



