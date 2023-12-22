import SwiftUI

struct OrderView: View {
    @ObservedObject var cafesVM: CafesViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach($cafesVM.order) { coffee in
                    if coffee.count.wrappedValue != 0 {
                        SelectedCoffeeCell(coffee: coffee)
                    }
                }
            }
            NavigationLink {
                Text("Время ожидания 15 минут!")
                Text("Спасибо, что выбрали нас!")
            } label: {
                Text("Оплатить")
            }
            .buttonStyle(.borderedProminent)
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Ваш заказ")
        }
    }
}

struct SelectedCoffeeCell: View {
    @Binding var coffee: Coffee

    var body: some View {
        VStack {
            HStack {
                Text(coffee.name)
                    .bold()
                Spacer()
                Text(coffee.amount.description)
            }
            .font(.title2)
            HStack {
                Text("Выбрано: \(coffee.count.description)")
                    .italic()
                Stepper("", value: $coffee.count, in: 0...10)
            }
        }
        .padding()
    }
}

#Preview {
    OrderView(cafesVM: CafesViewModel())
}

#Preview {
    SelectedCoffeeCell(coffee: Binding.constant(Coffee(id: 1, name: "Latte", amount: 120, count: 7)))
}
