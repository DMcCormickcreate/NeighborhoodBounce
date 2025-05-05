import SwiftUI

struct BounceHouseView: View {
    @ObservedObject var bookingManager: BookingManager // Keeps track of what the user adds to their booking
    let bounceHouses: [BounceHouse] // List of all the bounce houses to display
    
    var body: some View {
        // NavigationView allows us to move to other screens
        NavigationView {
            // List all the bounce houses
            List(bounceHouses, id: \.id) { house in
                // Each bounce house can be tapped to go to its detail screen
                NavigationLink(destination: BounceHouseDetailView(bounceHouse: house, bookingManager: bookingManager)) {
                    VStack(alignment: .leading) {
                        // Show the name of the bounce house
                        Text(house.name)
                            .font(.headline)
                        
                        // Show a short description 
                        Text(house.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Available Bounce Houses") 
        }
    }
}
