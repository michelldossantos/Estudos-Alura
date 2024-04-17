import SwiftUI

struct HomeView: View {
    let service = WebService()
    @State private var specialists: [Specialist] = []
    
    func getSpecialist() async {
        let result = try? await service.getAllSpecialists()
        
        switch result {
        case .success(let model):
            specialists = model
        case .failure(let error):
            print("Houve um erro: \(error)")
        case .none:
            print("result nil")
        }
    }
    
    func logout() async {
        do {
            let logouutSuccesful = try await service.logoutPatient()
            if logouutSuccesful {
                UserDefaultHelper.remove(key: UserDefaultKeys.token.rawValue)
                UserDefaultHelper.remove(key: UserDefaultKeys.patientID.rawValue)
            }
        } catch {
            print("error")
        }
    }
    
    var body: some View {
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
                ForEach(specialists) { specialist in
                    SpecialistCardView(specialist: specialist)
                        .padding(.bottom, 8)
                }
            }
            .padding(.horizontal)
        }
        .padding(.top)
        .onAppear {
            Task {
               await getSpecialist()
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    Task {
                        await logout()
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
}

#Preview {
    HomeView()
}
