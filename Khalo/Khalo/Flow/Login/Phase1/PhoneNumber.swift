//
//  PhoneNumber.swift
//  khalo demo
//
//  Created by Furqan on 06/12/2022.
//

import SwiftUI


struct PhoneNumber: View {
    @State var countryCode:String
    @State var phoneNumber:String
    @State var showSheet = false
    @FocusState private var isUsernameFocused: Bool
    var linearColor = [Color.red , Color(red: 80/255, green: 1/255, blue: 1/255)]
    var body: some View
    {
        
        NavigationView {
            VStack
            {
                Text("Let's get started")
                    .font(.custom("aaa", size: 43))
                    .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                    
                
                HStack
                {
                    CustomeTextField(placeHolder: "+92", lineColor:Color("CustomColor"), width: 2, value: $countryCode)
                        .frame(width:100)
                        .padding(.horizontal ,5)
                        .onTapGesture()
                        {
                            showSheet.toggle()
                        }.sheet(isPresented: $showSheet)
                        {
                           
                            CountryCodePicker(showState: $showSheet , phoneNum: $countryCode )
                        }
                    CustomeTextField(placeHolder: "3XXXXXXX", lineColor:Color("CustomColor"), width: 2 , value: $phoneNumber)
                        .focused($isUsernameFocused)
                       
         
                }.padding()
                
                NavigationLink(destination: OtpScreen())
                {
                    Text("Next")
                        .font(.title)
                        .bold()
                      
                }.buttonStyle(CustomButton(color: LinearGradient(colors:linearColor , startPoint:.leading, endPoint: .trailing)))
                    .padding()
               
                
        }
        }
       
        .onAppear()
        {
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5)
            {
                isUsernameFocused.toggle()
            }
           
        }
    }
}

struct PhoneNumber_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumber(countryCode:"" , phoneNumber:"")
    }
}
