//
//  ListCard.swift
//  khalo demo
//
//  Created by Furqan on 12/12/2022.
//

import SwiftUI

struct ListCard: View {
   var dataArray = MainViewModel.data
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing:-25)
            {
               
               
                ForEach((0..<dataArray.count),id:\.self)
                {  value in
                    
                    Custome_Card(image: dataArray[value].Image, name:  dataArray[value].resturantName, review:  dataArray[value].rating, time:  dataArray[value].totalTime)
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
