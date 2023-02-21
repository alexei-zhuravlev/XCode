//
//  AddPlayer.swift
//  TestFor10Phases
//
//  Created by Алексей Журавлев on 13.02.2023.
//

import SwiftUI

struct AddPlayer: View {
    
    @EnvironmentObject var players: Players
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var newPlayerName:String = ""
    
    var body: some View {
        
        VStack {
            Text("Введите имя игрока")

            TextField("Введите имя", text: $players.newPlayerName)
                .textFieldStyle(.roundedBorder)
                .padding()
                }
            
//            Text ("Введите счет")
//
//            TextField("Введите счет", text: $players.newScore)
            
            Button {
                self.players.addNewPlayer()
                self.players.newPlayerName = ""
                self.players.newScore = ""
                dismiss()
            } label: {
                Text("Сохранить")
            }

        }
    }


struct AddPlayer_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayer()
            .environmentObject(Players())
    }
}
