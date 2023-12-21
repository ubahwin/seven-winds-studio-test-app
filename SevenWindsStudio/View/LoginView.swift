import SwiftUI

struct LoginView: View {
    @StateObject private var loginVM = LoginViewModel()
    @State var email: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Почта")
                TextField("Логин", text: $email)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()
            VStack(alignment: .leading) {
                Text("Пароль")
                TextField("*******", text: $password)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()
            Button("Войти") {
                loginVM.login(login: email, password: password)
            }
            .buttonStyle(.borderedProminent)
            .padding()

        }
        .padding()
        .onTapGesture {
            loginVM.hideKeyboard()
        }
        .fullScreenCover(isPresented: $loginVM.isEntered) {
            ContentView()
        }
    }
}

#Preview {
    LoginView()
}
