import Foundation

class Player {
    var playerName: String
    var teamSelection = [Int: Characters]() // Tableau
    
    init(playerName: String) {
        self.playerName = playerName
    }
    
    func namePlayer1() {
        print("Please enter the name of the first player !")
        if let player1 = readLine() {
            playerName = player1
        }
    }
    
    func namePlayer2() {
        print("Please enter the name of the second player !")
        if let player2 = readLine() {
            playerName = player2
        }
    }
    
    func characterChoice() {
        print("Please select 3 characters from the list above, you can choose the same for all three :"
            + "\n1. Warrior (make all opponents 10 points of damage with his sword and has 100 lifepoints)"
            + "\n2. Wizard (heal all his teammates 20 lifepoints with his magic wand and has 90 lifepoints)"
            + "\n3. Giant (make all opponents 5 points of damage with his hammer and has 80 lifepoints)"
            + "\n4. Dwarf (make all opponents 30 points of damage with his axe and has 50 lifepoints)")
    }
    
    func createTeam() {
        for _ in 0...2 {
            
            var teamChoice = 0
            
            repeat {
                characterChoice()
                
                if let choice = readLine() {
                    if let choiceToInt = Int(choice) {
                        teamChoice = choiceToInt
                    }
                }
            } while teamChoice != 1 && teamChoice != 2 && teamChoice != 3 && teamChoice != 4
            
            let nameChoice = GetName().nameCharacter()
            
            switch teamChoice {
            case 1:
                teamSelection[1] = Warrior(name: nameChoice)
                print("Your warrior is named \(nameChoice) !")
            case 2:
                teamSelection[2] = Wizard(name: nameChoice)
                print("Your wizard is named \(nameChoice) !")
            case 3:
                teamSelection[3] = Giant(name: nameChoice)
                print("Your giant is named \(nameChoice) !")
            case 4:
                teamSelection[4] = Dwarf (name: nameChoice)
                print("Your dwarf is named \(nameChoice) !")
            default:
                print("Please select one character !")
            }
        }
    }
    
    // Utile ?
    
    func displayCharactersSpecs() {
        print ("\(team1.playerName) has selected :")
        
        for (key, value) in team1.teamSelection {
            team1.teamSelection = [Int : Characters](uniqueKeysWithValues: team1.teamSelection.sorted{ $0.key < $1.key })
            
            print("\(key) A \(value.type) named \(value.charactersName) with his \(value.weapon.weaponName) and has \(value.healthPoints) lifePoints !")
    }
        print("\(team2.playerName) has selected :")
        
        for (key, value) in team2.teamSelection {
            team2.teamSelection = [Int : Characters](uniqueKeysWithValues: team2.teamSelection.sorted{ $0.key < $1.key })
            
            print("\(key) A \(value.type) named \(value.charactersName) with his \(value.weapon.weaponName) and has \(value.healthPoints) lifePoints !")
            }
        }
    
    func fightOrHealTeam1() {
        print("What will be your next move \(team1.playerName) ?"
            + "\n1 Attack one of your opponent !"
            + "\n2 Heal one of yours !")
        
        if let answer = readLine() {
            switch answer {
            case "1":
                game.fightChoiceTeam1()
            case "2":
                game.healChoiceTeam1()
            default:
                print("Sorry try again !")
            }
        }
    }

    func specsTeam1() {
        for (key, value) in team1.teamSelection {
        
        print("\(key) A \(value.type) named \(value.charactersName) with his \(value.weapon.weaponName) and has \(value.healthPoints) lifePoints !")
        }
    }
        
    func specsTeam2() {
        for (key, value) in team2.teamSelection {
                
        print("\(key) A \(value.type) named \(value.charactersName) with his \(value.weapon.weaponName) and has \(value.healthPoints) lifePoints !")
        }
    }
    
    func checkScoreTeam1() {
        if team1.teamSelection.isEmpty {
            print("GAME OVER ! The winner is \(team2.playerName) !")
            team1.teamSelection.removeAll()
            team2.teamSelection.removeAll()
            game.start()
        }
    }
    
    func checkScoreTeam2() {
        if team2.teamSelection.isEmpty {
            print("GAME OVER ! The winner is \(team1.playerName) !")
            team2.teamSelection.removeAll()
            team1.teamSelection.removeAll()
            game.start()
        }
    }
}

var team1 = Player(playerName: "")
var team2 = Player(playerName: "")
