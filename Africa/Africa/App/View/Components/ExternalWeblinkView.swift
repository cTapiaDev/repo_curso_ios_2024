//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Cony Pierola on 19-12-24.
//

import SwiftUI

struct ExternalWeblinkView: View {
    
    let animal: Animal
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                }
                .foregroundStyle(.accent)
            }
        }
    }
}
