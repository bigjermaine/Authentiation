//
//  Authetication.swift
//  Authentiation
//
//  Created by Apple on 29/03/2023.
//


import Foundation
import LocalAuthentication

class AuthenticationManager{

    
    var biometryType: LABiometryType = .none
    private(set) var context = LAContext()
    private(set) var canEvaluatePolicy = false
    private(set) var isAuthenticated = false
    private(set) var errorDescription: String?
     var showAlert = false
    
    init() {
        getBiometryType()
    }
    func getBiometryType() {
        canEvaluatePolicy = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        biometryType = context.biometryType
    }
    
    func authenticateWithBiometrics() async {
        context = LAContext()

        if canEvaluatePolicy {
            let reason = "Log into your account"

            do {
                let success = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
                if success {
                    DispatchQueue.main.async {
                        self.isAuthenticated = true
                        
                    }
                }
            } catch {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.errorDescription = error.localizedDescription
                    self.showAlert = true
                                    self.biometryType = .none
                }
            }
        }
    }
}

