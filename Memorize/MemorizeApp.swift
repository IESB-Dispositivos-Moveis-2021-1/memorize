//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Pedro Henrique on 22/07/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            ThemeView(viewModel: ThemeViewModel())
        }
    }
}
