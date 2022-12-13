//
//  OTPViewModel.swift
//  khalo demo
//
//  Created by Furqan on 06/12/2022.
//

import Foundation
//Mark focus field
enum OtpField:CaseIterable
{
    case field1
    case field2
    case field3
    case field4
    case field5
    case field6
}


class OTPViewModel:ObservableObject
{
    @Published var otpField:[String] = Array(repeating: "", count: 6)
    @Published var focustext:OtpField?
    func OTPCondition(value:[String] , field:OtpField)
    {
        print(field)
        // Moving next
        for index in 0..<5
        {
            print(index)
            if value[index].count == 1 && value[index+1] == "" &&  Khalo.OtpField.allCases[index] == field
            {
                
                focustext = Khalo.OtpField.allCases[index+1]
                break
               
                
            }
        }
        for index in 0...5
        {
            if value[index].count>1
            {
                otpField[index] = String(value[index].last!)
            }
        }
        //Moving back
        for index in 1...5
        {
            if value[index].isEmpty && !value[index-1].isEmpty && Khalo.OtpField.allCases[index] == field
            {
                focustext = Khalo.OtpField.allCases[index-1]
                
            }
        }
      
        
    
    }
    
    
}
