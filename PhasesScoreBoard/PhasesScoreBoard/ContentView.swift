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
    
    let testName:String = "Tom"
    let testPhasa:Int = 10
    let testScore:Int = 456
    
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
                                VStack(alignment: .center){
                                    Text(player.name)
                                        .font(.title)
                                        .foregroundColor(.black)
                                        .fontWeight(.black)
                                    
                                    
                                    HStack(alignment: .firstTextBaseline, spacing: 1){
                                        ForEach (1...10, id: \.self){ num in
                                            ZStack(alignment: .center) {
                                                Image(systemName: num < (player.phasa) ? "circle.fill" : "circle")
                                                    .font(.title3)
                                                
                                                Text("\(num)")
                                                    .foregroundColor( num < (player.phasa) ? .white : .black)
                                            }
                                        }
                                    }
                                    
                                    
                                    Text("Текущая фаза")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .padding(.top)
                                        .padding(.bottom, 5)
                                    
                                    HStack {
                                        switch player.phasa{
                                        case 1:
                                            Phasa1()
                                        case 2:
                                            Phasa2()
                                        case 3:
                                            Phasa3()
                                        case 4:
                                            Phasa4()
                                        case 5:
                                            Phasa5()
                                        case 6:
                                            Phasa6()
                                        case 7:
                                            Phasa7()
                                        case 8:
                                            Phasa8()
                                        case 9:
                                            Phasa9()
                                        case 10:
                                            Phasa10()
                                        default:
                                            Text("Все фазы собраны!!!")
                                                .font(.largeTitle)
                                                .fontWeight(.black)
                                                .frame(maxWidth: .infinity)
                                        }
                                    }
                                    .padding(.horizontal)
                                    
                                    Text("Счет - \(player.score)")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .padding(.top)
                                }
                                
                            }
                        }
                    }
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
                
                Button {
                    players.newGame()
                } label: {
                    Text("Новая игра")
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
