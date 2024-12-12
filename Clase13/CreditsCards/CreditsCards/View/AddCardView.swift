

import SwiftUI

struct AddCardView: View {
    
    @Environment(\.managedObjectContext) private var context
//    @Binding var show: Bool
    
    @StateObject var cards: CardsViewModel
    let types = ["VISA", "MASTER CARD", "AMERICAN EXPRESS"]
    
    @State private var error = false
    @State private var msgError = "¡Error!"
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.orange, .red]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Add credit card")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                TextField("Name", text: $cards.name)
                    .textFieldStyle(.roundedBorder)
                TextField("Number", text: $cards.number)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                TextField("Credits", text: $cards.credit)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                Picker("", selection: $cards.type) {
                    ForEach(types, id:\.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                
                Button {
                    cards.saveCard(context: context) { done in
                        if done {
                            cards.addCardView.toggle()
                        } else {
                            error.toggle()
                        }
                    }
                } label: {
                    Text("Save Card")
                        .font(.title3)
                        .foregroundColor(.black)
                        .bold()
                }
                .buttonStyle(.borderedProminent)
                .tint(.white)
                Spacer()
            }
            .padding(.all)
            .alert(msgError, isPresented: $error) {
                Button("OK", role: .cancel) {}
            }
        }
    }
}
