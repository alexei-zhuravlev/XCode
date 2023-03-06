//
//  ContentView.swift
//  TestFor10Phases
//
//  Created by Алексей Журавлев on 13.02.2023.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var players:Players = Players()
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                VStack(spacing: 5){
                    List {
                        ForEach(players.players, id: \.self){player in
                            NavigationLink {
                                //
                                EditPlayer(playerName: player.name)
                                    .environmentObject(players)
                            } label: {
                                PlayerView(player:player)
                                    .environmentObject(players)
                            }
                        }
                    }
//                    .listStyle(.plain)
                    .navigationTitle("10 Фаз")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                isPresented = true
                            } label: {
                                Image(systemName: "plus")
                            }
                            .sheet(isPresented: $isPresented) {
                                AddPlayer()
                                    .environmentObject(players)
                            }
                        }
                    }
                }
                
                HStack {
                    Button {
                        players.newGame()
                    } label: {
                        Text("Новая игра")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
