import SwiftUI
import Firebase

// This class keeps track of bounce houses the user wants to reserve
// and handles saving the booking to Firebase
class BookingManager: ObservableObject {
    
    // This is the list of bounce houses the user has selected
    @Published var selectedBounceHouses: [BounceHouse] = []

    init() {
       
    }

    // This function adds a bounce house to the user's list of selected ones
    func addToBookingList(bounceHouse: BounceHouse) {
        selectedBounceHouses.append(bounceHouse)
    }
    
    
    func removeFromBookingList(bounceHouse: BounceHouse) {
        if let index = selectedBounceHouses.firstIndex(where: { $0.id == bounceHouse.id }) {
            selectedBounceHouses.remove(at: index) // Remove the bounce house from the list
        }
    }

    // This function saves the user's booking info to Firestore (Firebase database)
    func saveBooking(userName: String, userPhone: String, userLocation: String) {
        
        let db = Firestore.firestore()
        
        
        db.collection("bookings").addDocument(data: [
            "userName": userName,
            "userPhone": userPhone,
            "userLocation": userLocation,
            
            
            "selectedBounceHouses": selectedBounceHouses.map { $0.name }
        ]) { error in
            // If something goes wrong, print the error
            if let error = error {
                print("Error saving booking: \(error)")
            } else {
                // If everything goes right, print success message
                print("Booking successfully saved!")
            }
            
        }
    }
}
