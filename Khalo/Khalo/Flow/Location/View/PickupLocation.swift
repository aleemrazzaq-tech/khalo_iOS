//
//  PickupLocation.swift
//  Khalo
//
//  Created by Furqan on 14/12/2022.
//

import SwiftUI

struct PickupLocation: View {
//    @Binding var changeSegment:Bool
//    @Binding var isSelected:Bool
    
    @StateObject var Location = LocationViewModel()
    var body: some View {
            List
        {
            Section(header: Text("Select Pickup Point"))
            {
                ForEach((0..<Location.arrayCount) , id:\.self)
                { itr in
                    PickUpDesign(dataLocation: Location.arrayValue[itr])
                        .listRowSeparatorTint(.black)
                        .listRowInsets(.init(top: 15,
                                             leading: 0,
                                             bottom: 15,
                                             trailing: 0))
                }
                NavigationLink(destination:MapView(Location: Location))
                {
                HStack(spacing: 60)
                {
                 Text("Select another location")

                }
                }

            }
        }
    
        .navigationBarTitleDisplayMode(.inline)
            .onAppear()
            {
//                changeSegment = false
//                isSelected = falsent
                let _ = print("Data is \($Location.arrayValue.count)")
                let _ = print("Data is = \(Location.arrayCount)")
               
            }

    }
    
    @ViewBuilder
    func PickUpDesign(dataLocation:String)->some View
    {
        HStack
        {
            Image(systemName: "airtag.fill").padding()
            VStack(alignment: .leading)
            {
                Text("Byte-Gulberg")
                    .bold()
                    .multilineTextAlignment(.leading)
                    
                Text("\(dataLocation)").foregroundColor(.gray)
                  
            }
            
        }
    }
}

//struct PickupLocation_Previews: PreviewProvider {
//    static var previews: some View {
//        PickupLocation()
//    }
//}
