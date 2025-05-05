import SwiftUI
import Firebase

@main
struct BounceHouseAPP: App {
    init() {
        // This makes sure Firebase is only set up once when the app starts
        if FirebaseApp.app() == nil {
            FirebaseApp.configure() // Sets up Firebase
        }
    }

    var body: some Scene {
        WindowGroup {
            MainView() // This is the first screen that loads when the app opens
        }
    }
}
