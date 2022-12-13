//
//  ListCard.swift
//  khalo demo
//
//  Created by Furqan on 12/12/2022.
//

import SwiftUI

struct ListCard: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing:-25)
            {
                ForEach((0...3),id:\.self)
                {_ in
                    Custome_Card()
                }
               
            
                
            }
                 
               
        }
    }
}

struct ListCard_Previews: PreviewProvider {
    static var previews: some View {
        ListCard()
    }
}
