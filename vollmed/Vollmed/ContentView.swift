import SwiftUI

struct ContentView: View {
//    @AppStorage("token") var token: String = ""
    @ObservedObject var authManager = AuthenticatorManager.shared
    var body: some View {
        if authManager.token == nil {
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
