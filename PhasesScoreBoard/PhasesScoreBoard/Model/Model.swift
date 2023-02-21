import SwiftUI

class Players:ObservableObject{
    @Published var players:[SinglePlayer] = []
    @Published var newPlayerName:String = ""
    @Published var newScore:String = ""
    
    func addNewPlayer(){
        let newPlayer = SinglePlayer()
        newPlayer.name = newPlayerName
        newPlayer.score = 0
        newPlayer.phasa = 1
        players.append(newPlayer)
    }
    
    func newGame(){
        players = [SinglePlayer]()
    }
}

class SinglePlayer:ObservableObject, Hashable{
    @Published var name:String = "Test"
    @Published var score:Int = 0
    @Published var phasa:Int = 1
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func == (lhs: SinglePlayer, rhs: SinglePlayer) -> Bool {
        return lhs.name == rhs.name
    }
}
