

import SwiftUI
import SwiftData

struct ComprasView: View {
    
    @Bindable var itemList: ListModel
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text(itemList.titulo)
    }
}

