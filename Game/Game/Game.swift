class Game {
    var characterA: Characters
    var characterB: Characters
    var characterC: Characters
    var characterD: Characters
    
    init(characterA: Characters, characterB: Characters, characterC: Characters, characterD: Characters) {
        self.characterA = characterA
        self.characterB = characterB
        self.characterC = characterC
        self.characterD = characterD
    }
    
    func start() {
        print("Welcome to this little RPG game !"
            + "\n You can oppose two players of three characters each !"
            + "\n The first player who destroys all his opponent characters win the game !")
        
        // A compléter
        team1.namePlayer1()
        team1.createTeam()
        team2.namePlayer2()
        team2.createTeam()
        team1.displayCharactersSpecs()
    }
    
    func fightChoiceTeam1() {
        print("Please select one character to fight with !")
        team1.specsTeam1()

        if let fighterTeam1 = readLine() {
            switch fighterTeam1 {
            case "1":
                if team1.teamSelection[1] == nil {
                    print("Sorry you can't select this character !")
                    fightChoiceTeam1()
                }else{
                    print("You have selected your warrior !")
                    characterA = team1.teamSelection[1]!
                }
            case "2":
                if team1.teamSelection[2] == nil {
                    print("Sorry you can't select this character !")
                    fightChoiceTeam1()
                }else{
                    print("You have selected your giant !")
                    characterA = team1.teamSelection[2]!
                }
            case "3":
                if team1.teamSelection[3] == nil {
                    print("Sorry you can't select this character !")
                    fightChoiceTeam1()
                }else{
                    print("You have selected your dwarf !")
                    characterA = team1.teamSelection[3]!
                }
                default:
                    break
                }
            }
        }
    
    func healChoiceTeam1() {
        print("Please select the character you want to heal !")
        team1.specsTeam1()
        
        if let answer = readLine() {
            switch answer {
            case "1":
                print("Your warrior will be healed !")
                if team1.teamSelection[1] == nil {
                    print("Sorry your warrior is dead !")
                } else {
                    team1.teamSelection[1]!.healthPoints = team1.teamSelection[1]!.healthPoints + potion.damage
                    if  team1.teamSelection[1]!.healthPoints >= 100 {
                        print("Sorry your warrior can't have more than 100 lifePoints !")
                        team1.teamSelection[1]!.healthPoints = 100
                        print("Your warrior has now \(team1.teamSelection[1]!.healthPoints) lifePoints !")
                    }
                }
            case "2":
                print("Your giant will be healed !")
                if team1.teamSelection[2] == nil {
                    print("Sorry your giant is dead !")
                } else {
                    team1.teamSelection[2]!.healthPoints = team1.teamSelection[2]!.healthPoints + potion.damage
                    if  team1.teamSelection[2]!.healthPoints >= 80 {
                        print("Sorry your giant can't have more than 80 lifePoints !")
                        team1.teamSelection[2]!.healthPoints = 80
                        print("Your colossus has now \(team1.teamSelection[2]!.healthPoints) lifePoints !")
                    }
                }
            case "3" :
                print("Your dwarf will be healed !")
                if team1.teamSelection[3] == nil {
                    print("Sorry your dwarf is dead !")
                } else {
                    team1.teamSelection[3]!.healthPoints = team1.teamSelection[3]!.healthPoints + potion.damage
                    if  team1.teamSelection[3]!.healthPoints >= 50 {
                        print("Sorry your dwarf can't have more than 50 lifePoints !")
                        team1.teamSelection[3]!.healthPoints = 50
                        print ("Your dwarf has now \(team1.teamSelection[3]!.healthPoints) lifePoints !")
                    }
                }
            default:
                break
            }
        }
    
        print("Who do you want to attack ?")
        team2.specsTeam2()
        
        if let characterTeam2 = readLine() {
            switch characterTeam2 {
            case "1":
                print("Got it ! You will fight his warrior !")
                characterB = team2.teamSelection[1]!
                characterA.fightForTeam1(characterB: characterB)
                if characterB.healthPoints < 1 {
                    team2.teamSelection.removeValue(forKey: 1)
                    team2.checkScoreTeam2()
                } else {
                    print("It's your turn \(team2.playerName) !")
                }
            case "2":
                print("Got it ! You will fight his giant !")
                characterB = team2.teamSelection[2]!
                characterA.fightForTeam1(characterB: characterB)
                if characterB.healthPoints < 1 {
                    team2.teamSelection.removeValue(forKey: 2)
                    team2.checkScoreTeam2()
                } else {
                    print("It's your turn \(team2.playerName) !")
                }
            case "3":
                print("Got it ! You will fight his dwarf !")
                characterB = team2.teamSelection[3]!
                characterA.fightForTeam1(characterB: characterB)
                if characterB.healthPoints < 1 {
                    team2.teamSelection.removeValue(forKey: 3)
                    team2.checkScoreTeam2()
                } else {
                    print("It's your turn \(team2.playerName) !")
                }
            default:
                break
            }
        }
    }
}

var game = Game(characterA: warrior, characterB: warrior, characterC: warrior, characterD: warrior)
