import SwiftUI

struct CafeListView: View {
    @ObservedObject var cafesVM: CafesViewModel
    @AppStorage("token") var token: String?

    var body: some View {
        List(cafesVM.cafes) { cafe in
            NavigationLink {
                EmptyView()
            } label: {
                VStack {
                    Text(cafe.name)
                        .foregroundStyle(.black)
                    Text("2 km")
                }
            }
        }
        .refreshable {
            cafesVM.loadCafes()
        }
    }
}

#Preview {
    CafeListView(cafesVM: CafesViewModel())
}
