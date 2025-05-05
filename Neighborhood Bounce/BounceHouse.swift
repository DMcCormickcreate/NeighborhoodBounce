import Foundation

// This struct defines what a bounce house is and what information it has
struct BounceHouse: Identifiable, Equatable {
    var id = UUID() // A unique ID for each bounce house (used to tell them apart)
    var name: String // The name of the bounce house (like "Castle Bounce")
    var description: String // A short description of the bounce house
    var imageName: String // The name of the image file used to show the bounce house in the app
}
