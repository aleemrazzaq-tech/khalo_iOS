//
//  OtpScreen.swift
//  khalo demo
//
//  Created by Furqan on 06/12/2022.
//

import SwiftUI

struct OtpScreen: View {
    @StateObject var otpModel:OTPViewModel = .init()
    @FocusState  var activeField:OtpField?
    var linearColor = [Color.red , Color(red: 80/255, green: 1/255, blue: 1/255)]
    init()
    {
        for itr in UIFont.familyNames
        {
            print(itr)
            for j in UIFont.fontNames(forFamilyName: itr)
            {
                print("-- \(j)")
            }
        }
    }
    var body: some View {
        let color = Color(red: 64/255, green: 64/255, blue: 64/255)
        
        VStack
        {
            Text("Verify OTP")
                .font(.largeTitle)
                .foregroundColor(color)
                .padding()
            Text("OTP has been to +92********")
                .font(.headline)
                .foregroundColor(.black)
             
            OtpField()
            
            Button(action:{})
            {
                Text("Verify")
                    .font(.title)
                    
                    
                
            }.buttonStyle(CustomButton(color: LinearGradient(colors:linearColor , startPoint:.leading, endPoint: .trailing)))
                .padding()
            
            Text("Resend OTP (54)")
                .fontWeight(.light)
        }
        .onChange(of: otpModel.otpField)
        {
            newValue in
            otpModel.OTPCondition(value: newValue , field:activeField ?? .field1)
            activeField = otpModel.focustext
        }
        .onAppear()
        {
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5)
            {
                activeField = .field1
            }
        }
    }
    
    //Mark moving text field cursor
    
    //Mark ViewBuilder
    @ViewBuilder
    func OtpField()->some View
    {
        HStack(spacing:14)
        {
            ForEach((0...5) , id:\.self)
            {
                index in
                VStack()
                {
                    TextField("" , text: $otpModel.otpField[index])
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .multilineTextAlignment(.center)
                        .focused($activeField , equals: Khalo.OtpField.allCases[index])
                    
                    Rectangle()
                        .fill(activeField == Khalo.OtpField.allCases[index] ? .blue : .gray)
                        .frame(height: 2)
                    
                    
                        
                }
            }.frame(width: 40)
        }
    }

}

struct OtpScreen_Previews: PreviewProvider {
    static var previews: some View {
        OtpScreen()
    }
}



