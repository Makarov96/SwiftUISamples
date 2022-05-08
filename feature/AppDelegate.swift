//
//  AppDelegate.swift
//  sample (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 6/05/22.
//

import SwiftUI

@main
struct sampleApp:App{
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene{
        WindowGroup{
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        @StateObject var screenProtector:ScreenProtector=ScreenProtector()
        screenProtector.startPreventingScreenshot()
        screenProtector.startPreventingRecording()

        return true
    }
}
