import Foundation

class Player {
    var playerName: String = ""
    var charactersName = [String]()
    var teamSelection = [Characters]()
    let maxTeamSelection = 3
    
    var score: Int {
        var gameOver = 0
        for character in teamSelection {
            gameOver += character.healthPoints
        }
        return gameOver
        }
    
    func selectTeam() {
        print("""
            Please select 3 characters from the list above, you can choose the same for all three :"
            1 - Warrior (make all opponents 10 points of damage with his sword and has 100 lifepoints)"
            2 - Wizard (heal all his teammates 20 lifepoints with his magic wand and has 90 lifepoints)"
            3 - Giant (make all opponents 5 points of damage with his hammer and has 80 lifepoints)"
            4 - Dwarf (make all opponents 30 points of damage with his axe and has 50 lifepoints)
            """)
        
        while teamSelection.count < Player().maxTeamSelection {
            guard let choice = readLine() else {
                print("Please select 3 characters from the list above !")
                return
            }
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
            }
        }
    }
    
    func getName() {
        var choice: String?
        for _ in 0..<teamSelection.count {
            while choice == nil || choice == "" {
                print("Please enter a name for your character !")
                choice = readLine()
                if charactersName.contains(choice!){
                    print("You already have enter this name ! Please choose a new one !")
                    getName()
                } else {
                    charactersName.append(choice!)
                }
            }
        }
    }
}

