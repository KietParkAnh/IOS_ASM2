import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var showError = false
    @State private var usernames: [String] = [] // Maintain a list of usernames
    @State private var selectedLevel: String = "Easy"
    @EnvironmentObject var gameData: GameData // Injected GameData instance

    var body: some View {
        NavigationStack {
            VStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        VStack(spacing: 15) {
                            Spacer()
                            Text("Welcome!")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.bottom, 10)

                            TextField("Enter your name", text: $name)
                                .padding(10)
                                .cornerRadius(20)
                                .padding(.horizontal)
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(10)

                            NavigationLink(destination: MenuView(name: $name)) { // Pass the name to MenuView
                                Text("Sign In")
                                    .frame(height: 50)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .background(
                                        LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                                    )
                                    .cornerRadius(10)
                                    .padding()
                            }
                            .disabled(name.isEmpty)

                            if showError {
                                Text("Please enter your name")
                                    .foregroundColor(.red)
                                    .padding(.top, 5)
                            }

//                            List(usernames, id: \.self) { username in
//                                Text(username)
//                            }
                        }
                        .padding(.top, 50)
                    )
            }
        }
    }

    private func validateLogin() {
        showError = name.isEmpty
        if !name.isEmpty {
            usernames.append(name) // Add the entered name to the list
            name = "" // Clear the text field
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let gameData = GameData()
    
    static var previews: some View {
        ContentView()
            .environmentObject(GameData())
    }
}
