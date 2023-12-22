import SwiftUI

struct LoginView: View {
    @StateObject private var loginVM = LoginViewModel()
    @State var email: String = ""
    @State var password: String = ""
    @State var openRegistration = false

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Логин")
                TextField("Логин", text: $email)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()
            VStack(alignment: .leading) {
                Text("Пароль")
                SecureField("*******", text: $password)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()

            Button("Регистрация") {
                openRegistration = true
            }

            Button("Войти") {
                loginVM.login(login: email, password: password)
            }
            .buttonStyle(.borderedProminent)
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Вход")
        }
        .padding()
        .onTapGesture {
            loginVM.hideKeyboard()
        }
        .fullScreenCover(isPresented: $openRegistration) {
            RegistrationView(loginVM: loginVM)
        }
    }
}

#Preview {
    LoginView()
}
