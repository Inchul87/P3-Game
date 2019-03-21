class Character {
    var characterName: String
    var healthPoints: Int {
        didSet {
            if !isAlive {
                print("\(characterName) is dead !")
            }
        }
    }
    var maxNbOfHealthPoints: Int
    var weapon: Weapon
    var characterType: String
    var listOfMoves = ["Skip"]
    var moveType: String
    
    
    var isAlive: Bool {
        return healthPoints > 0
    }
    
    init(characterName: String, healthPoints: Int, maxNbOfHealthPoints: Int, weapon: Weapon, characterType: String, moveType: String) {
        self.characterName = characterName
        self.healthPoints = healthPoints
        self.maxNbOfHealthPoints = maxNbOfHealthPoints
        self.weapon = weapon
        self.characterType = characterType
        self.moveType = moveType
    }
    
    func nextMove(target: Character) {
        print("\(characterName) just hit \(target.characterName) and took him \(weapon.damage) lifePoints !")
        if weapon.damage > target.healthPoints {
            target.healthPoints = 0
        } else {
            target.healthPoints -= weapon.damage
        }
    }
    
    func selectNextMove() -> String {
        var index = 0
        print("Please select what you want to do with \(characterName) !")
        for move in listOfMoves {
            index += 1
            print("\(index) \(move) !")
        }
        while true {
            if let choice = Int(readLine()!) {
                switch choice {
                case 1 ... index:
                    return listOfMoves[choice - 1]
                default:
                    break
                }
            }
            print("Something went wrong ! Please make a choice between 1 and \(index) !")
        }
    }
}

/*
 
 func randomBox() -> Weapon {
 var weapons = Weapon.magicWeapon
 let randomCount = Int.random (in: 0..<weapons.count)
 let weapon = weapons[randomCount]
 return weapon
 }
 
 func openBox(_ character: Characters, team: Int) {
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

 */
