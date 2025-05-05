import SwiftUI

struct HomeView: View {
    var body: some View {
        // ZStack allows stacking views on top of each other
        ZStack {
            // Display the background image (NeighborhoodBounce)
            Image("NeighborhoodBounce")
                .resizable()
                .scaledToFit()
                .frame(height: UIScreen.main.bounds.height / 2)
                .edgesIgnoringSafeArea(.top)
            
            // VStack to arrange the title and other elements vertically
            VStack {
                
                Text("Welcome to Neighborhood Bounce!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 10, x: 5, y: 5) // Shadow for a cool effect
                    .padding(.top, 50)
                    .padding(.horizontal)
                
                Spacer() // Pushes the title to the top of the screen
            }
        }
        .navigationTitle("Home")
    }
}

