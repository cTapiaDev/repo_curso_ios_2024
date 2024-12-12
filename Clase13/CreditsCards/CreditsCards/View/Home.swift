

import SwiftUI
import CoreData

struct Home: View {
    
//    @State private var show = false
    
    @StateObject var card = CardsViewModel()
    
    @FetchRequest(entity: Cards.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)], animation: .spring()) var results: FetchedResults<Cards>
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(results) { item in
                        NavigationLink(destination: PurchaseView(card: item)) {
                            CardView(name: item.name, number: item.number, type: item.type)
                        }
                        .contextMenu {
                            Button {
                                card.senditem(item: item)
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                            Button {
                                print("Copy")
                            } label: {
                                Label("Copy", systemImage: "doc.on.doc")
                            }
                            Button(role: .destructive) {
                                print("Delete")
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
            .toolbar {
                Button {
                    card.addCardView.toggle()
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.orange)
                }
            }
            .sheet(isPresented: $card.addCardView){
                AddCardView(cards: card)
            }
            .navigationTitle("Credit Cards")
        }
    }
}


struct CardView: View {
    var name: String?
    var number: String?
    var type: String?
    
    @State private var color1: Color = .red
    @State private var color2: Color = .orange
    
    @State private var creditNumber = ""
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Spacer()
                Text(type ?? "")
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .bold()
            }
            Spacer()
            Text(creditNumber)
                .foregroundColor(.white)
                .font(.title2)
                .bold()
            Spacer()
            HStack {
                VStack (alignment: .leading) {
                    Text(name ?? "")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                }
                Spacer()
            }
        }
        .frame(width: 300, height: 200)
        .padding(.all)
        .background(LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(10)
        .onAppear {
            if type == "VISA" {
                color1 = .orange
                color2 = .red
            } else if type == "MASTER CARD" {
                color1 = .blue
                color2 = .green
            } else {
                color1 = .gray
                color2 = .blue
            }
            
            creditNumber = number?.replacingOccurrences(of: "(\\d{4})(\\d{4})(\\d{4})(\\d{4})", with: "$1 $2 $3 $4", options: .regularExpression, range: nil) ?? number ?? ""
        }
    }
}
