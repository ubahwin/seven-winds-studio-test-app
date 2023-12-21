import Foundation
import MapKit

struct Cafe: Identifiable, Equatable {
    var id: Int
    var name: String
//    var distanceKm: Int
//    var menu: [Coffee]
    var coordinate: CLLocationCoordinate2D

    static func == (lhs: Cafe, rhs: Cafe) -> Bool {
        return lhs.id == rhs.id
    }
}

extension CafeResponse {
    var mapToCafe: Cafe {
        let coordinate = CLLocationCoordinate2D(
            latitude: Double(self.point?.latitude ?? "") ?? 0,
            longitude: Double(self.point?.longitude ?? "") ?? 0
        )
        return Cafe(
            id: self.id ?? 0,
            name: self.name ?? "",
            coordinate: coordinate
        )
    }
}
