//
//  CartView.swift
//  Khalo
//
//  Created by Furqan on 20/12/2022.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        ScrollView
        {
            ForEach((0...4) , id:\.self)
            {
                itr in
                ItemView()
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
