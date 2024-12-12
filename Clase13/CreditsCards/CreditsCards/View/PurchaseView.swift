

import SwiftUI

struct PurchaseView: View {
    
    @Environment(\.managedObjectContext) private var context
    
    var card: Cards
    
    @State private var addPurchase = false
    
    @State private var total: Int16 = 0
    @State private var resto: Int16 = 0
    
    @StateObject var purchase = PurchasesViewModel()
    
    var purchases: FetchRequest<Purchases>
    init(card: Cards) {
        self.card = card
        purchases = FetchRequest<Purchases>(entity: Purchases.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)], predicate: NSPredicate(format: "idCard == %@", card.id! as CVarArg))
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(purchases.wrappedValue) { item in
                    Grid(alignment: .leading) {
                        GridRow {
                            Text(item.name ?? "")
                            Spacer()
                            Text("$\(item.price)")
                                .foregroundColor(.gray)
                        }
                        Text((item.date?.formatted(.dateTime.day().year()))!)
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                }
                .onDelete { IndexSet in
                    let delete = purchases.wrappedValue[IndexSet.first!]
                    purchase.deletePurchase(item: delete, context: context)
                    
                    total = purchases.wrappedValue.reduce(0, {$0 + $1.price})
                    resto = card.credit - total
                }
            }
            Grid {
                GridRow {
                    Text("Credit: $\(card.credit)")
                        .foregroundColor(.gray)
                        .font(.caption)
                        .bold()
                    Text("Total: $\(total)")
                        .foregroundColor(.gray)
                        .font(.caption)
                        .bold()
                    Text("Rest: $\(resto)")
                        .foregroundColor(.gray)
                        .font(.caption)
                        .bold()
                }
            }
        }
        .navigationTitle(card.name ?? "")
        .toolbar {
            NavigationLink(destination: AddPurchaseView(card: card)) {
                Image(systemName: "plus.app")
            }
            .onAppear {
                total = purchases.wrappedValue.reduce(0, {$0 + $1.price})
                resto = card.credit - total
            }
            
            
            
//            Button {
//                addPurchase.toggle()
//            } label: {
//                Image(systemName: "plus.app")
//            }
//            NavigationLink(destination: AddPurchaseView(card: card)) {
//                Image(systemName: "plus.app")
//            }
//            
//            
//            
//            .navigationDestination(isPresented: $addPurchase) {
//                AddPurchaseView(card: card)
//            }
        }
    }
}

