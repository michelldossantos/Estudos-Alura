import SwiftUI

struct ContentView: View {
    @AppStorage("token") var token: String = ""
    
    var body: some View {
        if token.isEmpty {
            NavigationStack {
                SignInView()
            }
        } else {
            TabView {
                NavigationStack {
                    HomeView()
                }
                .tabItem {
                    Label(
                        title: { Text("Home") },
                        icon: { Image(systemName: "house") }
                    )
                }
                
                NavigationStack {
                    MyAppointmentsView()
                }.tabItem {
                    Label(
                        title: { Text("Consultas") },
                        icon: { Image(systemName: "calendar") }
                    )
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
