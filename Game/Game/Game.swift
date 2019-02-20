import Foundation

class Game {
    let players: Int
    var teams = [Player]()
    
    init(players: Int) {
    self.players = players
    }
    
    func welcome() {
        print("Welcome to this little RPG game !"
            + "\n You can oppose two players of three characters each !"
            + "\n The first player who destroys all his opponent characters win the game !")
    }
    
    func start() {
        for i in 0...1 {
            print ("It's your turn player \(i + 1) !")
        }
    }
    
    func namePlayer() -> String {
        var playerName: String?
        while playerName == nil || playerName == "" {
            print("Please enter your name !")
            playerName = readLine()
        }
        print("Got it ! \(playerName!) !")
        return playerName!
    }
    
    // Créer nouvelle fonction
    func createTeam() {
        for _ in 0..<players {
            let team = Player()
            team.playerName = namePlayer()
            team.teamSelection()
            print("indiquer composition équipe")
            teams.append(team)
        }
    }
    
    func recapTeams() {
        for selection in teams {
            selection.displayScore()
        }
    }
    
    func isItOver() -> Bool {
        for player in teams {
            if player.teamSelection.count == 0 {
                print("GAME OVER\(player.playerName) !")
                
                return true
            }
        }
        return false
    }
    
    
    func randomBox(character: Characters, player: Player){
        let random = arc4random_uniform(100)
        if character.healthPoints > 0 {
            if random < 25 {
            print("\(character.charactersName) just found a box !")
                if character is Warrior || character is Giant || character is Dwarf {
                    if character.weapon is Sword || character.weapon is Hammer || character.weapon is Axe {
                        let newWeapon = Mace()
                        print ("There is a mace in it ! it will give 40 damagePoints to one of your opponent each time !")
                        character.weapon = newWeapon
                    }
                } else if character is Wizard {
                    if character.weapon is MagicWand {
                        let newWeapon = Potion()
                        print("there is a potion in it ! It will give 40 lifePoints to one of yours ! Double the magic wand !")
                        character.weapon = newWeapon
                    }
                }
            }
        }
    }
    
    func fight() {
        recapTeams()
        var attacker: Characters
        var target: Characters
        repeat {
            for player in teams {
                let actualPlayer = player.playerName
                print("Please select the character you want to fight with \(player.playerName) !")
                player.displayScore()
                var characterSelection: Int
                repeat {
                    characterSelection = player.characterChoice() - 1
                } while (characterSelection < 0 || characterSelection >= player.teamSelection.count)
                if (characterSelection >= 0 && characterSelection < player.teamSelection.count) {
                    attacker = player.teamSelection[characterSelection]
                    randomBox(character: attacker, player: player) //randomBox
                    if let wizard = attacker as? Wizard{
                        print("Please select the character you want to heal \(player.playerName) ! You can't heal yourself !")
                        player.displayScore()
                        wizard.heal(character: player.teamSelection[player.characterChoice() - 1])
                    } else {
                        print("Please select the character you want to attack \(actualPlayer) !")
                        player.displayScore()
                        repeat {
                            characterSelection = player.characterChoice() - 1
                        } while (characterSelection < 0 || characterSelection >= player.teamSelection.count)
                        if (characterSelection >= 0 && characterSelection < player.teamSelection.count) {
                            target = player.teamSelection[characterSelection]
                            if attacker.healthPoints > 0 {
                                target.healthPoints -= attacker.weapon.damage
                                print("\(attacker.type) \(attacker.characterName) just hit \(target.type) \(target.characterName) with his \(attacker.weapon.weaponName) taking \(attacker.weapon.damage) healthPoints !")
                                if target.healthPoints <= 0 {
                                    target.healthPoints = 0
                                    print ("\(target.type) \(target.characterName) just died !")
                                    player.deadCharacters.append(target)
                                    player.teamSelection = player.teamSelection.filter { $0.healthPoints > 0 }}
                                if target.healthPoints > 0 {
                                    if target is Wizard {
                                        print ("Sorry the \(target.type) \(target.characterName) can't be attacked !")
                                    } else {
                                        // get set ds characters
                                        attacker.healthPoints -= target.weapon.damage
                                        if attacker.healthPoints <= 0 {
                                            attacker.healthPoints = 0
                                            print ("\(attacker.type) \(attacker.characterName) just died !")
                                            player.deadCharacters.append(attacker)
                                            player.teamSelection = player.teamSelection.filter { $0.healthPoints > 0 }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } while !isItOver()
    }
    
    func play() {
        welcome()
        start()
        createTeam()
        fight()
    }
}



// Fonction fight à réduire !!

// Définir maxHealthpoints
// Vérification des points de vie ds class Characters
