//
//  ContentView.swift
//  LlamadaSMS
//
//  Created by Cony Pierola on 04-12-24.
//

import SwiftUI

struct ContentView: View {
    
    let numero = "945372566"
    let mensaje = "Hola desde SwiftUI"
    
    var body: some View {
        HStack {
            Button(action: {
                sendCall()
            }) {
                Image(systemName: "phone.fill")
                    .modifier(boton(color: .blue))
            }
            Button(action: {
                sendMessage()
            }) {
                Image(systemName: "message.fill")
                    .modifier(boton(color: .red))
            }
        }
    }
    
    func sendMessage() {
        let sms = "sms:\(numero)&body=\(mensaje)"
        guard let stringSMS = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        UIApplication.shared.open(URL.init(string: stringSMS)!, options: [:], completionHandler: nil)
    }
    
    func sendCall() {
        guard let number = URL(string: "tel://\(numero)") else { return }
        UIApplication.shared.open(number)
    }
}

#Preview {
    ContentView()
}

struct boton: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .padding()
            .background(color)
            .clipShape(Circle())
            .foregroundColor(.white)
            .font(.title)
    }
}
