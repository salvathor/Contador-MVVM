//
//  ContadorViewModel.swift
//  ContadorMVVM
//
//  Created by Salvador Lopez on 09/11/26.
//

import SwiftUI
// En esta implementación, Combine proporciona ObservableObject y @Published.
import Combine

/// ViewModel (modelo de vista): conecta las acciones de la vista con el modelo.
/// Conserva el estado que se presenta y expone las operaciones disponibles.
/// No conoce ContentView: la vista observa al ViewModel, no al revés.
///
/// Flujo MVVM de este ejemplo:
/// 1. La vista recibe un toque en el botón y llama a incrementar().
/// 2. El ViewModel pide al modelo el nuevo contador.
/// 3. Al asignarlo a contador, @Published anuncia el cambio.
/// 4. SwiftUI vuelve a evaluar la vista que lo observa y muestra el nuevo valor.
@MainActor
// @MainActor aísla el estado y las operaciones en el actor principal,
// coordinando los cambios que consume la interfaz.
class ContadorViewModel: ObservableObject {
    
    // ObservableObject permite observar los cambios de este objeto.
    // @Published anuncia los cambios de contador a sus observadores.
    // private(set) permite leer el estado desde la vista, pero solo esta clase
    // puede reemplazarlo; así las modificaciones pasan por sus operaciones.
    @Published private(set) var contador = Contador(valor: 0)
    
    /// Atiende la intención de incrementar que llega desde la vista.
    func incrementar(){
        // La regla de sumar pertenece al modelo. Aquí se guarda el resultado
        // para que la vista pueda mostrarlo mediante la observación.
        contador = contador.incrementar()
    }
    
}
