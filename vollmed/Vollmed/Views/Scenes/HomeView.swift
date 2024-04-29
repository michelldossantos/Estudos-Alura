import SwiftUI

struct HomeView: View {
    var viewModel = HomeViewModel(service: HomeNetworkingService(), authService: AuthenticationService())
    
    @State private var specialists: [Specialist] = []
    @State private var isShowingSnackBar = false
    @State private var isFatchData = true
    @State private var errorMessage = ""
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    Image(.logo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .padding(.vertical, 32)
                    Text("Boas-vindas!")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color(.lightBlue))
                    Text("Veja abaixo os especialistas da Vollmed disponíveis e marque já a sua consulta!")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.accentColor)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 16)
                    if isFatchData {
                        SkeletonView()
                    } else {
                        ForEach(specialists) { specialist in
                            SpecialistCardView(specialist: specialist)
                                .padding(.bottom, 8)
                        }
                    }

                }
                .padding(.horizontal)
            }
            .padding(.top)
            .onAppear {
                Task {
                    do {
                        guard let response = try await viewModel.getSpecialist() else { return }
                        self.specialists = response
                    } catch {
                        isShowingSnackBar = true
                        if let error = error as? APIError {
                            errorMessage = error.customMessage
                        }
                    }
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task {
                            await viewModel.logout()
                        }
                    } label: {
                        HStack(spacing: 2) {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                            Text("Logout")
                        }
                    }
                }
        }
        }
        if isShowingSnackBar {
            SnackBarErrorView(isShowing: $isShowingSnackBar, message: errorMessage)
        }
    }
}

#Preview {
    HomeView()
}
