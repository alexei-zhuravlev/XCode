//
//  EditPlayer.swift
//  TestFor10Phases
//
//  Created by Алексей Журавлев on 20.02.2023.
//

import SwiftUI

struct EditPlayer: View {
    
    @EnvironmentObject var players: Players
    
    @Environment(\.dismiss) private var dismiss
    
    var playerName:String = ""
    
    @State private var newTestScore:String = ""
    @State private var isDone:Bool = false
    
    
    var body: some View {
        
        if let playerIndex = players.players.firstIndex(where: { $0.name == playerName }){
            let testPlayer = players.players[playerIndex]
            let currentPhasa = testPlayer.phasa
            VStack {
                Text(playerName)
                    .font(.title)
                    .bold()
                
                Text("Текущая фаза")
                
                HStack {
                    switch currentPhasa{
                    case 1:
                        Phasa1()
                            .padding()
                    case 2:
                        Phasa2()
                            .padding()
                    case 3:
                        Phasa3()
                            .padding()
                    case 4:
                        Phasa4()
                            .padding()
                    case 5:
                        Phasa5()
                            .padding()
                    case 6:
                        Phasa6()
                            .padding()
                    case 7:
                        Phasa7()
                            .padding()
                    case 8:
                        Phasa8()
                            .padding()
                    case 9:
                        Phasa9()
                            .padding()
                    case 10:
                        Phasa10()
                            .padding()
                    default:
                        Phasa1()
                    }
                    
                    Image(systemName: isDone ? "checkmark.square" : "square")
                        .font(.title2)
                        .padding(.trailing, 5)
                        .onTapGesture {
                            isDone.toggle()
                        }
                }
                
                
                
                Text("Cчет - \(testPlayer.score)")
                
                TextField("Введите новый результат", text: $newTestScore)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .keyboardType(.numberPad)
                
                Button {
                    let oldResult = players.players[playerIndex].score
                    let increase = Int(newTestScore) ?? 0
                    let increasedScore = oldResult + increase
                    players.players[playerIndex].score = increasedScore
                    players.players[playerIndex].phasa = isDone ? (currentPhasa + 1) : currentPhasa
                    players.players[playerIndex].scoreArhive.append(increase)
                    players.objectWillChange.send()
                    
                    dismiss()
                } label: {
                    Text("Сохранить")
                }
            }
        }
    }
}

struct EditPlayer_Previews: PreviewProvider {
    static var previews: some View {
        EditPlayer()
            .environmentObject(Players())
    }
}
