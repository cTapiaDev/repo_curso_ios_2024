

import SwiftUI

struct AddPurchaseView: View {
    
    @Environment(\.managedObjectContext) private var context
    @Environment(\.dismiss) var dismiss
    
    @StateObject var purchase = PurchasesViewModel()
    
    var card: Cards
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $purchase.name)
                TextField("Price", text: $purchase.price)
                    .keyboardType(.decimalPad)
                Button {
                    purchase.savePurchase(context: context, card: card) { done in
                        if done {
                            dismiss()
                        }
                    }
                } label: {
                    Text("Save purchase")
                }
            }
            .navigationTitle("Add purchase")
        }
    }
}

