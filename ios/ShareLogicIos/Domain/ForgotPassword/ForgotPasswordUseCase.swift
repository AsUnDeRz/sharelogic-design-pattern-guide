//
//  ForgotPasswordUseCase.swift
//  Domain
//
//  Created by admin on 19/12/2561 BE.
//  Copyright © 2561 AsUnDeR. All rights reserved.
//

import Foundation

public protocol ForgotPasswordUseCase {
    
    func requestOTP()
    func validateOTP()
    func updatePassword()
    
}
