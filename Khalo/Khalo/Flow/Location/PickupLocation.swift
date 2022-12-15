//
//  PickupLocation.swift
//  Khalo
//
//  Created by Furqan on 14/12/2022.
//

import SwiftUI

struct PickupLocation: View {
    @Binding var changeSegment:Bool
    @Binding var isSelected:Bool
    var body: some View {
            List
        {
            Section(header: Text("Select Pickup Point"))
            {
                ForEach((0..<3) , id:\.self)
                { _ in
                    PickUpDesign()
                        .listRowSeparatorTint(.black)
                        .listRowInsets(.init(top: 15,
                                             leading: 0,
                                             bottom: 15,
                                             trailing: 0))
                }
               

            }
        }.navigationBarTitleDisplayMode(.inline)
            .onAppear()
            {
                changeSegment = false
                isSelected = false
            }

    }
    
    @ViewBuilder
    func PickUpDesign()->some View
    {
        HStack
        {
            Image(systemName: "airtag.fill").padding()
            VStack(alignment: .leading)
            {
                Text("Byte-Gulberg")
                    .bold()
                    .multilineTextAlignment(.leading)
                    
                Text("Location in which we are oferring our services").foregroundColor(.gray)
                  
            }
            
        }
    }
}
//
//struct PickupLocation_Previews: PreviewProvider {
//    static var previews: some View {
//        PickupLocation(changeSegment: <#Binding<Bool>#>)
//    }
//}
