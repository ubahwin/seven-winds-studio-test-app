import SwiftUI

struct CoffeeCellView: View {
    var name: String
    var amount: Int
    var image: URL?

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(minWidth: 100, maxWidth: 300, minHeight: 140, maxHeight: 300)
        }
    }
}

#Preview {
    CoffeeCellView(
        name: "latte",
        amount: 124,
        image: URL(string: "https://upload.wikimedia.org/wikipedia/commons/1/16/Classic_Cappuccino.jpg")
    )
}
