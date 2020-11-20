//
//  FaceIDAuth.swift
//  Mapiever
//
//  Created by Mete Alp Kizilcay on 15.11.2020.
//

import LocalAuthentication
import SwiftUI

struct FaceIDAuth: View {
    @State private var isUnlocked = false
    var body: some View {
        VStack {        
            if self.isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate(){
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticate in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        //there is a problom
                    }
                }
            }
        } else {
            //no biometrics
        }
    }
}

struct FaceIDAuth_Previews: PreviewProvider {
    static var previews: some View {
        FaceIDAuth()
    }
}
