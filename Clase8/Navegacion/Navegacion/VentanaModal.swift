//
//  VentanaModal.swift
//  Navegacion
//
//  Created by Cony Pierola on 04-12-24.
//

import SwiftUI

struct VentanaModal: View {
    
    @Environment(\.presentationMode) var back
    
    var texto: String
    
    var body: some View {
        ZStack {
            Color.orange.edgesIgnoringSafeArea(.all)
            VStack {
                Text(texto)
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                Button("Cerrar") {
                    back.wrappedValue.dismiss()
                }
            }
        }
    }
}
