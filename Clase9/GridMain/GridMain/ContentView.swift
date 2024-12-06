
import SwiftUI

struct ContentView: View {
    var body: some View {
        Grid {
            GridRow {
                Color.red
                Color.green
                Color.blue
            }
            GridRow {
                Color.red
                    .frame(width: 50, height: 50)
                    .gridCellColumns(3)
                    .gridCellAnchor(.center)
            }
            GridRow {
                Color.blue
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Color.blue
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Color.blue
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
            Grid {
                GridRow {
                    Color.blue
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    Color.blue
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    Color.blue
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    Color.blue
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    Color.blue
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    Color.blue
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
            }
            Grid {
                GridRow {
                    ForEach(1..<7) { item in
                        Color.red
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                }
            }
        }
        .padding(.all)
    }
}
