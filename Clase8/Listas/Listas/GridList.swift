

import SwiftUI

struct GridList: View {
    
//    let gridItem = [
////        GridItem(.adaptive(minimum: 80))
////        GridItem(.flexible()),
////        GridItem(.flexible()),
////        GridItem(.flexible()),
//        GridItem
//    ]
    
    
    let gridItem: [GridItem] = Array(repeating: .init(.flexible(maximum: 80)), count: 3)
    
    var body: some View {
        NavigationView {
            ScrollView(.horizontal) {
                LazyHGrid(rows: gridItem, spacing: 30) {
                    ForEach(lista) { item in
                        Text(item.emoji).font(.system(size: 80))
                    }
                }
            }
            .navigationTitle("Grids")
        }
    }
}
