

import SwiftUI

struct DetalleView: View {
    
    var id: Int
    @StateObject var user = DetalleViewModel()
    
    var body: some View {
        
        VStack {
            if user.avatar.isEmpty {
                ProgressView()
            } else {
                Image(systemName: "persona.fill")
                    .data(url: URL(string: user.avatar)!)
                    .frame(width: 130, height: 130)
                    .clipped()
                    .clipShape(Circle())
                Text(user.first_name)
                    .font(.largeTitle)
                Text(user.email)
                    .font(.title)
            }
        }
        .onAppear {
            user.fetch(id: id)
        }
    }
}
