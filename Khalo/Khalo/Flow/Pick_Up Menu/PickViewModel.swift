//
//  PickViewModel.swift
//  Khalo
//
//  Created by Furqan on 21/12/2022.
//

import Foundation
class PickUpViewModel:ObservableObject
{
    @Published var cartItem:[Cart] = []
    
    func addToCart(item:Dish)
    {
        let obj = Cart(item: item, quantity: 1)
        self.cartItem.append(obj)
    }
}
