import Foundation

class Player {
    var playerName: String
    var charactersName = [String]()
    var teamSelection = [Characters]()
    let maxTeamSelection = 3
    
    init(playerName: String) {
        self.playerName = playerName
    }
    
    func selectTeam() {
        print("Please select 3 characters from the list above, you can choose the same for all three :"
            + "\n1. Warrior (make all opponents 10 points of damage with his sword and has 100 lifepoints)"
            + "\n2. Wizard (heal all his teammates 20 lifepoints with his magic wand and has 90 lifepoints)"
            + "\n3. Giant (make all opponents 5 points of damage with his hammer and has 80 lifepoints)"
            + "\n4. Dwarf (make all opponents 30 points of damage with his axe and has 50 lifepoints)")
        
        // let choice
            
            switch choice {
            case "1":
                print("You have selected a warrior !")
                teamSelection.append(Warrior())
                getName()
            case "2":
                print("Your have selected a wizard !")
                teamSelection.append(Wizard())
                getName()
            case "3":
                print("You You have selected a giant !")
                teamSelection.append(Giant())
                getName()
            case "4":
                print("You have selected a dwarf !")
                teamSelection.append(Dwarf())
                getName()
            default: print("Got it ! Thanks !")
                return
            }
        }
    
    func getName() {
        var choice: String?
        for _ in 0..<teamSelection.count {
            while choice == nil || choice == "" {
                print("Please enter a name for your character !")
                choice = readLine()
                if charactersName.contains(choice!){
                    print("You already have select this name ! Please enter a new one !")
                    getName()
                } else {
                    charactersName.append(choice!)
                }
            }
        }
    }
    
    // Ajouter classe Game
    func displayScore() {
        for (key, value) in teamSelection.enumerated() {
            if value.healthPoints >= 1 {
                if value is Warrior || value is Giant || value is Dwarf {
                    print("\(key + 1) The \(value.type) named \(value.charactersName) can take \(value.weapon.damage) lifePoints with his \(value.weapon.weaponName) and has \(value.healthPoints) / \(value.maxHealthPoints) !")
                } else if value is Wizard {
                    print("\(key + 1) The \(value.type) named \(value.charactersName) can heal one of his team \(value.weapon.heal) healthPoints with his \(value.weapon.weaponName) and has \(value.healthPoints) / \(value.maxHealthPoints) !")
                } else {
                    print("\(key + 1) The \(value.type) \(value.charactersName) is dead !")
                }
            }
        }
    }
}

