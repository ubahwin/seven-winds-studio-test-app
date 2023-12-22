import Foundation
import SwiftUI

struct CafeDetailView: View {
    var id: Int
    @ObservedObject var cafesVM: CafesViewModel

    var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 300, maximum: 400)),
        GridItem(.adaptive(minimum: 300, maximum: 400))
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(
                    columns: columns,
                    alignment: .center,
                    pinnedViews: [.sectionHeaders, .sectionFooters]
                ) {
                    ForEach($cafesVM.order) { coffee in
                        CoffeeCellView(coffee: coffee)
                    }
                }
                .navigationTitle("Меню")
            }
            NavigationLink {
                OrderView(cafesVM: cafesVM)
            } label: {
                Text("Перейти к оплате")
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .onAppear {
            cafesVM.loadCafe(id: id)
        }
        .refreshable {
            cafesVM.loadCafe(id: id)
        }
    }
}

#Preview {
    CafeDetailView(id: 1, cafesVM: CafesViewModel())
}
