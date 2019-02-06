import Foundation

class Game {
    var team = [Player]()
    
    func welcome() {
        print("Welcome to this little RPG game !"
            + "\n You can oppose two players of three characters each !"
            + "\n The first player who destroys all his opponent characters win the game !")
    }
    
    func charactersSpecs() {
        print("Please select 3 characters from the list above, you can choose the same for all three :"
            + "\n1. Warrior (make all opponents 10 points of damage with his sword and has 100 lifepoints)"
            + "\n2. Wizard (heal all his teammates 20 lifepoints with his magic wand and has 90 lifepoints)"
            + "\n3. Giant (make all opponents 5 points of damage with his hammer and has 80 lifepoints)"
            + "\n4. Dwarf (make all opponents 30 points of damage with his axe and has 50 lifepoints)")
    }
    
    func start() {
        for i in 0...1 {
            print ("It's your turn player \(i+1) !")
            _ = namePlayer()
        }
    }
    
    func namePlayer() -> Player {
        print ("Please enter your name !")
        var nameOfPlayer = ""
        repeat {
            if let name = readLine() {
                nameOfPlayer = name
            }
        } while nameOfPlayer == ""
        print ("Got it ! \(nameOfPlayer) !")
        let choice = Player(playerName: nameOfPlayer)
        team.append(Player(playerName: nameOfPlayer))
        return choice
        }
    
    func createTeam() {
        for (_, choice) in team.enumerated() {
            print ("Please select one character \(choice.playerName) !")
        for _ in 0...2 {
            var teamChoice = 0
            repeat {
                charactersSpecs()
                if let answer = readLine() {
                    if let choiceToInt = Int(answer) {
                        teamChoice = choiceToInt
                    }
                }
            } while teamChoice != 1 && teamChoice != 2 && teamChoice != 3 && teamChoice != 4
            let nameChoice = GetName().nameCharacter()
            
            switch teamChoice {
            case 1:
                print("Your warrior is named \(nameChoice) !")
                choice.teamSelection.append(Warrior(name: nameChoice))
            case 2:
                print("Your wizard is named \(nameChoice) !")
                choice.teamSelection.append(Wizard(name: nameChoice))
            case 3:
                print("Your giant is named \(nameChoice) !")
                choice.teamSelection.append(Giant(name: nameChoice))
            case 4:
                print("Your dwarf is named \(nameChoice) !")
                choice.teamSelection.append(Dwarf(name: nameChoice))
            default:
                return
            }
        }
            print("Got it ! Thanks !")
    }
}
    
    func displaySpecs() {
        for (_, choice) in team.enumerated() {
            choice.specsTeam()
        }
    }
    
    func launchGame() {
        welcome()
        start()
        createTeam()
    }
}
