import Foundation

class Player {
    var playerName: String
    var teamSelection = [Characters]()
    
    init(playerName: String) {
        self.playerName = playerName
    }
    
    // Ajouter 
    func specsTeam() {
        for (key, value) in teamSelection.enumerated() {
        
        print("\(key) A \(value.type) named \(value.charactersName) with his \(value.weapon.weaponName) and has \(value.healthPoints) lifePoints !")
        }
    }
    
    func checkScoreTeam() {
        if teamSelection.isEmpty {
            print("GAME OVER ! The winner is \(playerName) !")
        }
    }
}
