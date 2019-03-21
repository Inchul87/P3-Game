class Player {
    let playerName: String
    var charactersInTeam = [Character]()
    static let maxNbOfCharactersInTeam = 3
    
    init(playerName: String) {
        self.playerName = playerName
    }
    
    func addCharacter(character: Character) {
        charactersInTeam.append(character)
    }
    
    func charactersAlive() -> Int {
        var count = 0
        for character in charactersInTeam {
            if character.isAlive {
                count += 1
            }
        }
        return count
    }
    
/*
    var isTeamAlive: Bool {
        for character in charactersInTeam {
            if character.isAlive {
                return true
            }
        }
        return false
    }
 */

    func selectCharacter() -> Character {
        var index = 0
        for character in charactersInTeam {
            index += 1
            print("""
            \(index) \(character.characterType) \(character.characterName)
            LifePoints : \(character.healthPoints) / \(character.maxNbOfHealthPoints)
            """)
        }
        while true {
            if let choice = Int(readLine()!) {
                switch choice {
                case 1 ... index:
                    if charactersInTeam[choice - 1].isAlive {
                        return charactersInTeam[choice - 1]
                    } else {
                        print("Sorry this character is already dead !")
                    }
                default:
                    break
                }
            }
            print("Something went wrong ! Please make a choice between 1 and \(index) !")
        }
    }
}

