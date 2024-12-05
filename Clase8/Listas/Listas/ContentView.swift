

import SwiftUI

struct ContentView: View {
    
    
    
    var body: some View {
        NavigationView {
            
            //            List(lista) { item in
            //                HStack {
            //                    emoji(emoji: item)
            //                    Text(item.nombre)
            //                        .font(.subheadline)
            //                }
            //            }
                        
            // Para vista de Detalle
            
            List(lista) { item in
                NavigationLink (
                    destination: VistaDetalle(items: item)
                ) {
                    HStack {
                        emoji(emoji: item)
                        Text(item.nombre)
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Lista")
        }
    }
}

struct emoji: View {
    let emoji: Modelo
    var body: some View {
        ZStack {
            Text(emoji.emoji)
                .shadow(radius: 3)
                .font(.largeTitle)
                .frame(width: 65, height: 65)
                .overlay(
                    Circle().stroke(Color.purple, lineWidth: 3)
                )
        }
    }
}

struct VistaDetalle: View {
    let items: Modelo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3, content: {
            HStack {
                emoji(emoji: items)
                Text(items.nombre).font(.largeTitle)
                Spacer()
            }
            Text(items.descripcion).padding(.top)
            Spacer()
        }).padding(.all)
    }
}



