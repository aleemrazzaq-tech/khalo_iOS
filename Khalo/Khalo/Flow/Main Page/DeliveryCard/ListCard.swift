//
//  ListCard.swift
//  khalo demo
//
//  Created by Furqan on 12/12/2022.
//

import SwiftUI

struct ListCard: View {
    var array:[UIImage]
    var data:DeliveryModel?
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing:-25)
            {
               
               
                ForEach((0..<array.count),id:\.self)
                {  value in
                    NavigationLink(
                        destination:PickUPView(segment: data!.restaurants[value].segments))
                    {
                    Custome_Card(image: array[value], name: data?.restaurants[value].name ?? "nil", review:data?.restaurants[value].rating ?? 4.5, time:10)
                    }.foregroundColor(.black)
                }
               
            
                
            }
                 
               
        }
    }
}

struct ListCard_Previews: PreviewProvider {
    static var previews: some View {
        ListCard(array: [])
    }
}
