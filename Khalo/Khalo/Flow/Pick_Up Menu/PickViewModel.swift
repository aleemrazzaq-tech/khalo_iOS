//
//  PickViewModel.swift
//  Khalo
//
//  Created by Furqan on 21/12/2022.
//

import Foundation
class PickUpViewModel:ObservableObject
{
    @Published private(set) var cartItem:[Cart] = []
    @Published var allPrice = 0.0
    static var totalPrice = 0.0
    
    func addToCart(name:String, totalItem:Int , price:Double , calculatedValue:Double)
    {
        if let row = self.cartItem.firstIndex(where: {$0.name == name}) {
            cartItem[row].totalItem += totalItem
        }
        else{
            let obj = Cart(name: name, totalItem: totalItem, price: price)
            self.cartItem.append(obj)
        }
        
        calculatTotalPrice(value:calculatedValue)
    }
    func calculatTotalPrice(value:Double)
    {
        PickUpViewModel.totalPrice = PickUpViewModel.totalPrice + value
        self.allPrice =  PickUpViewModel.totalPrice
    }
}
