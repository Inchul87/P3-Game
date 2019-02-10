import Foundation

class Player {
    var playerName: String
    var teamSelection = [Characters]()
    var deadCharacters = [Characters]()
    
    init(playerName: String) {
        self.playerName = playerName
    }
    
    // Ajouter 
    func specsTeam() {
        for (key, value) in teamSelection.enumerated() {
        
        print("\(key) A \(value.type) named \(value.characterName) with his \(value.weapon.weaponName) and has \(value.healthPoints) lifePoints !")
        }
    }

    func displayDeadCharacters() {
        for death in deadCharacters {
            deadCharacters = deadCharacters.filter{$0.healthPoints
                <= 0}
            print ("Your \(death.type) \(death.characterName) is dead !")
        }
    }
    
    func characterChoice() -> Int {
        var selectedCharacter = 0
        repeat{
            if let data = readLine() {
                if let data = Int(data) {
                    selectedCharacter = data
                }
            }
        } while selectedCharacter != 1 && selectedCharacter != 2 && selectedCharacter != 3
        return selectedCharacter
    }
    
}
