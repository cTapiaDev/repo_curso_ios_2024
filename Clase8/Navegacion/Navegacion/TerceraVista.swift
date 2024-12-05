//
//  TerceraVista.swift
//  Navegacion
//
//  Created by Cony Pierola on 04-12-24.
//

import SwiftUI

struct TerceraVista: View {
    var body: some View {
        ZStack {
            Color.brown.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Tercera Vista")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                
                    .navigationTitle("Tercera")
            }
            
        }
    }
}
