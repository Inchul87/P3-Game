import Foundation

class Game {
    var teams = [Player]()
    
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
            namePlayer()
        }
    }
    
    func namePlayer() {
        print ("Please enter your name !")
        var nameOfPlayer = ""
        repeat {
            if let name = readLine() {
                nameOfPlayer = name
            }
        } while nameOfPlayer == ""
        print ("Got it ! \(nameOfPlayer) !")
        teams.append(Player(playerName: nameOfPlayer))
        }
    
    func createTeam() { // choice remplacé par player
        for choice in teams {
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
            let nameChoice = CheckName().nameCharacter()
            
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
        for player in teams {
            player.specsTeam()
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
    
    // Fonction characterChoice à ajouter ds classe Player et fonction heal à Wizard
    func fight() {
        displaySpecs()
        var attacker: Characters
        var target: Characters
        repeat {
            for player in teams {
                print("Please select the character you want to fight with \(player.playerName) !")
                player.specsTeam()
                var characterChoice:Int
                repeat {
                    characterChoice = player.characterChoice() - 1
                } while (characterChoice < 0 || characterChoice >= player.teamSelection.count)
                if (characterChoice >= 0 && characterChoice < player.teamSelection.count) {
                    attacker = player.teamSelection[characterChoice]
                    if let wizard = attacker as? Wizard{
                        print("Please select the character you want to heal \(player.playerName) ! You can't heal yourself !")
                        player.specsTeam()
                        wizard.heal(character: player.teamSelection[player.characterChoice() - 1])
                    } else {
                  // Poubelle
                        let targetPlayer = player == 0 ? teams[1] : teams[0]
                        print("Please select the character you want to attack \(player) !")
                        targetPlayer.specsTeam()
                        repeat {
                            characterChoice = targetPlayer.characterChoice()-1
                        } while (characterChoice < 0 || characterChoice >= targetPlayer.teamSelection.count)
                        if (characterChoice >= 0 && characterChoice < targetPlayer.teamSelection.count) {
                            attacker = targetPlayer.teamSelection[characterChoice]
                            if attacker.healthPoints > 0 {
                                target.healthPoints -= attacker.weapon.damage  // to take the defense points of the character enemy
                                print(" Your \(attacker.type) \(attacker.characterName) hit the \(target.type) \(target.characterName) with his \(attacker.weapon.weaponName) taking \(attacker.weapon.damage) defense points to him.")
                                // if the target character is still alive
                                if target.healthPoints <= 0 {
                                    target.healthPoints = 0
                                    print ("\(target.type) \(target.characterName) died")
                                    targetPlayer.deadCharacters.append(target)
                                    targetPlayer.teamSelection = targetPlayer.teamSelection.filter { $0.healthPoints > 0 }}
                                // fighting in return if the opponent character is still alive
                                if target.healthPoints > 0 {
                                    if target is Wizard {
                                        print ("Your \(target.type) \(target.characterName) doesn't know how to fight.")
                                    } else {
                                        attacker.healthPoints -= target.weapon.damage  // to take the defense points of the character enemy
                                        print(" The \(target.type) \(target.characterName) hit the \(attacker.type) \(attacker.characterName) with his \(target.weapon.weaponName) taking \(target.weapon.damage) defense points to him.")
                                        if attacker.healthPoints <= 0 {
                                            attacker.healthPoints = 0
                                            print ("\(attacker.type) \(attacker.characterName) just died")
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
    
    // Fin
    func launchGame() {
        welcome()
        start()
        createTeam()
        fight()
    }
}



