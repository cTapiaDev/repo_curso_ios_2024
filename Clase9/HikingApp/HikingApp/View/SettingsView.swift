

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List {
            // HEADER
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        
                        Text("Selección del Editor")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .customGreenLight,
                            .customGreenMedium,
                            .customGreenDark
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("¿Dónde puedo encontrar \nsenderos perfectos?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("El sendero se ve hermoso en las fotos, pero es aún mejor cuando lo vives. Tienes que volver a hacerlo algún dia. \nEncuentra las mejroes excursiones en la aplicación.")
                        .font(.footnote)
                        .italic()
                    
                    Text("¡Quita el polvo a las botas! Es hora de dar un paseo.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)
            
            // ABOUT
            Section (
                header: Text("Acerca de la App"),
                footer: HStack {
                    Spacer()
                    Text("Copyright - Todos los derechos reservados")
                    Spacer()
                }
                .padding(.vertical, 8)
            ) {
//                LabeledContent("Application", value: "Hike")
                
                CustomListRowView(rowLabel: "Aplicación", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                CustomListRowView(rowLabel: "Compatibilidad", rowIcon: "info.circle", rowContent: "iOS", rowTintColor: .red)
                CustomListRowView(rowLabel: "Tecnología", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                CustomListRowView(rowLabel: "Desarrollador", rowIcon: "ellipsis.curlybraces", rowContent: "Carlos Tapia", rowTintColor: .mint)
                CustomListRowView(rowLabel: "Diseñador", rowIcon: "paintpalette", rowContent: "John Doe", rowTintColor: .pink)
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Desafio Latam", rowLinkDestination: "https://desafiolatam.com")
            }
        }
    }
}

#Preview {
    SettingsView()
}
