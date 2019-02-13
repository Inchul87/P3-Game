import Foundation

class Player {
    var playerName: String
    var teamSelection = [Characters]()
    var deadCharacters = [Characters]()
    
    init(playerName: String) {
        self.playerName = playerName
    }
    
    // Ajouter 
    func displayScore() {
        for (key, value) in teamSelection.enumerated() {
            if value.healthPoints >= 1 {
                if value is Warrior || value is Giant || value is Dwarf {
                    print("\(key + 1) The \(value.type) named \(value.characterName) has taken \(value.weapon.damage) lifePoints with his \(value.weapon.weaponName) and has \(value.healthPoints) / \(value.maxHealthPoints) !")
                } else if value is Wizard {
                    print("\(key + 1) The \(value.type) named \(value.characterName) has healed \(value.weapon.heal) healthPoints with his \(value.weapon.weaponName) and has \(value.healthPoints) / \(value.maxHealthPoints) !")
                } else {
                    print("\(key + 1) The \(value.type) \(value.characterName) is dead !")
                }
            }
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
