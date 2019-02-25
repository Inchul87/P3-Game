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
    
    func namePlayer() -> String {
        var playerName: String?
        while playerName == nil || playerName == "" {
            print("Please enter your name !")
            playerName = readLine()
        }
        print("Got it ! \(playerName!) !")
        return playerName!
    }
    
    func createTeam() {
        for _ in 0..<players {
            let team = Player()
            team.playerName = game.namePlayer()
            team.selectTeam()
            print("indiquer composition équipe")
            teams.append(team)
        }
    }
    
    func selectAttacker(from team: Int) -> Characters {
        var attacker: String?
        while !["1", "2", "3"].contains(attacker) {
            print("Please select the character you want to fight with !"
                + "\n \(teams[team].charactersName[0]) le \(teams[team].teamSelection[0].type):  \(teams[team].teamSelection[0].healthPoints)"
                + "\n \(teams[team].charactersName[1]) le \(teams[team].teamSelection[1].type): \(teams[team].teamSelection[1].healthPoints)"
                + "\n \(teams[team].charactersName[2]) le \(teams[team].teamSelection[2].type): \(teams[team].teamSelection[2].healthPoints)")
            attacker = readLine()
        }
        let character = Int(attacker!)! - 1
        let choice = teams[team].teamSelection[character]
        if choice.healthPoints <= 0 {
            print ("Sorry your character is already dead !")
            return selectAttacker(from: team)
        }
        print("The \(teams[team].teamSelection[character])\(teams[team].charactersName[character]) is now ready to fight !")
        return choice
    }
    
    func attackOrHeal() -> Int {
        var character: String?
        while !["1","2"].contains(character)  {
            print("Please make a choice ! Enter 1 to attack \(teams[0].playerName) or 2 for heal one of yours \(teams[1].playerName) !")
            character = readLine()
        }
        return Int(character!)!
    }
    
    func selectTarget(vs: Int) -> Characters {
        var target: String?
        let team = vs - 1
        while !["1", "2", "3"].contains(target) {
            print("""
                1 - \(teams[team].charactersName[0]) a \(teams[team].teamSelection[0])
                2 - \(teams[team].charactersName[1]) a \(teams[team].teamSelection[1])
                3 - \(teams[team].charactersName[2]) a \(teams[team].teamSelection[2])
                """)
            target = readLine()
        }
        let character = Int(target!)! - 1
        print("Got it ! You will fight against \(teams[team].charactersName[character]) a \(teams[team].teamSelection[character]) !")
        return teams[team].teamSelection[character]
    }
    
    func selectVictim(to: Int) -> Characters {
        var victim: String?
        while !["1", "2", "3"].contains(victim) {
            print("""
                Please select the member of your team you want to heal !
                1 - \(teams[to].charactersName[0]) a \(teams[to].teamSelection[0])
                2 - \(teams[to].charactersName[1]) a \(teams[to].teamSelection[1])
                3 - \(teams[to].charactersName[2]) a \(teams[to].teamSelection[2])
                """)
            victim = readLine()
        }
        let character = Int(victim!)! - 1
        print("You will now heal \(teams[to].charactersName[character]) a \(teams[to].teamSelection[character]) !")
        return teams[to].teamSelection[character]
    }
    
    func lifePointsRecap() {
        print("LifePoints remaining for each team !")
        for score in 0..<teams.count {
            print("""
                \(teams[score].charactersName[0]) a \(teams[score].teamSelection[0]) has \(teams[score].teamSelection[0].healthPoints) lifePoints !
                \(teams[score].charactersName[1]) a \(teams[score].teamSelection[1]) has \(teams[score].teamSelection[1].healthPoints) lifePoints !
                \(teams[score].charactersName[2]) a \(teams[score].teamSelection[2]) has \(teams[score].teamSelection[2].healthPoints) lifePoints !
                """)
        }
    }
    
    func fight() {
        for player in 0..<teams.count {
            guard teams[player].score > 0 else {
                print ("Game Over ! All of your characters are dead !")
                return
            }
            let attacker = selectAttacker(from: player)
            if let wizard = attacker as? Wizard {
                let victim = selectVictim(to: player)
                wizard.heal(healing: victim)
            } else {
                let character = attackOrHeal()
                specsTeam(team: character)
                let target = selectTarget(vs: character)
                showBox(attacker, team: player)
                attacker.attack(vs: target)
            }
            lifePointsRecap()
        }
    }
    
    func randomBox() -> Weapon {
        var weapons = Weapon.magicWeapon
        let randomCount = Int.random (in: 0..<weapons.count)
        let weapon = weapons[randomCount]
        return weapon
    }
    
    func showBox(_ character: Characters, team: Int) {
        guard character.healthPoints > 0 else {
            print ("Sorry you are already dead !")
            return
        }
        let random = Int.random (in: 0..<50)
        if random > 10 && random < 25 {
            character.weapon = randomBox()
            print("Congratulations ! You just found a new weapon ! A \(randomBox()) with \(randomBox().damage) damage to your opponent !")
            // Bonus ?
        }else if random > 20 && random < 35 {
            character.healthPoints += 50
            print("Super Potion")
        }
    }
    
   func specsTeam(team: Int) {
        let team = team - 1
        for characters in 0 ..< Player().maxTeamSelection {
            print("\(teams[team].charactersName[characters]) a \(teams[team].teamSelection[characters]) : \(teams[team].teamSelection[characters].description)")
        }
    }
    
    // Ajouter plusieurs armes bonus aléatoirement !

}

