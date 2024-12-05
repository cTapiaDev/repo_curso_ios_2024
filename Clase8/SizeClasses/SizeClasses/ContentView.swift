

import SwiftUI

struct ContentView: View {
    
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        if sizeClass == .compact {
            compactDesign()
        } else {
            regularDesign()
        }
    }
}

#Preview {
    ContentView()
}

struct regularDesign: View {

    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            VStack() {
                Image("deadpool")
                    .resizable()
                    .frame(width: 130, height: 180, alignment: .center)
                    .clipShape(Circle())
                Text("Señor Pool")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                Text("Calle #123123")
                    .foregroundColor(.white)
                    .font(.title)
                    .italic()
            }
        }
    }
}

struct compactDesign: View {
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            HStack() {
                Image("deadpool")
                    .resizable()
                    .frame(width: 130, height: 180, alignment: .center)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 10) {
                    Text("Señor Pool")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                    Text("Calle #123123")
                        .foregroundColor(.white)
                        .font(.title)
                        .italic()
                }
            }
        }
    }
}










