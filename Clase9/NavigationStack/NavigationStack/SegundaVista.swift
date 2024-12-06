//
//  SegundaVista.swift
//  NavigationStack
//
//  Created by Cony Pierola on 05-12-24.
//

import SwiftUI

struct SegundaVista: View {
    
    var texto: String
    
    var body: some View {
        Text(texto)
            .navigationTitle("Segunda")
    }
}

