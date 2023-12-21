import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var cafesVM: CafesViewModel
    @State private var selection: UUID?

    var body: some View {
        Map(selection: $selection) {
            ForEach(cafesVM.cafes) { cafe in
                Annotation(cafe.name, coordinate: cafe.coordinate) {
                    Image(systemName: "cup.and.saucer")
                }
            }
        }
    }
}

#Preview {
    MapView(cafesVM: CafesViewModel())
}
