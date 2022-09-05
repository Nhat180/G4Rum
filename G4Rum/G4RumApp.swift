//
//  G4RumApp.swift
//  G4Rum
//
//  Created by Maxx Trần on 05/09/2022.
//

import SwiftUI
import Firebase

@main
struct G4RumApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
