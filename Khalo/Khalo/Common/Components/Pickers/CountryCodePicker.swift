//
//  CountryCodePicker.swift
//  khalo demo
//
//  Created by Furqan on 06/12/2022.
//

import SwiftUI

func countryFlag(_ countryCode: String) -> String {
  String(String.UnicodeScalarView(countryCode.unicodeScalars.compactMap {
    UnicodeScalar(127397 + $0.value)
  }))
}

struct CountryCodePicker: View {
    @Binding var showState:Bool
    @Binding var phoneNum:String
    var countryDictionary = PhoneViewModel().countryDictionary
    var body: some View {
        List(self.countryDictionary.sorted(by: <), id:\.key)
        {
            key , value in
            HStack
            {
            Text("\(Locale.current.localizedString(forRegionCode: key) ?? " " )")
            Text(countryFlag(key))
              Spacer()
            Text("+\(value)")
            }
            .padding()
            .background(Color.white)
            .onTapGesture()
            {
                showState.toggle()
                self.phoneNum = "+\(value)"
                
            }

        }
       
    }
}

struct CountryCodePicker_Previews: PreviewProvider {
    @State static var check = true
    @State static var check1 = ""
    static var previews: some View {
        
        CountryCodePicker(showState: .constant(check), phoneNum:.constant(check1))
    }
}


