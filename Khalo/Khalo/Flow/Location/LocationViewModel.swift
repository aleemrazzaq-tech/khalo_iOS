//
//  LocationViewModel.swift
//  Khalo
//
//  Created by Furqan on 30/12/2022.
//

import Foundation
class LocationViewModel:ObservableObject
{
    @Published var arrayValue:[String] = []
    @Published var arrayCount:Int = 0
    
    func addLocation(value:String)
    {
       
            arrayValue.append(value)
            print("Data is in model \(value)")
            arrayCount = arrayValue.count
        
       
    }
}
