//
//  SUILoginFirebaseApp.swift
//  SUILoginFirebase
//
//  Created by Artemio on 23/09/21.
//

import SwiftUI
import Firebase

@main
struct SUILoginFirebaseApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView(cardListViewModel: CardListViewModel())
        }
    }
}
