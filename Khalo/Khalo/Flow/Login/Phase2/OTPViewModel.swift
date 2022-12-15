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
 
}


