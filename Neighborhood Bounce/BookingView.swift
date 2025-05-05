import SwiftUI

struct BookingView: View {
    @ObservedObject var bookingManager: BookingManager // Observe BookingManager
    
    // Information input by user
    @State private var userName = ""
    @State private var userPhone = ""
    @State private var userLocation = ""
    
    // Alert states
    @State private var showingAddAlert = false // For "Add to Reservation" alert
    @State private var showingConfirmAlert = false // For "Confirm Booking" alert
    @State private var alertMessage = "" // Message for the alert
    
    var body: some View {
        VStack {
            
            Text("Selected Bounce Houses")
                .font(.headline)
                .padding()
            
            // Display the selected bounce houses
            List {
                ForEach(bookingManager.selectedBounceHouses, id: \.id) { house in
                    HStack {
                        Text(house.name)
                        
                        Spacer()
                        
                        // Remove button
                        Button(action: {
                            bookingManager.selectedBounceHouses.removeAll { $0.id == house.id }
                            alertMessage = "\(house.name) removed from your reservation."
                            showingAddAlert = true // Show alert when a bounce house is removed
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            
            // Input fields for user details
            VStack {
                TextField("Your Name", text: $userName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Your Phone", text: $userPhone)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Your Location", text: $userLocation)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            // Button to confirm booking
            Button(action: {
                // Save the booking to Firebase
                bookingManager.saveBooking(userName: userName, userPhone: userPhone, userLocation: userLocation)
                
                // Optionally clear the selected bounce houses after booking is saved
                bookingManager.selectedBounceHouses.removeAll()
                
                // Set the alert message and show the confirm alert
                alertMessage = "Booking confirmed for \(userName)."
                showingConfirmAlert = true
                
                print("Booking confirmed for \(userName), \(userPhone), \(userLocation).")
            }) {
                Text("Confirm Booking")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding()

        }
        .navigationTitle("Your Bookings")
        .alert(isPresented: $showingAddAlert) {
            Alert(title: Text("Bounce House Removed"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
        .alert(isPresented: $showingConfirmAlert) {
            Alert(title: Text("Booking Confirmed"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
}
