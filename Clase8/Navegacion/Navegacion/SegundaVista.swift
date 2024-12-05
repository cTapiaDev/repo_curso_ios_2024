//
//  SegundaVista.swift
//  Navegacion
//
//  Created by Cony Pierola on 04-12-24.
//

import SwiftUI

struct SegundaVista: View {
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Segunda Vista")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                NavigationLink(destination: TerceraVista()) {
                    Text("Tercera Vista")
                }
                .navigationTitle("Segunda")
                
            }
            
        }
    }
}

