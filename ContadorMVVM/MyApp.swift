import SwiftUI

// Punto de entrada de la aplicación. Configura la escena y su vista inicial.
// La separación MVVM se encuentra en Contador (Model),
// ContentView (View) y ContadorViewModel (ViewModel).
@main struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            // ContentView crea el ViewModel que administra el estado del contador.
            ContentView()
        }
    }
}
