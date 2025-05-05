import SwiftUI

struct BounceHouseDetailView: View {
    var bounceHouse: BounceHouse
    @ObservedObject var bookingManager: BookingManager // Observe BookingManager
    @State private var showAlert = false // State for showing the alert
    
    var body: some View {
        VStack {
            Text(bounceHouse.name)
                .font(.title)
                .padding()
            
            Text(bounceHouse.description)
                .padding()
            
            // Add to booking button
            Button(action: {
                bookingManager.addToBookingList(bounceHouse: bounceHouse) // Add the bounce house to the reservation
                showAlert = true // Show alert after adding bounce house
            }) {
                Text("Add to Reservation")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            .alert(isPresented: $showAlert) { // Alert when bounce house is added
                Alert(
                    title: Text("Added to Reservation"),
                    message: Text("\(bounceHouse.name) has been added to your reservation!"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .navigationTitle("Bounce House Details")
    }
}
