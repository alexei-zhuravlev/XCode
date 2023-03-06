//
//  PlayerView.swift
//  PhasesScoreBoard
//
//  Created by Алексей Журавлев on 22.02.2023.
//

import SwiftUI

struct PlayerView: View {
    
    let player:SinglePlayer
    
    @EnvironmentObject var players: Players
    
    var body: some View {
        
        VStack(alignment: .center){
            Text(player.name)
                .font(.title)
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
            
            VStack {
                Text("Счет история")
                    .opacity(0.5)
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack{
                        ForEach(player.scoreArhive, id: \.self) { num in
                            Text("\(num)")
                                .font(.caption)
                                .strikethrough()
                                .opacity(0.5)
                        }
                    }
                }
            }
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(player: SinglePlayer())
            .environmentObject(Players())
    }
}
