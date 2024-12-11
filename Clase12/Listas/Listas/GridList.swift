

import SwiftUI
import Combine

struct GridList: View {
    
    @ObservedObject var grid = ModeloColumnas()
    
//    let gridItem: [GridItem] = Array(repeating: .init(.flexible(maximum: 80)), count: 3)
    
    var body: some View {
        NavigationView {
            ScrollView() {
                LazyVGrid(columns: grid.gridItem, spacing: 30) {
                    ForEach(lista) { item in
                        Text(item.emoji)
                            .font(.system(size: 80))
                    }
                }
            }
            .navigationTitle("Grids")
            .toolbar {
                ToolbarItem {
                    Menu("Opciones") {
                        Section {
                            Button("1 columna") {
                                grid.columnas(num: 1)
                            }
                            Button("2 columnas") {
                                grid.columnas(num: 2)
                            }
                            Button("3 columnas") {
                                grid.columnas(num: 3)
                            }
                            Button("4 columnas") {
                                grid.columnas(num: 4)
                            }
                            Button("Ultima opcion") {
                                UserDefaults.standard.removeObject(forKey: "numero")
                            }
                        }
                    }
                }
            }
        }
    }
}
