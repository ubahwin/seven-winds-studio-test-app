import SwiftUI

struct ContentView: View {
    @AppStorage("isEntered") var isEntered: Bool?
    @AppStorage("token") var token: String?

    var body: some View {
        VStack {
            Text("К сожалению ваш API сам не знает, куда вставлять токен")
            Image("screenshot")
            if let token = token {
                Text("Кстати вот он: \(token)")
            }
            Button("Выход") {
                isEntered = false
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
