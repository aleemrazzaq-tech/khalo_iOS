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
    @State var showcart:Bool = false
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
                            Image(systemName:"chevron.backward")
                                .resizable()
                                .frame(width: 15, height: 15)
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
                    HStack(alignment: .center)
                    {
                        Spacer()
                        NavigationLink(destination: CartView(item: self.item))
                        {
                           Image(systemName: "cart")
                        }
                        Spacer()
                    }
                    .background(.red)
                    
                
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
                DetailCard(name:dishes[content].name, price: dishes[content].price)
                    .padding()
                    .onTapGesture {
                        let _ = print("DATA C\(content)")
                        index = content
                        showOptions.toggle()
                    }
                    .actionSheet(isPresented: $showOptions)
                   {
                        ActionSheet(title: Text("What do you want to do?"),
                        message: nil,
                        buttons: [
                           .default(Text("Add to cart")) {
                               showcart = true
                               
                               obj.addToCart(item: dishes[index])
                           },
                           .default(Text("Mark as favorite")) {
                           },
                           .cancel()
                           ])
                    }
                       
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



