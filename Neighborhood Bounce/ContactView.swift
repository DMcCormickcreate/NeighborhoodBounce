import SwiftUI
//All contact information of mine 
struct ContactView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Contact Us for More Info!")
                .font(.title)
                .padding(.top)
            
            Divider()
            
            
            HStack {
                Image(systemName: "phone.fill")
                    .foregroundColor(.blue)
                Link("Call Us: (501) 388-0044", destination: URL(string: "tel:1234567890")!)
            }
            .font(.headline)

            
            HStack {
                Image(systemName: "envelope.fill")
                    .foregroundColor(.blue)
                Link("Email Us: neighborhoodbounce@gmail.com", destination: URL(string: "mailto:neighborhoodbounce@gmail.com")!)
            }
            .font(.headline)

            Spacer()
        }
        .padding()
        .navigationTitle("Contact")
    }
}

