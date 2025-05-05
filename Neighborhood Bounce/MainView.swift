import SwiftUI

struct MainView: View {
    // Initialize BookingManager, which will handle bookings
    @ObservedObject var bookingManager = BookingManager()
    
    // Define the list of available bounce houses as a property of MainView
    var bounceHouses: [BounceHouse] = [
        // Creating the list of bounce houses with details
        BounceHouse(id: UUID(), name: "Castle Bounce", description: "A fun castle-shaped bounce house!", imageName: "castle"),
        BounceHouse(id: UUID(), name: "Water Slide Bounce", description: "A water slide with a bounce house!", imageName: "waterslide"),
        BounceHouse(id: UUID(), name: "Tropical Bounce", description: "A tropical theme bounce house.", imageName: "tropical")
    ]
    
    var body: some View {
        // TabView allows us to create different sections in the app
        TabView {
            // Home Tab
            HomeView()
                .tabItem {
                    // Label and icon for the "Home" tab
                    Label("Home", systemImage: "house")
                }
            
            // Bounce House Tab
            BounceHouseView(bookingManager: bookingManager, bounceHouses: bounceHouses) // Pass the bounce houses list to BounceHouseView
                .tabItem {
                    // Label and icon for the "Bounce Houses" tab
                    Label("Bounce Houses", systemImage: "star")
                }
            
            // Bookings Tab
            BookingView(bookingManager: bookingManager) // Pass the booking manager to the BookingView
                .tabItem {
                    // Label and icon for the "Bookings" tab
                    Label("Bookings", systemImage: "calendar")
                }

            // Contact Tab
            ContactView()
                .tabItem {
                    // Label and icon for the "Contact" tab
                    Label("Contact", systemImage: "phone")
                }
        }
    }
}

