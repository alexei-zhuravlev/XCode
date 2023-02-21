//
//  PhasesScoreBoardApp.swift
//  PhasesScoreBoard
//
//  Created by Алексей Журавлев on 07.02.2023.
//

import SwiftUI

@main
struct PhasesScoreBoardApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(players: Players())
        }
    }
}
