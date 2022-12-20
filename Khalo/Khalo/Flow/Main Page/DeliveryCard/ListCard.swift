//
//  ListCard.swift
//  khalo demo
//
//  Created by Furqan on 12/12/2022.
//

import SwiftUI

struct ListCard: View {
    var array:[UIImage]
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing:-25)
            {
               
               
                ForEach((0..<array.count),id:\.self)
                {  value in
                    
                    Custome_Card(image: array[value], name:  "hello", review:10.0, time:10)
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
