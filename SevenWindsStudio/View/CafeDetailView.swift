import Foundation
import SwiftUI

struct CafeDetailView: View {
    var id: Int
    @ObservedObject var cafesVM: CafesViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem()]) {
                    ForEach(cafesVM.order) { coffee in
                        VStack {
                            AsyncImage(url: coffee.image) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                Image(systemName: "cup.and.saucer")
                                    .resizable()
                                    .scaledToFit()
                            }
                            Text(coffee.name)
                            Text("\(coffee.amount.description) ₽")
                                .bold()
                        }
                    }
                    .navigationTitle("Меню")
                }
            }
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
