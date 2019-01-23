class Player {
    var playerName: String
    var teamSelection = [Int: Characters]()
    
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
            
            let nameChoice = GetName().display.nameCharacter()
            
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
}

var team1 = Player(playerName: "")
var team2 = Player(playerName: "")
