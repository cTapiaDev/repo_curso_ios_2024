//
//  TabViewMain.swift
//  Navegacion
//
//  Created by Cony Pierola on 04-12-24.
//

import SwiftUI

struct TabViewMain: View {
    var body: some View {
        TabView {
            ContentView().tabItem {
                Label("Home", systemImage: "house.fill")
            }
            Vista2().tabItem {
                Label("Vista2", systemImage: "plus")
            }
            Vista3().tabItem {
                Label("Vista3", systemImage: "camera")
            }
        }
    }
}

