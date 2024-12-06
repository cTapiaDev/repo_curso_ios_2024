

import SwiftUI

struct CardView: View {
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    
    @State private var isShowingSheet: Bool = false
    
    func randomImage() {
        
        print("--- BOTON PRESIONADO ---")
        print("Estado: Número antiguo =", imageNumber)
        
        repeat {
            randomNumber = Int.random(in: 1...5)
            print("Acción: Nuevo número generado =", randomNumber)
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
        print("Resultado: Nuevo número de la imagen: ", imageNumber)
        print("--- FIN DEL PROCESO ---")
        print("\n")
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
                // HEADER
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        .customGrayLight,
                                        .customGrayMedium
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                        
                        Spacer()
                        
                        Button {
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    
                    Text("Actividad divertida al aire libre para amigos y familiares")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }
                
                
                
                // CONTENIDO
                ZStack {
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                
                // FOOTER
                Button {
                    randomImage()
                } label: {
                    Text("Explorar más")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGreenLight,
                                    .customGreenMedium
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(
                            color: .black.opacity(0.25),
                            radius: 0.25, x: 1, y: 2
                        )
                }
                .buttonStyle(GradientButton())
            }
            .padding(.horizontal, 30)
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView().padding(.all)
}
