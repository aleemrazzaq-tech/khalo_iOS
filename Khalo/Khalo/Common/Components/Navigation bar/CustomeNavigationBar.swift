//
//  CustomeNvigationBar.swift
//  khalo demo
//
//  Created by Furqan on 10/12/2022.
//

import SwiftUI

struct CustomeNavigationBar: View {
    @Binding var isCkeck:Bool
    var body: some View {
        HStack()
        {
            MainButton
            Spacer()
            titleSection
            Spacer()
            MainButton.opacity(0)
        }
        .padding(.bottom)
        .accentColor(.black)
        .background(Color.white.ignoresSafeArea(edges: .top))
        .font(.headline)
       
            
    }
}

//struct CustomeNvigationBar_Previews: PreviewProvider {
//    @Binding var value:Bool
//    static var previews: some View
//    {
//        VStack
//        {
//        
//            CustomeNavigationBar(isCkeck: true)
//            Spacer()
//        }
//    }
//}

extension CustomeNavigationBar
{
    private var MainButton: some View
    {
        
            Button(action:{
                isCkeck.toggle()
            })
            {
                Image(systemName: "ellipsis")
                    .padding()
                
            }

    }
    private var titleSection:some View
    {
        VStack(spacing:4)
        {
            Text("DELIVERY TO")
                .font(.title2)
                .fontWeight(.semibold)
            Text("Work")
            
        }
    }
}

