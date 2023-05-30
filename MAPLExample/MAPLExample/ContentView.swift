//
//  ContentView.swift
//  MAPLExample
//
//  Created by Dmytro Romanov on 30.05.2023.
//

import SwiftUI
import CoreLocation
import MapLauncher

struct ContentView: View {

    // Sample of possible destination to build a route (Sophia Square, Kyiv, Ukraine)
    private let placeLocation = CLLocationCoordinate2D(latitude: 50.4536, longitude: 30.5164)

    private let title = "Build a route using:"
    private let messageDetails = "(you will be redirected to the selected app)"
    private let cancelTitle = "Discard"

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Build route to:")
            Button("Sophia Square, Kyiv, Ukraine") {
                // Example of MapLauncher usage
                MapLauncher().present(destination: placeLocation,
                                      on: rootViewController,
                                      actionSheetTitle: title,
                                      actionSheetMessage: messageDetails,
                                      cancelActionTitle: cancelTitle)
            }
            .padding()
            .foregroundColor(.black)
            .background(RoundedRectangle(cornerRadius: 14, style: .continuous).stroke(.blue, lineWidth: 2))
            .padding(.bottom, 50)
        }
        .padding()
    }
}

private extension View {
    // This implementation here only to have the pimpliest way to get UIViewController
    // This implementation of rootViewController retrieving is not recommended to use
    var rootViewController: UIViewController { (UIApplication.shared.windows.first?.rootViewController)! }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
