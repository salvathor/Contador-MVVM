//
//  Contador.swift
//  ContadorMVVM
//
//  Created by Salvador Lopez on 09/11/26.
//

/// Model (modelo): representa los datos y la regla de incremento del contador.
/// No conoce la vista ni el ViewModel y no depende de SwiftUI, por lo que
/// su lógica puede utilizarse y probarse sin una interfaz gráfica.
struct Contador {
    // El estado es inmutable: una instancia conserva siempre su valor.
    let valor: Int
    
    /// Devuelve un nuevo contador con una unidad más, sin modificar el original.
    /// El ViewModel será responsable de guardar esta nueva instancia.
    func incrementar() -> Contador {
        Contador(valor: valor + 1)
    }
}


