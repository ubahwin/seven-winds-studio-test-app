import SwiftUI

struct CafeListView: View {
    @ObservedObject var cafesVM: CafesViewModel

    var body: some View {
        List(cafesVM.cafes) { cafe in
            NavigationLink {
                CafeDetailView(id: cafe.id, cafesVM: cafesVM)
            } label: {
                Text(cafe.name)
                    .foregroundStyle(.black)
                    .padding()
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
