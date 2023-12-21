import SwiftUI

struct ContentView: View {
    @StateObject private var cafesVM = CafesViewModel()

    @State var selectedTab: Tab = .map
    enum Tab: Hashable {
        case map, cafeList
    }

    var body: some View {
        NavigationStack {
            TabView {
                Group {
                    MapView(cafesVM: cafesVM)
                        .tabItem {
                            Image(systemName: "map")
                            Text("Карта")
                        }
                        .tag(Tab.map)
                    CafeListView(cafesVM: cafesVM)
                        .tabItem {
                            Image(systemName: "list.bullet.clipboard")
                            Text("Кафе")
                        }
                        .tag(Tab.cafeList)
                }
                .toolbarBackground(.visible, for: .tabBar)
            }
            .navigationTitle("Кафе")
            .toolbar {
                ToolbarItemGroup(placement: .secondaryAction) {
                    Button("Обновить") {
                        cafesVM.loadCafes()
                    }
                    Button("Выйти", role: .destructive) {
                        cafesVM.isEntered = false
                    }
                }
            }
        }
        .onAppear {
            cafesVM.loadCafes()
        }
    }
}

#Preview {
    ContentView()
}
