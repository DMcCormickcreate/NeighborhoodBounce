import Foundation
import SwiftData

// The @Model annotation indicates this is a model class for SwiftData
@Model
final class Item {
    var timestamp: Date // Stores the timestamp for the item
    
    // Initialize the Item with a timestamp
    init(timestamp: Date) {
        self.timestamp = timestamp // Set the timestamp when the item is created
    }
}
