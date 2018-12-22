//
//  RegisterationUseCase.swift
//  Domain
//
//  Created by admin on 19/12/2561 BE.
//  Copyright © 2561 AsUnDeR. All rights reserved.
//

import Foundation


class RegisterProvider: RegisterUseCase {
    
    let repository : RegisterRepository
    
    init(repository:RegisterRepository) {
        self.repository = RegisterRepository()
    }
    
    
    func registerWithMobile() {
        
    }
    
    func requestOTP() {
        
    }
    
    func validateOTP() {
        
    }
    
    func createPassword() {
        
    }
    
    func validatePassword() {
        
    }
    
    func updateInfo() {
        
    }
    
    
    
    
}
