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
                        TabBarView(currentTab:$currentTab)
                        .frame(height: 40)
                        .offset(y:20)
                    }
                    
                    Divider().padding()
                        .offset(y:21)
                    
                    
                TabView(selection:$currentTab)
                {
                     dummyView().tag(0)
                    dummyView1().tag(1)
                    dummyView2().tag(2)
                    dummyView2().tag(3)
                    dummyView2().tag(4)
                    dummyView2().tag(5)

                }
                .tabViewStyle(.page(indexDisplayMode:.never))
                    
                 if showcart
                    {
                    HStack(alignment: .center)
                    {
                        Spacer()
                        NavigationLink(destination: CartView())
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
    func dummyView()->some View
    {
        ScrollView
        {
            ForEach((0...4), id:\.self)
            {
                content in
                DetailCard()
                    .padding()
                    .onTapGesture {
                        showOptions.toggle()
                    }
                    .actionSheet(isPresented: $showOptions)
                {
                        ActionSheet(title: Text("What do you want to do?"),
                        message: nil,
                        buttons: [
                           .default(Text("Add to cart")) {
                               showcart = true
                           },
                           .default(Text("Mark as favorite")) {
                           },
                           .cancel()
                           ])
                    }
                       
            }
           
           
        }
    }
    func dummyView1()->some View
    {
       
            Color.red
            .opacity(0.2)
            .edgesIgnoringSafeArea(.all)
    }
    func dummyView2()->some View
    {
       
        Color.green
            .opacity(0.2)
            .edgesIgnoringSafeArea(.all)
    }
}

struct PickUPView_Previews: PreviewProvider {
    static var previews: some View {
        PickUPView()
    }
}
struct TabBarView:View
{
    @Binding var currentTab:Int
    var items = ["Omelette" , "Desi" , "Kabab" , "Pizza" , "PizzaRoll" , "Sides"]
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
                    ForEach(0...5,id:\.self)
                    {
                        item in
                        TabBarItem(currentItem: $currentTab, namespace: self.namespace, tabBarItemName: items[item], tab: item)
                        {
                            currentItem in
                            proxy .scrollTo(currentItem ,anchor: .center)
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
