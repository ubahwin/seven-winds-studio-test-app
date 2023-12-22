import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var cafesVM: CafesViewModel

    var body: some View {
        Map {
            ForEach(cafesVM.cafes) { cafe in
                Annotation(cafe.name, coordinate: cafe.coordinate) {
                    NavigationLink {
                        CafeDetailView(id: cafe.id, cafesVM: cafesVM)
                    } label: {
                        Image("coffee")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .scaledToFit()
                    }
                }
            }
        }
    }
}

#Preview {
    MapView(cafesVM: CafesViewModel())
}
