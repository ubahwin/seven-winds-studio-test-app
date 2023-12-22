import SwiftUI

struct RegistrationView: View {
    @ObservedObject var loginVM: LoginViewModel
    @Environment(\.dismiss) var dismiss
    @State var email: String = ""
    @State var password1: String = ""
    @State var password2: String = ""

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
                SecureField("*******", text: $password1)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()
            VStack(alignment: .leading) {
                Text("Ещё раз")
                SecureField("*******", text: $password2)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()

            Button("Есть аккаунт?", action: { dismiss() })

            Button("Регистрация") {
                loginVM.register(login: email, password: password1)
            }
            .disabled(password1 != password2)
            .buttonStyle(.borderedProminent)
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Регистрация")
        }
        .padding()
        .onTapGesture {
            loginVM.hideKeyboard()
        }
    }
}

#Preview {
    RegistrationView(loginVM: LoginViewModel())
}
