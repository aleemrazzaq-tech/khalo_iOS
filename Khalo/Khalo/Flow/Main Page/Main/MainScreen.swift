//
//  MainScreen.swift
//  khalo demo
//
//  Created by Furqan on 10/12/2022.
//

import SwiftUI

struct MainScreen: View {
    
    @State var isShow:Bool = false
    @State var segmentChange:Bool = true
   
    var body: some View
    {
        let drag = DragGesture()
            .onEnded {
                print($0.translation.width)
                if $0.translation.width < -100
                {
                    withAnimation {
                        self.isShow = false
                    }
                }
            }
        return ZStack(alignment: .top) {
            
            VStack
            {
                MainView(changeSegment:$segmentChange, isShow: self.$isShow).background(.red)
                if segmentChange{
                    ListCard()
                }
                
   
            }
                        GeometryReader {
                            geometry in
                            ZStack(alignment:.leading)
                            {
            
            
                               if isShow
                                {
                                       MenuView()
                                      .frame(width: geometry.size.width/1.25)}}
                                      .gesture(drag)
            
                        }
            
        }
       
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
           
    }
}

struct MainView:View
{
    @State var isSelected:Bool = true
    @Binding var changeSegment:Bool
    @Binding var isShow:Bool
    static let gradientStart = Color.red
    static let gradientEnd = Color(red: 80/255, green: 1/255, blue: 1/255)
    static let gradientsecondEnd = Color(red: 218/255, green: 218/255, blue: 218/255)
    
    //var linearColor = [Color.red , Color(red: 80/255, green: 1/255, blue: 1/255)]
    
    var body: some View {
       
        VStack(spacing:0)
        {
            CustomeNavigationBar(isCkeck: $isShow)
            let activeColor = LinearGradient(
                gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: .leading,
                endPoint: .trailing)
                
            let nonActiveColor = LinearGradient(
                gradient: .init(colors: [Self.gradientsecondEnd]),
                                         startPoint: .leading,
                                         endPoint: .trailing
            )

             
            HStack(spacing:0)
                {
                   
                    ZStack {
                        
                        Rectangle()
                            .fill(self.isSelected ? activeColor : nonActiveColor )
                            .onTapGesture()
                        {
                            isSelected = true
                           changeSegment = true
                        }
                        
                        HStack
                        {
                            Image("motor")
                                .resizable()
                                .scaledToFit()
                                .frame(width:20, height: 20)
                               
                            Text("Delivery")
                                .foregroundColor(.white)
     
                        }
                      
                    }
                   
                    ZStack {
                        Rectangle()
                            .fill(self.isSelected ?   nonActiveColor : activeColor)
                            .onTapGesture()
                        {
                            isSelected = false
                            changeSegment = false
                    }
                        HStack
                        {
                            Image("motor")
                                .resizable()
                                .scaledToFit()
                                .frame(width:20, height: 20)
                               
                            Text("Delivery")
                                .foregroundColor(.white)
                        }
                    }
                  
            }.frame(height:60)
            
           
        }
 
    }
}



