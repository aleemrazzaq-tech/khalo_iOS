//
//  CartView.swift
//  Khalo
//
//  Created by Furqan on 20/12/2022.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var item:PickUpViewModel
    
    var body: some View {
        ScrollView
        {
            
            ForEach((0..<item.cartItem.count) , id:\.self)
            {
                itr in
                ItemView(name:item.cartItem[itr].item.name, quantity:  item.cartItem[itr].quantity)
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(item:PickUpViewModel())
    }
}
