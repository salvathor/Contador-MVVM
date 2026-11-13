# ContadorMVVM

Aplicación de ejemplo desarrollada con Swift y SwiftUI para comprender la arquitectura **MVVM (Model–View–ViewModel)**. La interfaz muestra un contador que comienza en cero y un botón **Incrementar** que aumenta su valor en una unidad.

El objetivo del proyecto es mostrar cómo separar los datos y las reglas del dominio, la presentación visual y la coordinación del estado.

## Estructura del proyecto

```text
ContadorMVVM/
├── MyApp.swift
├── model/
│   └── Contador.swift
├── view/
│   └── ContentView.swift
├── view-model/
│   └── ContadorViewModel.swift
└── Assets.xcassets
```

## Arquitectura MVVM

### Model: `Contador`

Representa los datos y la regla de incremento. Es una estructura con una propiedad inmutable, `valor`. Su método `incrementar()` devuelve una nueva instancia con una unidad más, sin modificar la original.

El modelo no depende de SwiftUI ni conoce la vista o el ViewModel. Esto permite utilizar y probar su lógica de manera independiente de la interfaz.

### View: `ContentView`

Describe la interfaz mediante un `VStack`, un texto con el valor actual y un botón. Al pulsar el botón, llama a `viewModel.incrementar()`.

La vista crea y conserva su ViewModel mediante `@StateObject`. SwiftUI observa sus cambios publicados y vuelve a evaluar la vista para mostrar el estado actualizado. La vista lee el valor mediante `viewModel.contador.valor` y delega la operación de incremento al ViewModel.

### ViewModel: `ContadorViewModel`

Conecta las acciones de la vista con el modelo. Mantiene el contador actual, inicialmente en cero, y expone el método `incrementar()`. Este método solicita al modelo una nueva instancia y la asigna al estado observado.

La implementación utiliza los siguientes mecanismos:

| Elemento | Propósito |
| --- | --- |
| `ObservableObject` | Permite que SwiftUI observe los cambios del ViewModel. |
| `@Published` | Anuncia los cambios de la propiedad `contador`. |
| `private(set)` | Permite leer el contador desde fuera de la clase, pero restringe su asignación a la propia clase. |
| `@MainActor` | Aísla el estado y las operaciones del ViewModel en el actor principal. |
| `@StateObject` | Conserva el ViewModel creado por la vista mientras se mantiene la identidad de esta. |

En este proyecto, `ObservableObject` y `@Published` pertenecen a Combine.

## Flujo de una interacción

1. El usuario pulsa **Incrementar** en `ContentView`.
2. La vista llama a `ContadorViewModel.incrementar()`.
3. El ViewModel llama a `Contador.incrementar()`.
4. El modelo devuelve un nuevo contador con el valor incrementado.
5. El ViewModel asigna ese resultado a su propiedad `contador`, que anuncia el cambio mediante `@Published`.
6. SwiftUI actualiza el texto de la vista con el nuevo valor.

Por ejemplo, si el contador muestra `0`, una pulsación produce un nuevo modelo con valor `1` y la interfaz muestra `Contador: 1`.

## Punto de entrada

`MyApp.swift` contiene el tipo marcado con `@main`. Su `WindowGroup` presenta `ContentView`, que crea el ViewModel encargado del estado del contador.

## Cómo ejecutar el proyecto

1. Abre `ContadorMVVM.xcodeproj` en Xcode.
2. Selecciona el esquema `ContadorMVVM` y un destino compatible.
3. Ejecuta la aplicación con **Run** (`⌘R`).
4. Pulsa **Incrementar** y comprueba cómo cambia el valor mostrado.

`ContentView.swift` también incluye un bloque `#Preview` para visualizar la interfaz en el lienzo de Xcode y un bloque `#Playground` con una operación de ejemplo independiente del flujo MVVM.

## Alcance del ejemplo

El contador se mantiene en memoria y no se guarda entre ejecuciones. El proyecto se centra en la separación de responsabilidades y en la actualización de la interfaz a partir del estado observable, sin persistencia ni servicios de red.
