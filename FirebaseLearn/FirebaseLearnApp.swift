//
//  FirebaseLearnApp.swift
//  FirebaseLearn
//
//  Created by Руслан Ишмухаметов on 10.03.2023.
//

import SwiftUI
import Firebase

@main
struct FirebaseLearnApp: App {
    
    @StateObject var dataManager = DataManager()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(dataManager)
        }
    }
}
