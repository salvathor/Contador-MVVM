import SwiftUI
import Playgrounds

/// View (vista): describe la interfaz y comunica las acciones del usuario.
/// Lee el estado del ViewModel y le delega las operaciones del contador.
struct ContentView: View {
    
    // La vista crea y posee este ViewModel. @StateObject conserva la instancia
    // mientras se mantiene la identidad de la vista, aunque body se reevalúe,
    // y permite que SwiftUI observe sus cambios publicados.
    @StateObject private var viewModel = ContadorViewModel()
    
    var body: some View {
        
        VStack(spacing: 20){
            // El texto se obtiene del modelo que expone el ViewModel.
            // SwiftUI actualiza la interfaz al recibir sus cambios.
            Text("Contador: \(viewModel.contador.valor)")
            Button("Incrementar"){
                // La vista expresa la intención del usuario; la regla de
                // incremento se resuelve a través del ViewModel y el modelo.
                viewModel.incrementar()
            }
        }
        
    }
}

// Permite visualizar la vista en el lienzo de Xcode con su propio ViewModel.
#Preview {
    ContentView()
}

// Espacio para experimentar con código en Xcode; no forma parte del flujo MVVM.
#Playground {
    _ = 1 + 2
}

