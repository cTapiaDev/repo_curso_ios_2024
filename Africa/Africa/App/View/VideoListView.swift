

import SwiftUI

struct VideoListView: View {
    
    @State var videos : [Video] = Bundle.main.decode("videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    VideoListItemView(video: item)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        VideoListView()
    }
}
