import Foundation

class Game {
    static let maxNbOfPlayers = 2
    var teams = [Player]()
    var actualPlayer: Player!
    var actualPlayerIndex = 0
    var nbOfTurnsInGame = 0     // Stats Bonus
    let maxNbOfTeams = 2
    
    func start() {
        print("Welcome to this little RPG game !"
            + "\n You can oppose two players of three characters each !"
            + "\n The first player who destroys all his opponent characters win the game !")
        createTeams()
        while nbOfTeamsAlive(in: teams) > 1 {
            
            actualPlayer = teams[actualPlayerIndex]
            nbOfTurnsInGame += 1
            
            if actualPlayer.charactersAlive() > 0 {
                print("Lap N° \(nbOfTurnsInGame) / Player \(actualPlayer.playerName) !")
                play()
            }
            
            if actualPlayerIndex == maxNbOfTeams - 1 {
                actualPlayerIndex = 0
            } else {
                actualPlayerIndex += 1
            }
        }
        for player in teams {
            if player.charactersAlive() > 0 {
                print("Congratulations \(player.playerName) ! You have defeated your opponent in \(nbOfTurnsInGame) laps !")
            }
        }
    }
    
    // Déplacer
        func nbOfTeamsAlive(in teams: [Player]) -> Int {
        var count = 0
        for team in teams {
            if team.charactersAlive() > 0 {
                count += 1
            }
        }
        return count
    }
    
    func createTeams() {
        for _ in 1...Game.maxNbOfPlayers {
            _ = NameManager.getName()
        }
    }
    
    func selectCharacter() -> Character? {
            print("""
            Please select one character from the list above ! You have to select 3 characters ! You can choose the same for all three if you want !"
            1 - Warrior (make all opponents 10 points of damage with his sword and has 100 lifepoints)"
            2 - Wizard (heal all his teammates 20 lifepoints with his magic wand and has 90 lifepoints)"
            3 - Giant (make all opponents 5 points of damage with his hammer and has 80 lifepoints)"
            4 - Dwarf (make all opponents 30 points of damage with his axe and has 50 lifepoints)
            """)
            while true {
                if let choice = readLine() {
                    switch choice {
                    case "1":
                        return Warrior(characterName: NameManager.getName())
                    case "2":
                        return Wizard(characterName: NameManager.getName())
                    case "3":
                        return Giant(characterName: NameManager.getName())
                    case "4":
                        return Dwarf(characterName: NameManager.getName())
                    default:
                        print("Something went wrong ! Please try again !")
                    }
                }
            }
        }
    
    // func selectCharacter() et selectTeam() ds classe Player
    func play() {
        print("Please select one character in your team !")
        let character = actualPlayer.selectCharacter()
        switch character.selectNextMove() {
        case "Attack":
            let target = selectTeam()
            print("Please select the character you want to fight with !")
            character.nextMove(target: target.selectCharacter())
        case "Heal":
            print("Please select the member of your team you want to heal !")
            character.nextMove(target: actualPlayer.selectCharacter())
       /* case "Open Chest":
            character.showBox()
        */
        default:
            break
        }
    }
    
    func selectTeam() -> Player {
        var teamTarget = [Player]()
        for team in teams {
            if team !== actualPlayer && team.charactersAlive() > 0 {
                teamTarget.append(team)
            }
        }
        var index = 0
        print("Please select the team you want to attack !")
            for team in teamTarget {
                index += 1
                print("\(index) Team \(team.playerName)")
                for character in team.charactersInTeam {
                    print("\(character.characterType) \(character.characterName) / LifePoints : \(character.healthPoints) / \(character.maxNbOfHealthPoints)")
                }
            }
            while true {
                if let choice = Int(readLine()!) {
                    switch choice {
                    case 1 ... index:
                        return teamTarget[choice - 1]
                    default:
                        break
                    }
                }
                print("Something went wrong ! Please make a choice between 1 and \(index) !")
            }
        }
    }
