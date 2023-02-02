//
//  protocolsApp.swift
//  protocols
//
//  Created by Andrea Monroy on 2/1/23.
//

import SwiftUI

@main
struct protocolsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(dataSource: DefaultDataSource())
        }
    }
}
