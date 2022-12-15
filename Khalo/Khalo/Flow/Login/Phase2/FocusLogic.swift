//
//  FocusLogic.swift
//  Khalo
//
//  Created by Furqan on 14/12/2022.
//

import Foundation
extension OTPViewModel
{
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
