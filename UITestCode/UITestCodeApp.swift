//
//  UITestCodeApp.swift
//  UITestCode
//
//  Created by Matthew Nos on 1/25/23.
//

import SwiftUI

@main
struct UITestCodeApp: App {
    @StateObject var myClass = MyClass()
    var body: some Scene {
        WindowGroup {
            ContentView().preferredColorScheme(.dark)
                .environmentObject(myClass)
        }
    }
}
